require './currency_converter.rb'
require 'minitest/autorun'
require 'minitest/pride'

class CurrencyConverterTest < Minitest::Test

  def self.test_order
    :alpha
  end

  def test_currency_class_exists
    assert Currency
  end

  def test_currency_can_be_initalized
    test_currency = Currency.new(25.34, "USD")
    assert_equal 25.34, test_currency.amount
  end

  def test_currency_can_equals
    usd_amount1 = Currency.new(33.24, "USD")
    usd_amount2 = Currency.new(33.24, "USD")
    assert usd_amount1 == usd_amount2
    eur_amt1 = Currency.new(20.50, "EUR")
    eur_amt2 = Currency.new(22.50, "EUR")
    refute eur_amt1 == eur_amt2
  end

  def test_currency_can_be_added
    usd_amount1 = Currency.new(25.10, "USD")
    usd_amount2 = Currency.new(24.90, "USD")
    assert_equal 50.0, usd_amount1 + usd_amount2
  end

  def test_currency_can_be_subtracted
    usd_amount1 = Currency.new(33.24, "USD")
    usd_amount2 = Currency.new(32.24, "USD")
    assert_equal 1.0, usd_amount1 - usd_amount2
  end

  def test_unlike_currency_cannot_subtract
    usd_amount1 = Currency.new(33.24, "USD")
    eur_amount2 = Currency.new(32.24, "EUR")
    assert_raises(DifferentCurrencyCodeError) do
      usd_amount1 - eur_amount2
    end
  end

#  def test_output_method
#  end

#  def test_currency_can_get_amount_and_code
#    assert_equal ,
#  end

#needs to be able to subtract from same currency, so I need two variables for
#the currencys and a if then for the code

end
