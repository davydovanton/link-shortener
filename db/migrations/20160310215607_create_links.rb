Hanami::Model.migration do
  change do
    create_table :links do
      primary_key :id

      column :url,  String
      column :hash_value,  String
      column :redirection_count, Integer, null: false
    end
  end
end
