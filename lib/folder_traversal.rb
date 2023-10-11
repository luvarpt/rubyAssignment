# frozen_string_literal: true
require 'digest'
require 'colorize'

class Folder_traversal
  BUFFER_SIZE = 32 * 1024

  def compare_binary_files(file1_path, file2_path)
    File.open(file1_path, 'rb') do |file1|
      File.open(file2_path, 'rb') do |file2|
        while (chunk1 = file1.read(BUFFER_SIZE)) && (chunk2 = file2.read(BUFFER_SIZE))
          return false if chunk1 != chunk2
        end
      end
    end

    true
  end
  def traverse path
    path.methods
    Dir.foreach("sampleData") {|x| puts "Got #{x}" }
    "Done"
  end
  def find_duplicate_files(root_dir, file_mask)
    puts "find duplicate files method is about to start search in #{root_dir} directory using \"#{file_mask}\" file mask.".light_blue
    # Create a hash to store file paths by their MD5 checksum
    md5_hash = Hash.new { |hash, key| hash[key] = [] }

    # Traverse the root directory and its subdirectories
    Dir.glob(File.join(root_dir, '**', file_mask)).each do |file|
      next if File.directory?(file)
      # Calculate the MD5 checksum of the file
      md5 = Digest::MD5.file(file).hexdigest
      # Add the file path to the hash under the corresponding MD5 checksum
      md5_hash[md5] << file
      puts "New file and hash: #{md5}: #{file}"
    end

    puts "=" * 30
    puts "Print MD5 duplicates".green
    # Print out the duplicate files according MD5 hashes
    md5_hash.each do |md5, file_list|
      if file_list.size > 1
        puts "Duplicate by MD5: #{md5}"
        file_list.each { |file| puts "  #{file}" }
      end
    end

    puts "=" * 30
    puts "Going to actually check if given files are exactly same, using binary comparison of files".red
    md5_hash.each do |md5, file_list|
      if file_list.size > 1
        puts "Duplicate by MD5, verified by actual content: #{md5}"
        file_list.each_with_index do |file1, index1|
          file_list.each_with_index do |file2, index2|
            next if index1 >= index2  # Avoid duplicate pairs and self-pairs
            if compare_binary_files(file1, file2)
              puts "duplicate: #{file1.green} is same as #{file2.green}"
            end
          end
        end
      end
    end
  end
end
