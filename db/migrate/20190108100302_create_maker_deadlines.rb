class CreateMakerDeadlines < ActiveRecord::Migration[5.2]
  def change
    create_table :maker_deadlines do |t|
        t.string :メーカー
        t.integer :期限
      t.timestamps
    end
  end
end
