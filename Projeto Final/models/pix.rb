class ModelPix < Sequel::Model 

    plugin :validation_helpers

    one_to_one :transfer 

    def validate 
        validates do
            presence_of :amount, 'Must be present'

            numeric :amount, message: 'Must be a valid number'

            min_value 0, :amount, message: 'Must be greater than or equal to 0'

            format_of :amount, /\A.{1,10}\z/, message: 'Must not surpass 10 digits' 
        end
    end
end
