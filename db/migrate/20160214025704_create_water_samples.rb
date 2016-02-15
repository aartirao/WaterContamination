class CreateWaterSamples < ActiveRecord::Migration
  def change
    create_table :water_samples do |t|
      t.text :site
      t.float :chloroform
      t.float :bromoform
      t.float :bromodichloromethane
      t.float :dibromochloromethane
    end
  end
end
