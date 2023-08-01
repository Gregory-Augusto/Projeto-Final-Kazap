Sequel.migration do 
    up do 
        create_table(:deposits) do 
            primary_key :id 
            foreign_key :transaction_id, :transactions
            Decimal :amount, null: false 
        end 
    end
    
    down do 
        drop_table(:deposits)
    end
end
