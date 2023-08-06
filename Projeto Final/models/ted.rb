class ModelTed < Sequel::Model 

    plugin :validation_helpers

    one_to_one :transfer
    
    def validate 
        validates do
            presence_of :amount, message: 'Must be present'
            presence_of :fee, message: 'Must be present'
            presence_of :total, message: 'Must be present'

            numeric :amount, message: 'Must be a valid number'
            numeric :fee, message: 'Must be a valid number'
            numeric :total, message: 'Must be a valid number'

            min_value 0, :amount, message: 'Must be greater than or equal to 0'
            min_value 0, :fee, message: 'Must be greater than or equal to 0'
            min_value 0, :total, message: 'Must be greater than or equal to 0'
      
            format_of :amount, /\A\d{10}\z/, message: 'Must not surpass 10 digits'
            format_of :fee, /\A\d{5}\z/, message: 'Must not surpass 5 digits'
            format_of :total, /\A\d{10}\z/, message: 'Must not surpass 10 digits'
        end
    end
end