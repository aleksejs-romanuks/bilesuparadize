class MainPage
  attr_accessor :calendar_button

  def initialize
    @calendar_shortcuts = Elements.new(:xpath, "//ul[@class='event-group']//a[@class='preselectedDays']")
    @calendar_button = Elements.new(:class, "topMenuItemCalendar")
  end

  def check_if_content_is_loaded
    @calendar_button.check_if_displayed
  end

  def count_calendar_shortcuts
    @calendar_shortcuts.get_list_of_elements.length
  end

  def get_calendar_shortcut_by_index(index)
    Elements.new(:xpath, "(//ul[@class='event-group']//a[@class='preselectedDays'])[#{index + 1}]")
  end

  def open_calendar_month_page(number_of_needed_clicks, date_to_find)
    xpath_beginning =  date_to_find == "from" ? "//*[@class='month-from topMenuMonthFrom hasDatepicker']" : "//*[@class='month-to topMenuMonthTill hasDatepicker']"
    while number_of_needed_clicks != 0
      if number_of_needed_clicks > 0
        Elements.new(:xpath, xpath_beginning + "//*[@title='Nāk.']").click
        number_of_needed_clicks = number_of_needed_clicks - 1
      else
        Elements.new(:xpath, xpath_beginning+"//*[@title='Iepr.']").click
        number_of_needed_clicks = number_of_needed_clicks + 1
      end
    end
  end

end