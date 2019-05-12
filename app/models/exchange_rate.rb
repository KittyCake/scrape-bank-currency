class ExchangeRate < ApplicationRecord
  belongs_to :currency
  belongs_to :daily_exchange_rate
end
