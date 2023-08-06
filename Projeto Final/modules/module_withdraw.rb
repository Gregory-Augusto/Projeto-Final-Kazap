module Withdraw
    DB = Sequel.connect('sqlite://db/bank.db')
    
    def self.withdraw_money(account, amount)
      if account.balance >= amount
        account.balance -= amount
        account.save
        puts "Funds successfully withdrawn. New balance: #{account.balance} for client: #{account.name}"
      else
        if use_overdraft?(account)
          apply_overdraft(account, amount)
        else
          puts "Insufficient funds for withdrawal."
        end
      end
    end
   
    def self.apply_overdraft(account, amount)
      available_balance = 100
      if available_balance >= amount
        overdraft_amount = amount - account.balance
        account.balance = 0
        available_balance -= overdraft_amount
        account.save
        puts "Funds successfully withdrawn from overdraft. New overdraft limit: #{available_balance} for client: #{account.name}"
      else
        puts "Insufficient funds for withdrawal, even with overdraft."
      end
    end
end
  