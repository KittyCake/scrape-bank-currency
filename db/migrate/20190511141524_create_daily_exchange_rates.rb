class CreateDailyExchangeRates < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_exchange_rates do |t|
      t.date :date

      t.timestamps
    end
  end
end
