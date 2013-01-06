module Q
  require 'Q'

  # The validator provides common functionality for all
  # validatable objects.
  class Validator
    # initialize this object with a reference to the validatable
    # object and a function called if object gets invalid
    def initialize(obj, onInvalidateFn)
      @obj   = obj
      @block = onInvalidateFn
    end

    # Invalidate the object. Given string *str* contains format-code
    # that will be substituted with given attribute array *arrAttr*'s
    # elements
    def invalidate(str, arrAttr)
      Console.out(Console.txWarn(Console.txFormat(str, arrAttr)))
      if (@block) then @block.call(false) end
    end

    # return object to valid state
    def valid()
      if (@block) then @block.call(true) end
    end
  end
end

