class CreateExchanges < ActiveRecord::Migration[5.1]
  def change
    create_table :exchanges do |t|
      t.text :short_name, index: true #this col is unique
      t.text :name
    end
  end
end
