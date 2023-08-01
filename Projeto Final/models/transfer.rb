class Transfer < Sequel::Model 

    plugin :validation_helpers

    many_to_one :client 

    def validate
        validates do
            presence_of :type, 'Must be present'

            format_of :type, /\A[a-zA-Z]+\z/, message: 'Must contain only letters'

            format_of :type, /\A.{1,3}\z/, message: 'Must not surpass 3 characters'
        end
    end
end

