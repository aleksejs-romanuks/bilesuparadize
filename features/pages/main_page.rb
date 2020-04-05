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

end