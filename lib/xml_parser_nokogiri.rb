require 'nokogiri'
require "awesome_print"

# Check current working directory.
puts Dir.pwd

# Read a data file using the open-uri gem.
filename = "db/feeds/parsed_feed_example.json"
xml = open(filename) { |io| io.read }
ap xml

# Parse xml using Nokogiri.
doc = Nokogiri.XML(xml)

# Get XPATHs.
# http://stackoverflow.com/a/15692699/3837223
xpaths = []
doc.xpath('//*[child::* and not(child::*/*)]').each { |node| xpaths << node.path }

ap xpaths
