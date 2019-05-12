class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :name
      t.references :daily_exchange_rate, foreign_key: true

      t.timestamps
    end
  end
end
