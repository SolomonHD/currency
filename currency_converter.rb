class Currency
#  @amount = 12.01
#  @currency_code = ""
  attr_writer :amount, :code

  def initialize (amount, code)
    @amount = amount
    @code = code
  end

  def amount
    return @amount
    #puts @currency_code
  end

  def code
    return @code
  end

  def ==(currency_being_compared)
    if self.code == currency_being_compared.code
      if self.amount == currency_being_compared.amount
        return true
      else
        return false
      end
    raise DifferentCurrencyCodeError
    end
  end

  def +(added_currency)
    if self.code  ==  added_currency.code
      answer = self.amount + added_currency.amount
      return Currency.new(answer, code)
    else
      raise DifferentCurrencyCodeError
    end
  end

  def -(currency_to_subtract)
    if self.code  ==  currency_to_subtract.code
        answer = self.amount - currency_to_subtract.amount
      #  puts "The two currencies can be subtracted"
      #  puts "The answer is #{answer}   #{currency1.code1}"
      return Currency.new(answer, code)
    else
        raise DifferentCurrencyCodeError
    end
  end
end

class DifferentCurrencyCodeError < StandardError

end

class CurrencyConverter

  def initialize (rates)
    @rates = rates
  end

  def convert_currency(currency_to_be_converted, target_code)
    value = currency_to_be_converted.amount * rate[currency_to_be_converted.code]
    return value
  end
end
