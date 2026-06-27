require 'find'
require 'securerandom'

# Max number of threads to use
MAX_THREADS = 6

# Directory to crawl
if ARGV[0].empty? || ARGV[0].nil?
  puts "You must specify a directory!"
  exit(1)
else
  directory = ARGV[0]
end

# Queue to hold files to process
queue = Queue.new

# Find all PNG files and add them to the queue
Find.find(directory) do |path|
  if File.file?(path) && File.extname(path).downcase == '.png'
    queue << path
  end
end

# Array to hold thread references
threads = []

# Start threads
MAX_THREADS.times do
  threads << Thread.new do
    while !queue.empty?
      begin
        file = queue.pop(true) rescue nil
        next unless file
        puts "Compressing: #{file}"
        
        # Generate a unique temporary filename
        temp_file = "#{File.dirname(file)}/#{SecureRandom.hex}.png"

        # Run pngcrush to compress the file into the temporary file
        result = system("pngcrush", "-brute", "-reduce", file, temp_file)

        if result && File.exist?(temp_file)
          # Replace the original file with the compressed file
          File.rename(temp_file, file)
          puts "Replaced original with compressed: #{file}"
        else
          warn "Compression failed for: #{file}"
          File.delete(temp_file) if File.exist?(temp_file)
        end
      rescue => e
        warn "Error processing file: #{e.message}"
      end
    end
  end
end

# Wait for all threads to finish
threads.each(&:join)
