class CreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table(:brands_stores) do |bs|
      bs.column(:brand_id, :integer)
      bs.column(:store_id, :integer)

      bs.timestamps()
    end
  end
end
