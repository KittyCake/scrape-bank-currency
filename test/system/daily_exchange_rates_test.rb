require "application_system_test_case"

class DailyExchangeRatesTest < ApplicationSystemTestCase
  setup do
    @daily_exchange_rate = daily_exchange_rates(:one)
  end

  test "visiting the index" do
    visit daily_exchange_rates_url
    assert_selector "h1", text: "Daily Exchange Rates"
  end

  test "creating a Daily exchange rate" do
    visit daily_exchange_rates_url
    click_on "New Daily Exchange Rate"

    fill_in "Date", with: @daily_exchange_rate.date
    click_on "Create Daily exchange rate"

    assert_text "Daily exchange rate was successfully created"
    click_on "Back"
  end

  test "updating a Daily exchange rate" do
    visit daily_exchange_rates_url
    click_on "Edit", match: :first

    fill_in "Date", with: @daily_exchange_rate.date
    click_on "Update Daily exchange rate"

    assert_text "Daily exchange rate was successfully updated"
    click_on "Back"
  end

  test "destroying a Daily exchange rate" do
    visit daily_exchange_rates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Daily exchange rate was successfully destroyed"
  end
end
