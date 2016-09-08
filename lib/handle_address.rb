require 'rubygems'
require 'open-uri'
require 'json'
require "awesome_print"

require_relative '../app/models/address.rb'

# Read a data file using the open-uri gem.
filename = "db/feeds/address_example.json"
data = open(filename) { |io| io.read }
ap data

ap Address.new(data).source
