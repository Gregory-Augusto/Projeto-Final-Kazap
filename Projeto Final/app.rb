require 'sequel'

DB = Sequel.sqlite('db/bank.db')

require_relative 'models/client'
require_relative 'models/phone'
require_relative 'models/account'
require_relative 'models/transfer'
require_relative 'models/pix'
require_relative 'models/ted'
require_relative 'models/transaction'
require_relative 'models/deposit'
require_relative 'models/withdraw'
require_relative 'models/overdraft'

# Depois que criar as classes, usar o require para elas

# As instâncias serão feitas aqui 