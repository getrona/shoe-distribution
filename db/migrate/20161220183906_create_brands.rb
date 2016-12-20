class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table(:shoe_brands) do |b|
      b.column(:name, :string)

      b.timestamps()
    end
  end
end
