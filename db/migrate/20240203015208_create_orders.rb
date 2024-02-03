class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders, comment: "注文情報" do |t|
      t.string :name, null: false, commit: "お名前"

      t.timestamps
    end
  end
end
