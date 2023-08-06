class ModelWithdraw < Sequel::Model 

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
    end
end

