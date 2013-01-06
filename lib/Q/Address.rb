require 'Q'

module Q
  # a physical (real world) address
  # this class is used by users and firms
  class Address < AdrFlaggedObj

    # PLZ, ZIP-Code or some other country-dependent postal code
    attr_accessor :plz
    # Name of the Street
    attr_accessor :street
    # Housnumber
    attr_accessor :number
    # custom address specifier
    attr_accessor :custom

    attr_reader :town, :country, :state
 
    def initialize(plzOrZip = nil, town = nil, street = nil, number = nil, country = nil, state = nil)
      super(Q::AdrType::POSTAL, Q::AdrType::POSTFLAGS)
      # Flags asoziated with this address
      @plz     = plzOrZip
      @town    = town
      @street  = street
      @number  = number
      @country = country
      @state   = state 
    end


  end
end

