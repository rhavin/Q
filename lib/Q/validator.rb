module Q
  require 'Q'
  class Validator
    def initialize(obj, onInvalidateFn)
      @obj   = obj
      @block = onInvalidateFn
    end

    def invalidate(str, arrAttr)
      Console.out(Console.txWarn(Console.txFormat(str, arrAttr)))
      if (@block) then @block.call() end
    end
  end
end

