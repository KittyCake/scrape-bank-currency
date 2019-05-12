class CreateExchangeRates < ActiveRecord::Migration[5.2]
  def change
    create_table :exchange_rates do |t|
      t.references :currency, foreign_key: true
      t.decimal :middle_rate, :precision => 10, :scale => 5
      t.decimal :buying_spot_rate, :precision => 10, :scale => 5
      t.decimal :selling_spot_rate, :precision => 10, :scale => 5
      t.decimal :buying_cash_rate, :precision => 10, :scale => 5
      t.decimal :selling_cash_rate, :precision => 10, :scale => 5
      t.time :release_time
      t.references :daily_exchange_rate, foreign_key: true

      t.timestamps
    end
  end
end
