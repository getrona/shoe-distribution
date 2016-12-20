class ShoeStores < ActiveRecord::Migration[5.0]
  def change
    create_table(:shoe_stores) do |s|
      s.column(:name, :string)

      s.timestamps()
    end
  end
end
