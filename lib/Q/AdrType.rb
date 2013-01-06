module Q
  # This module provides generic flags-constants for addresses, urls,
  # fone-numbers, mail-accounts etc. All those flags may be logically
  # combined and tested against the group-flags.^
  module AdrType
    # Allows FAX receiving
    FAX       = 0x0000001
    # Allows MAIL receiving
    MAIL      = 0x0000002
    # Postal Address
    POSTAL    = 0x0000004
    # Fone Number
    FONE      = 0x0000008
    # ICQ Contact
    ICQ       = 0x0000010
    # Facebook Profile
    FACEBOOK  = 0x0000020
    # XING Profile
    XING      = 0x0000040
    # Domain / Homepage
    DOMAIN    = 0x0000080
    # Eligible for billing and bussiness contacts
    BILLING   = 0x0000100
    # This address/fone may be used for site-contact (regarding account etc.)
    ADMIN     = 0x0000200
    # Advertising may be send to this address/fone
    ADVERTISE = 0x0000400
    # Accepts Newsletter
    NEWS      = 0x0000800

    # :section: Group Masks

    # Flags allowed for mail-adresses
    MAILFLAGS = MAIL | BILLING | ADMIN | ADVERTISE | NEWS
    # Flags allowed for fone numbers
    FONEFLAGS = FONE | FAX | ADMIN | BILLING
    # Flags allowed for postal addresses
    POSTFLAGS = POSTAL | BILLING | ADMIN | ADVERTISE
    
    # get user-friendly name for given flag
    # names defined in lang-directory (i18n-system)
    # returns first found matching flag
    def AdrType.getName(s)
      # we iterate over modules constants 
      AdrType.constants.each do |c|
        return t("AdrType_#{c}") if (AdrType.const_get(c) == s)
      end
    end

    # get array of user-friendly flag-names for given
    # flagsvalue s. 
    def AdrType.getArray(s)
      ret = Array.new()
      a = 1
      # we test each bit by looping thru a bitshift
      31.times do |f|
        ret.push(getName(a)) if (s & a != 0) 
        a <<= 1
      end
      return ret
    end
 
  end
end
