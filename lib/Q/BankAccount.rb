module Q
  # bank billing and account information
  # this class is used by users and firms
  class BankAccount
    require 'Q'
    include Q

    # IBAN/BIC is new format
    attr_reader :iban, :bic
    # BLZ/KNR is old german format
    attr_reader :blz, :knr
    # name of the account holder and institute
    attr_accessor :holder, :institute
  
    # object representing KNR/BLZ type account
    MODE_KNRBLZ = 0
    # object representing IBAN/BIC type account
    MODE_IBANBIC = 1
    # object un- or erroneous initialized
    MODE_INVALID = -1
  
    # constructor, specify mode constant MODE_.. for account
    def initialize(mode, ibanOrKnr, bicOrBlz, holder, institute)
      @mode = mode
      # original mode saved for automatic revalidation thru validator
      @oldmode = mode
      @validator = Validator.new(self, method(:onInvalidate))
      case mode
      when MODE_KNRBLZ
	self.blz=bicOrBlz
        self.knr=ibanOrKnr
        @bic  = nil
        @iban = nil
  
      when MODE_IBANBIC
        self.bic=bicOrBlz
        self.iban=ibanOrKnr
        @blz  = nil
        @knr  = nil
  
      else
        @validator.invalidate(t(:bankaccount_unknown_mode), [mode])

      end
  
      @holder = holder
      @institute = institute
    end

    # handler called if object has been invalidated
    def onInvalidate(valid)
      if (valid)
        @mode = @oldmode
      else
        @mode = MODE_INVALID
      end
    end
  
    # Set account to given IBAN. An IBAN consists of up to 34
    # uppercase alphanumeric latin chars.
    def iban=(i)
      setI = i
      # we accept separating whitespace but remove it
      setI.gsub!(/\s+/, '')
      unless (setI.match(/^[0-9A-Z]{6,34}$/))
        @oldmode = mode
        @validator.invalidate(t(:bankaccount_inv_iban), [i, 34]) 
        return
      end
      Console.nyi('check IBAN checksum')
      @iban = setI
    end

    # Set account to giveb BIC. According to ISO 9362
    # (http://en.wikipedia.org/wiki/ISO_9362) the BIC is
    # composed of 8 or 11 alphanumeric uppercase latin chars.
    def bic=(b)
      setB = b
      # we accept separating whitespace but remove it
      setB.gsub!(/\s+/, '')
      # 8 char format is assumed to mean 'main office',
      # commonly denoted with XXX-padding
      if (setB.length == 8) then setB += 'XXX' end
      if (setB.match(/^[0-9A-Z]{11}$/))
        @bic = setB
      else
        @oldmode = mode
        @validator.invalidate(t(:bankaccount_inv_bic), [b, 8, 11]) 
      end
    end
  
    def blz=(b)
      @blz=b
    end
  
    def knr=(k)
      @knr=k
    end

    def to_a # :nodoc:
      case @mode
      when MODE_KNRBLZ  then [@holder, @institute, @blz, @knr]
      when MODE_IBANBIC then [@holder, @institute, @iban, @bic]
      else [@holder, @institute]
      end
    end

    def to_s # :nodoc:
      to_a.join("\n")
    end

    def inspect # :nodoc:
      Console.txRef('BankAccount') + ': mode=' + @mode.to_s + ' [' + to_a.join('|') + ']'
    end

  end
end
