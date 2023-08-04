require_relative 'modules/module_deposit'
require_relative 'modules/module_withdraw'

class Transaction
    def self.deposit(account, amount)
      Deposit.add_funds_to_account(account, amount)
    end
  
    def self.withdraw(account, amount)
      Withdraw.withdraw_money(account, amount)
    end
end

