module Q
  # generic binary flag object
  class FlagValue < Fixnum

    #
    def initialize(n = 0)
      super(n)
    end
    
    # check for given flags
    def test?(flags); (@flags & flags != 0); end

    # add given flags
    def self.|(f,g); ( f.flags | g.flags ); end

    # remove given flags
    def sub!(flags); (@flags &= ~flags); end

  end
end
