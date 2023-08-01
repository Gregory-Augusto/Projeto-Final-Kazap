Sequel.migration do 
    up do 
        create_table(:withdraws) do 
            primary_key :id 
            foreign_key :transaction_id, :transactions
            Decimal :balance, null: false
            Decimal :amount, null: false 
        end
    end

    down do 
        drop_table(:withdraws)
    end
end

