Sequel.migration do 
    up do 
        create_table(:overdrafts) do 
            primary_key :id 
            foreign_key :transaction_id, :transactions
            Decimal :balance, null: false 
            Decimal :amount, null: false 
        end
    end

    down do 
        drop_table(:overdrafts)
    end
end
