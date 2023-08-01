Sequel.migration do 
    up do 
        create_table(:accounts) do
            primary_key :id
            foreign_key :client_id, :clients, null: false 
            Decimal :balance, null: false, default: 0.00

            index :client_id 
        end
    end
    
    down do 
        drop_table(:accounts)
    end
end
