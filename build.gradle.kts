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


// Function to delete & copy data and pack.mcmeta before running the server
fun syncDataPack() {
    val worldDirs = listOf(
        file("run/worlds/world").toPath(),
        file("run/worlds/world_nether").toPath(),
        file("run/worlds/world_the_end").toPath()
    )
    // Delete existing world directories if they exist
    worldDirs.forEach { worldDir ->
        if (worldDir.exists()) {
            worldDir.toFile().deleteRecursively()
            println("Deleted existing world directory: $worldDir")
        }
    }
    // Create new world directories
    val sourceDataDir = file("data_v61/data").toPath()
    val targetDataDir = file("run/worlds/world/datapacks/test/data").toPath()
    val sourcePackMcmeta = file("dpack.mcmeta").toPath()
    val targetPackMcmeta = file("run/worlds/world/datapacks/test/pack.mcmeta").toPath()

    // Sync data directory
    if (sourceDataDir.exists()) {
        if (targetDataDir.exists()) {
            targetDataDir.toFile().deleteRecursively() // Delete old contents
        }
        Files.createDirectories(targetDataDir) // Ensure target directory exists
        sourceDataDir.toFile().copyRecursively(targetDataDir.toFile(), overwrite = true) // Copy new contents
        println("Synced data directory to $targetDataDir")
    } else {
        println("Warning: Source data directory does not exist!")
    }

    // Copy pack.mcmeta
    if (sourcePackMcmeta.exists()) {
        Files.copy(sourcePackMcmeta, targetPackMcmeta, StandardCopyOption.REPLACE_EXISTING)
        println("Copied pack.mcmeta to $targetPackMcmeta")
    } else {
        println("Warning: pack.mcmeta file does not exist!")
    }
}


// Test PaperMC run & immediately shut down, for github actions
tasks.register<RunServer>("runServerTest") {
    minecraftVersion(mcVersion)
    downloadPlugins.from(testPlugins)
    doFirst {
        syncDataPack()
        file("run/eula.txt").apply { parentFile.mkdirs() }.writeText("eula=true\n")
    }
}
// Start a local PaperMC test server for login & manual testing
tasks.register<RunServer>("runServerInteractive") {
    minecraftVersion(mcVersion)
    downloadPlugins.from(prodPlugins)
    doFirst { syncDataPack() } // Run before the server starts
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
