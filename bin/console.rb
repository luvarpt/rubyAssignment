# frozen_string_literal: true

require '../lib/folder_traversal'
require 'optparse'

options = {
  folder: "../sampleData",
  mask: "*.txt"
}
OptionParser.new do |opts|
  opts.banner = "Usage: console.rb [options]
this sample program is used to search for duplicate files in folder. It is
using md5 hash to search for possible duplicates and than it is using binary
(byte-by-byte) comparison to verify, that given possible duplicates are exactly
the same.

EXAMPLE usage:
ruby console.rb -m '**' -f '../'
Will search all files in parent folder

ruby console.rb -m '*.png' -f '../
Will search for all files with png extension in parent folder.
"

  opts.on("-f", "--folder FOLDER", "Specify a folder to be used for search. Default value is \"../sampleData\"") do |folder|
    options[:folder] = folder
  end

  opts.on("-m", "--mask MASK", "Specify a file mask when considering files to duplicate search. Default value is \"*.txt\"") do |mask|
    options[:mask] = mask
  end

  opts.on("-h", "--help", "Print this help") do
    puts opts
    exit
  end
end.parse!

# Access parsed options here
puts "File: #{options[:folder]}" if options[:folder]
puts "Mask: #{options[:mask]}" if options[:mask]

puts "Going to traverse defined sampleData folder and print results."

# Folder_traversal.new.find_duplicate_files("../sampleData", "*.txt")
Folder_traversal.new.find_duplicate_files(options[:folder], options[:mask])

puts "Program is about to end."