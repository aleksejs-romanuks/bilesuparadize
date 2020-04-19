When(/^I open calendar and click on calendar shortcut$/) do
  @exception_list = []

  @pages.main.count_calendar_shortcuts.times do |index|
    begin

      @pages.main.calendar_button.click_until_is_displayed(:xpath, "//ul[@class='dropdown-menu topCalendarContent']")

      shortcut_button = @pages.main.get_calendar_shortcut_by_index(index)

      shortcut_button_text = shortcut_button.get_text_when_appears

      expected_date_from, expected_date_until = @pages.filter.get_calendar_expected_dates_by_shortcut_text(shortcut_button_text)

      shortcut_button.click

      @pages.filter.validate_calendar_dates(expected_date_from, expected_date_until)
    rescue => exception
      @exception_list << "Exception was catched on shortcut '#{shortcut_button_text}' with message <<#{exception}>>"
    end
    $driver.navigate.back
  end
end

Then(/^Corresponding filter is applied$/) do
  raise @exception_list.to_s unless @exception_list.empty?
end


