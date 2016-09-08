require 'json'

class Address
  attr_reader :source, :address, :city, :state, :zip, :country, :po_box

  def initialize(json)
    @source = JSON.parse(json)
  end

  def address

  end


end
