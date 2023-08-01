Sequel.migration do
    up do 
        create_table(:clients) do
            primary_key :id, null: false
            String :name, size: 100,  null: false
            String :document, size: 14, null: false
            Text :address, null: false 
            DateTime :created_at, null: false 
            DateTime :updated_at, null: false
        end
    end

    down do
        drop_table(:clients)
    end
end

