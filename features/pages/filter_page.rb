class FilterPage
  attr_accessor :city_filter, :filter_results, :venue_filter

  def initialize
    @from_date = Elements.new(:xpath, "//div[@class='search-tools']//input[@placeholder='Datums no']")
    @until_date = Elements.new(:xpath, "//div[@class='search-tools']//input[@placeholder='Datums līdz']")
    @city_filter = Elements.new(:xpath,"//select[@class='filterObjectCity']")
    @venue_filter = Elements.new(:xpath,"//select[@class='filterObjectVenue']")
    @filter_results = Elements.new(:xpath, "//div[@class='container searchResultsDiv']//table[@class='table table-striped searchResultsEventsSection']/tbody/tr")
  end
  def check_if_content_is_loaded
    @filter_results.check_if_displayed
  end
  def get_dates_values
    [@from_date.get_attribute_when_appears('value'), @until_date.get_attribute_when_appears('value')]
  end

  def validate_calendar_dates(expected_from_date, expected_until_date)
    from_date, until_date = get_dates_values
    raise "Exception: Wrong from date (Expected: '#{expected_from_date}' but got '#{from_date}')" unless expected_from_date == from_date
    raise "Exception: Wrong until date (Expected: '#{expected_until_date}' but got '#{until_date}')" unless expected_until_date == until_date
  end

  def get_calendar_expected_dates_by_shortcut_text(text)
    current_date = DateTime.now
    case text
    when "Šodien"
      return current_date.strftime("%d.%m.%Y"), current_date.strftime("%d.%m.%Y")
    when "Rīt"
      return (current_date + 1).strftime("%d.%m.%Y"), (current_date + 1).strftime("%d.%m.%Y")
    when "Šajā nedēļas nogalē"
      return (current_date + 6 - current_date.wday).strftime("%d.%m.%Y"), (current_date + 7 - current_date.wday).strftime("%d.%m.%Y")
    when "Nākošajā nedēļas nogalē"
      return (current_date + 13 - current_date.wday).strftime("%d.%m.%Y"), (current_date + 14 - current_date.wday).strftime("%d.%m.%Y")
    when "Nākošajās 7 dienās"
      return current_date.strftime("%d.%m.%Y"), (current_date + 7).strftime("%d.%m.%Y")
    when "Nākošajās 14 dienās"
      return current_date.strftime("%d.%m.%Y"), (current_date + 14).strftime("%d.%m.%Y")
    else
      raise "Error: unexpected shortcut text: #{text}"
    end
  end

end