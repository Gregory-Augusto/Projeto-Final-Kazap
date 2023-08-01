class Overdraft < Sequel::Model 

    plugin :validation_helpers

    one_to_one :transaction

    def validate 
        validates do 
            presence_of :balance, 'Must be present'
            presence_of :amount, 'Must be present'

            numeric :balance, message: 'Must be a valid number'
            numeric :amount, message: 'Must be a valid number'

            min_value 0, :balance, message: 'Must be greater than or equal to 0'
            min_value 0, :amount, message: 'Must be greater than or equal to 0'

            format_of :balance, /\A.{1,10}\z/, message: 'Must not surpass 10 digits'
            format_of :amount, /\A.{1,10}\z/, message: 'Must not surpass 10 digits'
        end
        
        before_validation :check_overdraft_limit
        before_validation :check_balance
    end

    def check_overdraft_limit
        errors.add(:amount, 'The amount must not be higher than 100') if amount > 100 
    end

    def check_balance
        if balance <= -100
            errors.add(:balance, 'Balance must be greater than -100')
            return false
        end
    end
end
