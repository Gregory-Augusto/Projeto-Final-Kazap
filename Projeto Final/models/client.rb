class ModelClient < Sequel::Model

    plugin :validation_helpers

    one_to_many :accounts 
    one_to_many :transactions 
    one_to_many :transfers  
    one_to_many :phones  
    

    def validate 
        validates do 
            presence_of :name, message: 'Must be present'
            presence_of :address, message: 'Must be present'
            
            format_of :name, /\A.{1,100}\z/, message: 'Must not surpass 100 digits'
            format_of :document, /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z|\A\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}\z/, message: 'Invalid document'
        end
    end
end
