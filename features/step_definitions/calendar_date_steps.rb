When(/^I open calendar$/) do
  sleep(3)
  @pages.main.calendar_button.click
end

And(/^I select (\d+) as from day, (\d+) as from month, (\d+) as from year$/) do |from_day, from_month, from_year|
  @from_day, @from_month, @from_year = from_day, from_month, from_year

  current_date = DateTime.now
  number_of_needed_click =  (@from_year * 12 + @from_month) - (current_date.year * 12 + current_date.month)

  while number_of_needed_click != 0
    if number_of_needed_click > 0
      Elements.new(:xpath, "//*[@class='month-from topMenuMonthFrom hasDatepicker']//*[@title='Nāk.']").click
      number_of_needed_click = number_of_needed_click - 1
    else
      Elements.new(:xpath, "//*[@class='month-from topMenuMonthFrom hasDatepicker']//*[@title='Iepr.']").click
      number_of_needed_click = number_of_needed_click + 1
    end
  end

  sleep(5)


  puts current_date.month
  puts @from_month
  puts number_of_needed_click




end

And(/^I select (\d+) as until day, (\d+) as until month, (\d+) as until year$/) do |until_day, until_month, until_year|
  @until_day, @until_month, @until_year = until_day, until_month, until_year


end

And(/^I submit$/) do
  puts "Hello"
end

Then(/^Corresponding date filter is applied$/) do
  puts "Hello"
end
