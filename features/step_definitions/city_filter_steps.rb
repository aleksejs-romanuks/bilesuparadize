
When(/^I specify (.*) as performance location city*/) do |city|
  @city = city
  Elements.new(:xpath,"//select[@class='filterObjectCity']").get_option_when_appears(@city)
end

Then(/^Performances located in selected city are listed*/) do
  page_number = 1

  @pages.filter.check_if_content_is_loaded

  @pages.filter.filter_results.get_list_of_elements.length.times do |index|
    if (index / 20) + 1 != page_number
      page_number = page_number + 1
      puts "next page"
      Elements.new(:xpath, "//ul[@id='pagination1']//a[@rel='#{page_number}']").click
    end

    text = Elements.new(:xpath, "//div[@class='container searchResultsDiv']//table[@class='table table-striped searchResultsEventsSection']/tbody/tr[#{index+1}]/td/h2/small").get_text_when_appears

    raise "Exception: Performance on page #{page_number} is not located in #{@city} (Actual location: '#{text}')" unless text.include? @city

  end
end

