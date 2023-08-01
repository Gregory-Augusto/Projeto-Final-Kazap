class Phone < Sequel::Model 

    plugin :validation_helpers

    many_to_one :client, key: :client_id
    
    def validate 
        validates do 
            presence_of :number, 'Must be present'

            numeric :number, message: 'Must be a valid number'

            format_of :number, /\A\d{2}\s\d{4,5}-\d{4}\z/, 'Invalid number' 
        end
    end
end
