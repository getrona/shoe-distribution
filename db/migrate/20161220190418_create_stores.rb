class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table(:stores) do |s|
      s.column(:description, :string)

      s.timestamps()
    end
  end
end
