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


require './modules/module_deposit'
require './modules/module_pix'
require './modules/module_ted'
require './modules/module_withdraw'


require './classes/class_account'
require './classes/class_client'
require './classes/class_phone'
require './classes/class_transaction'
require './classes/class_transfer'

# As instâncias serão feitas aqui 