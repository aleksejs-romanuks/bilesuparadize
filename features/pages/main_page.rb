class MainPage
  attr_accessor :calendar_button

  def initialize
    @calendar_shortcuts = Elements.new(:xpath, "//ul[@class='event-group']//a[@class='preselectedDays']")
    @calendar_button = Elements.new(:class, "topMenuItemCalendar")
  end

  def count_calendar_shortcuts
    @calendar_shortcuts.get_list_of_elements.length
  end

  def get_calendar_shortcut_by_index(index)
    Elements.new(:xpath, "(//ul[@class='event-group']//a[@class='preselectedDays'])[#{index + 1}]")
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

  def get_calendar_dates
    [
        Elements.new(:xpath, "//div[@class='search-tools']//input[@placeholder='Datums no']").get_attribute_when_appears('value'),
        Elements.new(:xpath, "//div[@class='search-tools']//input[@placeholder='Datums līdz']").get_attribute_when_appears('value')
    ]
  end

  def validate_calendar_dates(expected_from_date, expected_until_date)
    from_date, until_date = get_calendar_dates
    raise "Exception: Wrong from date (Expected: '#{expected_from_date}' but got '#{from_date}')" unless expected_from_date == from_date
    puts  "Exception: Wrong from date (Expected: '#{expected_from_date}' but got '#{from_date}')"
    raise "Exception: Wrong until date (Expected: '#{expected_until_date}' but got '#{until_date}')" unless expected_until_date == until_date
    puts "Exception: Wrong until date (Expected: '#{expected_until_date}' but got '#{until_date}')"
  end


end