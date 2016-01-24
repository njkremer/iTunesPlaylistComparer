require 'rubygems'
require 'bundler/setup'
require 'fileutils'

require 'plist'

file1Path = ARGV[0];
file2Path = ARGV[1];

# Check to make sure path was supplied
if (file1Path == nil || file2Path == nil) then
    puts 'Usage: ruby comparer.rb {file1} {file2}'
    exit(0);
end


file1Plist = Plist::parse_xml(file1Path);
file2Plist = Plist::parse_xml(file2Path);

tracks1 = file1Plist['Tracks'];
tracks2 = file2Plist['Tracks'];

puts "Playlist 1"
puts "-----------------------------"
tracks1.each do |trackId, trackHash|
    puts "Track (#{trackId}): #{trackHash['Name']}, #{trackHash['Artist']}";    
end

puts "\nPlaylist 2"
puts "-----------------------------"
tracks2.each do |trackId, trackHash|
    puts "Track (#{trackId}): #{trackHash['Name']}, #{trackHash['Artist']}";    
end