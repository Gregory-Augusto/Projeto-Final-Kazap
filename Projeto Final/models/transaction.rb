class ModelTransaction < Sequel::Model 

    plugin :validation_helpers

    many_to_one :client 

    def validate 
        validates do 
            presence_of :type, message: 'Must be present'

            format_of :type, /\A[a-zA-Z]+\z/, message: 'Must contain only letters'
            
            format_of :type, /\A\d{9}\z/, message: 'Must not surpass 9 characters'
        end
    end
end
