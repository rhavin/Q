require 'Q'

module Q
  # Baseclass providing generic AdrType functionality
  class AdrFlaggedObj

    def initialize(initialFlags = 0, initialFlagMask = 0)
      @validator = Validator.new(self, method(:onInvalidate))
      @type      = Q::Flags.new(initialFlags)
      @mask      = initialFlagMask
    end

    # Allow usage for the goven flags in typeFlags.
    def usageAllow(typeFlags)
      @type.set(typeFlags & @mask)
    end

    # Disallow usage for the given flags in typeFlags.
    def usageDeny(typeFlags)
      @type.clear(typeFlags & @mask) 
    end

    # True if all given flags allowed
    def usageAllowed?(typeFlags)
      return @type.tstAll?(typeFlags)
    end

    # returns flags for this address
    def usage()
      return @type.get()
    end

    # returns array of user-friendly names for the specified flags
    # of this adress
    def usageToArray()
      return Q::AdrType.getArray(@type.get());
    end

    # handler called if object has been invalidated
    def onInvalidate(valid)
      @type.setValid(valid)
    end

    # check if address has been marked valid (default)
    def valid?()
      return @type.valid?()
    end

  end
end

