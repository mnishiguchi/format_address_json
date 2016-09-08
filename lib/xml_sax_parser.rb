require 'rubygems'
require 'open-uri'
require 'json'
require "oga"
require "awesome_print"

# Check current working directory.
puts Dir.pwd

# Read a data file using the open-uri gem.
filename = "db/feeds/addresses.xml"
xml = open(filename) { |io| io.read }
ap xml

class SaxHandler
  def on_element(namespace, name, attrs = {})
    puts name
  end
end

handler = SaxHandler.new
parser  = Oga::XML::SaxParser.new(handler, xml)
doc = parser.parse

# ap doc
