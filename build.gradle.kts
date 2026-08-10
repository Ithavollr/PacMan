import xyz.jpenilla.runpaper.task.RunServer
import java.nio.file.Files
import java.nio.file.StandardCopyOption
import kotlin.io.path.*

repositories {
    mavenCentral()
}

plugins {
    java
    kotlin("jvm") version "2.1.20-RC3"
    id("xyz.jpenilla.run-paper") version "2.3.1"
}

dependencies {
    implementation(kotlin("stdlib"))
}

val mcVersion = "1.21.4"

val prodPlugins = runPaper.downloadPluginsSpec {
    modrinth("multiverse-core", "5.2.0")
    modrinth("essentialsx", "2.21.0")
    hangar("chunky", "1.4.40")
    modrinth("squaremap", "1.3.4")
}

val testPlugins = runPaper.downloadPluginsSpec {
    github("Ifiht", "AutoStop", "v1.2.0", "AutoStop-1.2.0.jar")
}


// Delete & copy data and pack.mcmeta before running the server.
// A task (not a script function) so the run tasks stay configuration-cache safe:
// closures may only capture plain Files, never the script object.
tasks.register("syncDataPack") {
    dependsOn("genDatapack") // CI has no data_v61; regenerate from committed sources/
    val worldDirs = listOf("world", "world_nether", "world_the_end")
        .map { layout.projectDirectory.dir("run/worlds/$it").asFile }
    val sourceDataDir = layout.projectDirectory.dir("data_v61/data").asFile
    val targetDataDir = layout.projectDirectory.dir("run/worlds/world/datapacks/test/data").asFile
    val sourcePackMcmeta = layout.projectDirectory.file("dpack.mcmeta").asFile
    val targetPackMcmeta = layout.projectDirectory.file("run/worlds/world/datapacks/test/pack.mcmeta").asFile
    doLast {
        // Delete existing world directories if they exist
        worldDirs.forEach { worldDir ->
            if (worldDir.exists()) {
                worldDir.deleteRecursively()
                println("Deleted existing world directory: $worldDir")
            }
        }
        // Sync data directory
        if (sourceDataDir.exists()) {
            if (targetDataDir.exists()) {
                targetDataDir.deleteRecursively() // Delete old contents
            }
            Files.createDirectories(targetDataDir.toPath()) // Ensure target directory exists
            sourceDataDir.copyRecursively(targetDataDir, overwrite = true) // Copy new contents
            println("Synced data directory to $targetDataDir")
        } else {
            println("Warning: Source data directory does not exist!")
        }
        // Copy pack.mcmeta
        if (sourcePackMcmeta.exists()) {
            Files.createDirectories(targetPackMcmeta.toPath().parent) // Target parent may not exist
            Files.copy(sourcePackMcmeta.toPath(), targetPackMcmeta.toPath(), StandardCopyOption.REPLACE_EXISTING)
            println("Copied pack.mcmeta to $targetPackMcmeta")
        } else {
            println("Warning: pack.mcmeta file does not exist!")
        }
    }
}

// Test PaperMC run & immediately shut down, for github actions
tasks.register<RunServer>("runServerTest") {
    minecraftVersion(mcVersion)
    downloadPlugins.from(testPlugins)
    dependsOn("syncDataPack")
    val eulaFile = layout.projectDirectory.file("run/eula.txt").asFile
    doFirst {
        eulaFile.apply { parentFile.mkdirs() }.writeText("eula=true\n")
    }
}
// Start a local PaperMC test server for login & manual testing
tasks.register<RunServer>("runServerInteractive") {
    minecraftVersion(mcVersion)
    downloadPlugins.from(prodPlugins)
    dependsOn("syncDataPack") // Run before the server starts
}

// Test PaperMC run & immediately shut down, but don't delete or modify anything
tasks.register<RunServer>("runServerUnmodified") {
    minecraftVersion(mcVersion)
    downloadPlugins.from(testPlugins)
}

// Generate + zip the datapack and resource pack for consumers (e.g. the Cardinal monorepo).
// wozniak: gen scripts declare no inputs/outputs, so they rerun every invocation; if the
// rsync passes ever get slow, add inputs.dir("sources") + outputs.dir(...) for up-to-date checks.
val genDatapack = tasks.register<Exec>("genDatapack") {
    workingDir = projectDir
    commandLine("./dpak_gen.sh")
}
val genResourcePack = tasks.register<Exec>("genResourcePack") {
    workingDir = projectDir
    commandLine("./rpak_gen.sh")
}
val zipDatapack = tasks.register<Zip>("zipDatapack") {
    dependsOn(genDatapack)
    from("data_v61")
    archiveFileName.set("Ithavollr_dpack.zip")
    destinationDirectory.set(layout.buildDirectory)
}
val zipResourcePack = tasks.register<Zip>("zipResourcePack") {
    dependsOn(genResourcePack)
    from("assets_v46")
    archiveFileName.set("Ithavollr_rpack.zip")
    destinationDirectory.set(layout.buildDirectory)
}
tasks.register("buildPacks") {
    dependsOn(zipDatapack, zipResourcePack)
}
