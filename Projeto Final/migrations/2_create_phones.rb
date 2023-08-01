Sequel.migration do
    up do
      create_table(:phones) do
        primary_key :id
        foreign_key :client_id, :clients, null: false
        Text :number, null: false, unique: true
        DateTime :created_at, null: false 
        DateTime :updated_at, null: false
      end
    end
  
    down do
      drop_table(:phones)
    end
end
  
