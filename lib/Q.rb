require 'i18n'
require 'Q/address'
require 'Q/phone'
require 'Q/bankaccount'
require 'Q/version'
require 'Q/console'
require 'Q/validator'

def t(text);I18n.t(text);end
I18n.load_path = Dir['lang/**/*.yml']
# Namespace providing module for common widely used data structures
# currently providing:
# [Q::Phone]
#   telephone numbers
# [Q::BankAccount]
#   IBAN/BIC and KNR/BLZ self-containing account class
# [Q::Address]
#   real-world adresses
# [Q::Console]
#   programm service ans maintainance information
module Q

end
