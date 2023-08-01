Sequel.migration do 
    up do 
        create_table(:pixs) do 
            primary_key :id 
            foreign_key :transfer_id, :transfers
            Decimal :amount, null: false 
        end
    end

    down do
        drop_table(:pixs)
    end
end