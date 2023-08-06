class ModelAccount < Sequel::Model 

    plugin :validation_helpers

    many_to_one :client

    def validate 
        validates do 
            presence_of :balance, message: 'Must be present'

            numeric :balance, message: 'Must be a valid number'

            min_value 0, :balance, message: 'Must be greater than or equal to 0'

            format_of :balance, /\A.{1,10}\z/, message: 'Must not surpass 10 digits'
        end
    end
end
