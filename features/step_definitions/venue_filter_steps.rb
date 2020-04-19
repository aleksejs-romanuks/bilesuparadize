When(/^I specify (.*) as performance venue*/) do |venue|
  @venue = venue
  @pages.filter.venue_filter.get_option_when_appears(@venue)
end

Then(/Performances located in selected venue are listed*/) do
  page_number = 1

  @pages.filter.check_if_content_is_loaded

  @pages.filter.filter_results.get_list_of_elements.length.times do |index|
    if (index / 20) + 1 != page_number
      page_number = page_number + 1
      puts "next page"
      Elements.new(:xpath, "//ul[@id='pagination1']//a[@rel='#{page_number}']").click
    end

    text = Elements.new(:xpath, "//div[@class='container searchResultsDiv']//table[@class='table table-striped searchResultsEventsSection']/tbody/tr[#{index+1}]/td/h2/small").get_text_when_appears

    raise "Exception: Performance on page #{page_number} has wrong venue. (Actual venue: '#{text}', expected venue: #{@venue})" unless text.downcase.include? @venue.downcase
  end
end