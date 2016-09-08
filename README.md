# Fomat address json

## Usage

```rb
require 'open-uri'
require 'json'

# Read a data file using the open-uri gem.
json_array  = open("db/feeds/addresses.json") { |io| io.read }
json_object = open("db/feeds/address.json") { |io| io.read }

addresses = Address.from_json_array(json_array)
a_address = Address.from_json_object(json_object)
```
