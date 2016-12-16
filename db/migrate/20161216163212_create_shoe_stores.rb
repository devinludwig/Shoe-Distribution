class CreateShoeStores < ActiveRecord::Migration[5.0]
  def change
    create_table(:stores) do |table|
      table.column(:name, :string)
    end
  end
end
