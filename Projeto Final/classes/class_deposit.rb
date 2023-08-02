class Deposit < Client
    attr_accessor :balance

    def initialize(attributes = {})
        super
        @balance = attributes[:balance]
    end

    def add_funds_to_account(account, amount)
          account.balance += amount
          puts "Funds successfully added. New balance: #{account.balance} for client: #{name}"
    end
end
