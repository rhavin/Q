module Q
  # a telephone number
  # this class is used by users and firms, a simple wrapper to be extended
  class Phone
    attr_accessor :number

    # initialize new object with given number *num*
    def initialize(num)
      @number = num
    end

    def to_s # :nodoc:
      @number
    end

    def inspect # :nodoc:
      'Phone: [' + @number + ']'
    end

  end
end

