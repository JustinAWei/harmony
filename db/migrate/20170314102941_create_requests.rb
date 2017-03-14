class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.attachment :file
      t.string :fileName

      t.timestamps
    end
  end
end
