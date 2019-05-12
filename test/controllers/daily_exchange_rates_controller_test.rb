require 'test_helper'

class DailyExchangeRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_exchange_rate = daily_exchange_rates(:one)
  end

  test "should get index" do
    get daily_exchange_rates_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_exchange_rate_url
    assert_response :success
  end

  test "should create daily_exchange_rate" do
    assert_difference('DailyExchangeRate.count') do
      post daily_exchange_rates_url, params: { daily_exchange_rate: { date: @daily_exchange_rate.date } }
    end

    assert_redirected_to daily_exchange_rate_url(DailyExchangeRate.last)
  end

  test "should show daily_exchange_rate" do
    get daily_exchange_rate_url(@daily_exchange_rate)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_exchange_rate_url(@daily_exchange_rate)
    assert_response :success
  end

  test "should update daily_exchange_rate" do
    patch daily_exchange_rate_url(@daily_exchange_rate), params: { daily_exchange_rate: { date: @daily_exchange_rate.date } }
    assert_redirected_to daily_exchange_rate_url(@daily_exchange_rate)
  end

  test "should destroy daily_exchange_rate" do
    assert_difference('DailyExchangeRate.count', -1) do
      delete daily_exchange_rate_url(@daily_exchange_rate)
    end

    assert_redirected_to daily_exchange_rates_url
  end
end
