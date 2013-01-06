require 'Q'

module Q
  # a physical (real world) address
  # this class is used by users and firms
  class Address

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

      # Flags asoziated with this address
      @type    = Q::Flags.new(Q::AdrType::POSTAL)
      @plz     = plzOrZip
      @town    = town
      @street  = street
      @number  = number
      @country = country
      @state   = state 
    end

    # This address may be used for the given flags
    def usageAllow(typeFlags)
      @type.set(typeFlags & Q::AdrType::POSTFLAGS)
    end

    # This address shall *not* be used or the given flags
    def usageDeny(typeFlags)
      @type.clear(typeFlags & Q::AdrType::POSTFLAGS) 
    end

    # True if all given flags allowed
    def usageAllowed?(typeFlags)
      return @type.tstAll?(typeFlags)
    end

    # returns flags for this address
    def usage()
      return @type.get()
    end

  end
end

