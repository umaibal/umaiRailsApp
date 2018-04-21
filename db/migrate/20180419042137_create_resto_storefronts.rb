class CreateRestoStorefronts < ActiveRecord::Migration[5.1]
  def change
    create_table :resto_storefronts do |t|
      t.string :index

      t.timestamps
    end
  end
end
