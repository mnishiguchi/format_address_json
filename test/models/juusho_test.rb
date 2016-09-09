require "test_helper"
require "json"


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


def valid_json?(json)
  begin
    JSON.parse(json)
    return true
  rescue Exception => e
    return false
  end
end


describe Juusho do

  it "#from_json" do
    address = Juusho.new.from_json(json_object)
    assert address.is_a? Juusho
    assert address.address == "8782 Cloudleap Ct "
  end

  it "#to_json" do
    address = Juusho.new.from_json(json_object)
    assert address.is_a? Juusho
    assert valid_json?(address.to_json)
  end

  it "#attributes" do
    address = Juusho.new.from_json(json_object)
    assert address.attributes.is_a? Hash
    assert address.attributes["zip"] == "21045"
  end
end
