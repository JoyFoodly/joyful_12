module PaymentsHelper
  def months
    Date::MONTHNAMES.compact.each_with_index.map { |name,i| ["#{i + 1} - #{name}", i + 1] }
  end

  def years
    (Date.today.year..(Date.today.year + 20)).to_a
  end
end
