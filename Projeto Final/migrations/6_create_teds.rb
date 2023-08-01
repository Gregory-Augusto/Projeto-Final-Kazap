Sequel.migration do 
    up do 
        create_table(:teds) do 
            primary_key :id 
            foreign_key :transfer_id, :transfers
            Decimal :amount,  null: false 
            Decimal :fee, null: false 
            Decimal :total, null: false 
        end
    end

    down do 
        drop_table(:teds)
    end
end
