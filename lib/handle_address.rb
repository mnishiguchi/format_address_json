require 'rubygems'
require 'open-uri'
require 'json'
require "awesome_print"
require 'pry'

require_relative '../app/models/address.rb'

# Read a data file using the open-uri gem.
json_array  = open("db/feeds/addresses.json") { |io| io.read }
json_object = open("db/feeds/address.json") { |io| io.read }

addresses = Address.from_json_array(json_array)
a_address = Address.from_json_object(json_object)

a_address == addresses[3]
a_address.to_h
ap a_address.zip

addresses.each do |address|
  ap address.to_h
end

# binding.pry
# p "end"
