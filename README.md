# Fomat address json

```rb
require 'json'

=begin
The Address class represents our defined address format. Also it acts as
a formatter from various JSON into our format.

Usage:
  addresses = Address.from_json_array(json_array)
  a_address = Address.from_json(json)

  a_address == addresses[3]
  a_address.to_h
  a_address.zip
=end

class Address
  attr_reader :source, :address, :city, :state, :zip, :country, :po_box

  # Takes a hash that contains address info.
  # Normalize/sanitize each field and store in corresponding instance valiable.
  def initialize(source_hash)
    @source  = source_hash
    @address = @source[:address] || @source[:address1]
    @city    = @source[:city]
    @state   = @source[:state]
    @zip     = @source[:zip] || @source[:zip_code] || @source[:postal_code]
    @country = @source[:country]
    @po_box  = @source[:po_box]
    freeze
  end

  # Takes a JSON array of addresses and converts it into an array of
  # Address objects.
  def self.from_json_array(json_array)
    JSON.parse(json_array, symbolize_names: true).map { |object| new(object) }
  end

  # Takes a single JSON object and converts it into an Address objects.
  def self.from_json(json)
    new(JSON.parse(json, symbolize_names: true))
  end

  # The hash representation of the address in our format.
  def to_h
    instance_variables.map do |var|
      [var[1..-1].to_sym, instance_variable_get(var)]
    end.to_h
  end

  def ==(other)
    @source == other.source
  end

  private

  # Utility methods here...

end
```


```rb
=begin
The Juusho class represents our defined address format. Also it acts as
a formatter from various JSON into our JSON format.
The ActiveModel::Serializers::JSON module automatically define #from_json and
#to_json methods based on our implementation of #attributes=(hash) and
#attributes methods.

Usage:
  address = Juusho.new.from_json(json_object)
  json = address.to_json
  hash = address.attributes
  city = address.attributes["city"]
=end

class Juusho
  include ActiveModel::Serializers::JSON

  attr_accessor :source, :address, :city, :state, :zip, :country, :po_box

  # Takes a hash that contains address info and coerce it into our format.
  # Gets called when #from_json method is invoked.
  def attributes=(hash)
    @source = hash.symbolize_keys
    @address = @source[:address] || @source[:address1]
    @city    = @source[:city]
    @state   = @source[:state]
    @zip     = @source[:zip] || @source[:zip_code] || @source[:postal_code]
    @country = @source[:country]
    @po_box  = @source[:po_box]
  end

  # The hash representation of the address in our format.
  # Gets called when #to_json method is invoked.
  def attributes
    instance_variables.map do |var|
      [var[1..-1], instance_variable_get(var)]
    end.to_h
  end

  private

  # Utility methods here...

end
```
