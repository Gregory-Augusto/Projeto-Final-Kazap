module Deposit
    DB = Sequel.connect('sqlite://db/bank.db')

    def self.add_funds_to_account(account, amount)
      account.balance += amount
      account.save
      puts "Funds successfully added. New balance: #{account.balance} for client: #{account.name}"
    end
  
    def self.add_funds_after_overdraft(account, amount)
      if account.balance < 0
        if amount >= (-account.balance)
          amount -= (-account.balance)
          account.balance = 0
        else
          account.balance += amount
          amount = 0
        end
      end
  
      account.balance += amount
      account.save
      puts "Funds successfully deposited. New balance: #{account.balance} for client: #{account.name}"
    end
end
  
