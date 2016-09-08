require 'rubygems'
require 'open-uri'
require 'json'
require "awesome_print"

# Check current working directory.
puts Dir.pwd

# Read a data file using the open-uri gem.
filename = "db/feeds/parsed_feed_example.json"
data = open(filename) { |io| io.read }
ap data

# Convert the JSON to ruby object
list = JSON.parse(data, symbolize_names: true)

# Examine the first element.
ap list[0][:address]
