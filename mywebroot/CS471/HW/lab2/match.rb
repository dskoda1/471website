#!/usr/bin/ruby

def match_file(name, regex)
  return false unless File.exists?(name)
  file = File.open(name, "r")
  match = file.read().scan(regex)

  match.each do |m|
    # Handle each match object appropriately
  end

end

if ARGV.length < 1 
  puts "usage: match.rb [FILE_NAME]" % ARGV[0]
  exit
end

# Set regex to be a regular expression that matches C identifiers
regex = //
match_file(ARGV[0], regex)




