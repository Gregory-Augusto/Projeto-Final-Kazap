class Account < Client 
    attr_accessor :balance 
  
    @@account_data = []
  
    def initialize(attributes = {})
      super
      @balance = attributes[:balance]
      @@account_data << self
    end
  
    def create_account
      puts "Name: #{name}"
      puts "Balance: #{balance}"
    end
  
    def update_account(new_balance)
      @balance = new_balance
      puts "Account balance updated to: #{balance}"
    end
  
    def delete_account
      puts "Account for #{name} has been deleted."
      @@account_data.delete(self)
    end
  
    def self.all_accounts
      @@account_data
    end
  end
  