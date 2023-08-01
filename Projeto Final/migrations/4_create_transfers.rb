Sequel.migration do 
    up do 
        create_table(:transfers) do 
            primary_key :id
            foreign_key :client_id, :clients 
            foreign_key :account_id, :accounts
            DateTime :date, null: false
            String :type, size: 3, null: false
            DateTime :created_at, null: false 
            DateTime :updated_at, null: false
        end
    end

    down do
        drop_table(:transfers)
    end
end

