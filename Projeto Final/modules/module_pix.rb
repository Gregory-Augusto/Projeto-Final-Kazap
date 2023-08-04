module Pix
    DB = Sequel.connect('sqlite://db/bank.db')
  
    FEE_PERCENTAGE = 1.0
  
    def self.transfer_money(sender_account, receiver_account, amount)
      if same_owner?(sender_account, receiver_account)
        transfer_amount = amount
      else
        transfer_amount = apply_fee(amount)
      end
  
      if sender_account.balance >= transfer_amount
        sender_account.balance -= transfer_amount
        receiver_account.balance += amount
        sender_account.save
        receiver_account.save
        puts "Transfer successful! New balance for sender: #{sender_account.balance}, New balance for receiver: #{receiver_account.balance}"
      else
        puts "Insufficient funds for transfer."
      end
    end
  
    def self.same_owner?(account1, account2)
      account1.owner == account2.owner
    end
  
    def self.apply_fee(amount)
      (amount * (1 + FEE_PERCENTAGE / 100)).round(2)
    end
end
  