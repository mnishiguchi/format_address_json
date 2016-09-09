require "test_helper"

# ===
# Example data
# ===

def json_array
  <<-data
    [{
      "address1": "4849 Connecticut Ave. NW",
      "city":  "Washington",
      "state":  "DC",
      "zip":  "20008"
    },
    {
      "address1": "625 East Monroe Ave",
      "city":  "Alexandria",
      "state":  "VA",
      "zip":  "22301",
      "country":  "United States",
      "po_box":  "nil",
      "mailing_address": "nil",
      "shipping_address": "nil"
    }]
  data
end

def json_object
  <<-data
    {
      "address1": "8782 Cloudleap Ct ",
      "city":  "Columbia",
      "state":  "MD",
      "zip":  "21045",
      "country":  "USA",
      "po_box":  "nil",
      "mailing_address": "nil",
      "shipping_address": "nil"
    }
  data
end


# ===
# Test
# ===

describe Address do

  it ".from_json" do
    address = Address.from_json(json_object)
    assert address.is_a? Address
    assert address.address == "8782 Cloudleap Ct "
  end

  it ".from_json_array" do
    addresses = Address.from_json_array(json_array)
    assert addresses.is_a? Array
    assert addresses.first.city == "Washington"
  end

  it "#==" do
    addresses = Address.from_json_array(json_array)
    refute addresses[0].object_id == addresses[0].clone.object_id
    assert addresses[0] == addresses[0].clone
    refute addresses[0] == addresses[1]
  end

  it "#to_h" do
    address = Address.from_json(json_object)
    assert address.is_a? Address
    assert address.to_h.is_a? Hash
  end
end
