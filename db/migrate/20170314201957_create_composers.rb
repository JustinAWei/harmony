class CreateComposers < ActiveRecord::Migration[5.0]
  def change
    create_table :composers do |t|
      t.string :name
      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
