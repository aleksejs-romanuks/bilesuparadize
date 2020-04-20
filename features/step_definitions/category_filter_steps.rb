When(/^I specify (.*) as performance category*/) do |category|
  @category = category
  Elements.new(:xpath,"//select[@class='filterObjectCategory']").get_option_when_appears(@category)
end

Then(/^Performances belonged to specified category are listed*/) do
  plain_text_category = if @category.end_with?("es", "is", "us")
    @category.gsub!(/[^A-Za-z]/, '')[0...-2]
  elsif @category.end_with?("a", "e", "s")
    @category.gsub!(/[^A-Za-z]/, '')[0...-1]
  else
    @category.gsub!(/[^A-Za-z]/, '')
  end

  page_number = 1

  @pages.filter.check_if_content_is_loaded

  @pages.filter.filter_results.get_list_of_elements.length.times do |index|
    if (index / 20) + 1 != page_number
      page_number = page_number + 1
      puts "next page"
      Elements.new(:xpath, "//ul[@id='pagination1']//a[@rel='#{page_number}']").click
    end

    Elements.new(:xpath, "//div[@class='container searchResultsDiv']//table[@class='table table-striped searchResultsEventsSection']/tbody/tr[#{index + 1}]/td/h2/a").click

    description = Elements.new(:xpath, "//div[@class='eventDescription']").get_text_when_appears

    raise "Exception: Performance on page #{page_number} doesn't belong to #{@category} category. (Actual description: '#{description}')" unless description.downcase.include? plain_text_category.downcase

    $driver.navigate.back

  end
end

