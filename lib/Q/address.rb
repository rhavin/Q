require 'Q'

module Q
  # a physical (real world) address
  # this class is used by users and firms
  class Address

    attr_reader :plz, :town, :street, :number, :country, :state
    

    def initialize(plzOrZip = nil, town = nil, street = nil, number = nil, country = nil, state = nil)

      # Flags asoziated with this address
      @type = Q::flags.new(Q::adrtype::POSTAL)

      # PLZ, ZIP-Code or some other country-dependent postal code
      @plz     = plzOrZip
      @town    = town
      @street  = street
      @number  = number
      @country = country
      @state   = state 
    end

    # This address may be used for the given flags
    def usageAllow(typeFlags)
      @type.set(typeFlags & Q::adrtype::POSTFLAGS)
    end

    # This address shall *not* be used or the given flags
    def usageDeny(typeFlags)
      @type.clear(typeFlags & Q::adrtype::POSTFLAGS) 
    end

    # True if all given flags allowed
    def usageAllowed?(typeFlags)
      return @type.tstAll(typeFlags)
    end

  end
end

