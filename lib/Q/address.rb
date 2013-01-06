module Q
  # a physical (real world) address
  # this class is used by users and firms
  class Address

    attr_reader :plz, :town, :street, :number, :country, :state
    
    @type = Q::Flags.new()

    def initialize(plzOrZip, town, street, number, country, state)
      
    end

  end
end

