When(/^I open calendar$/) do
  @pages.main.check_if_content_is_loaded
  @pages.main.calendar_button.click
end

And(/^I select (\d+) as from day, (\d+) as from month, (\d+) as from year$/) do |from_day, from_month, from_year|
  @from_day, @from_month, @from_year = from_day, from_month, from_year

  current_date = DateTime.now
  number_of_needed_clicks =  (@from_year * 12 + @from_month) - (current_date.year * 12 + current_date.month)
  @pages.main.open_calendar_month_page(number_of_needed_clicks, "from")

  Elements.new(:xpath,"//*[@class='month-from topMenuMonthFrom hasDatepicker']//*[@data-month='#{@from_month - 1}']//a[text() = '#{@from_day}']").click
end

And(/^I select (\d+) as until day, (\d+) as until month, (\d+) as until year$/) do |until_day, until_month, until_year|
  @until_day, @until_month, @until_year = until_day, until_month, until_year

  number_of_needed_clicks =  (@until_year * 12 + @until_month) - (@from_year * 12 + @from_month)
  @pages.main.open_calendar_month_page(number_of_needed_clicks, "until")

  Elements.new(:xpath,"//*[@class='month-to topMenuMonthTill hasDatepicker']//*[@data-month='#{@until_month - 1}']//a[text() = '#{@until_day}']").click
end

And(/^I submit$/) do
  Elements.new(:xpath,"//div[@class='datepicker']//button[text() = 'Atlasīt']").click
end

Then(/^Corresponding date filter is applied$/) do
  expected_from_date = DateTime.new(@from_year, @from_month, @from_day).strftime("%d.%m.%Y")
  expected_until_date = DateTime.new(@until_year, @until_month, @until_day).strftime("%d.%m.%Y")
  @pages.filter.validate_calendar_dates(expected_from_date, expected_until_date)
end
