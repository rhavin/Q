module Q
  # a telephone number
  # this class is used by users and firms, a simple wrapper to be extended
  class Phone
    attr_accessor :number

    def initialize(num)
      @number = num
    end

    def to_s
      @number
    end

    def inspect
      'Phone: [' + @number + ']'
    end

  end
end

