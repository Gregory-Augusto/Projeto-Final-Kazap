require 'sequel'

DB = Sequel.sqlite('db/bank.db')

require './models/client'
require './models/phone'
require './models/account'
require './models/transfer'
require './models/pix'
require './models/ted'
require './models/transaction'
require './models/deposit'
require './models/withdraw'
require './models/overdraft'

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