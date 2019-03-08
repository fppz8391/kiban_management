class CreateKibans < ActiveRecord::Migration[5.2]
  def change
    create_table :kibans do |t|
        t.string :基盤名
        t.date :最終注文日
        t.string :メーカー
        t.boolean :終了
        t.string :備考
    end
  end
end
