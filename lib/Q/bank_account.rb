module Q
  # bank billing and account information
  # this class is used by users and firms
  class Bank_Account
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
      case mode
      when MODE_KNRBLZ
        @blz  = bicOrBlz
        @knr  = ibanOrKnr
        @bic  = nil
        @iban = nil
  
      when MODE_IBANBIC
        @bic  = bicOrBlz
        @iban = ibanOrKnr
        @blz  = nil
        @knr  = nil
  
      else
        @mode = MODE_INVALID
        #warn("Bankaccount initialized with unknown mode [#{mode}] at #{caller[0]}.")
      end
  
      @holder = holder
      @institute = institute
  
    end
  
    def iban=(i)
      @iban = i
    end
  
    def bic=(b)
      @bic = b
    end
  
    def blz=(b)
      @blz=b
    end
  
    def knr=(k)
      @knr=k
    end
  
  end
end
