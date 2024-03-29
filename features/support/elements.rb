class Elements
  def initialize(type, value)
    @type = type
    @value = value
  end

  def get_element(wait_time = 5)
    wait = Selenium::WebDriver::Wait.new(timeout: wait_time)
    wait.until {$driver.find_element(@type, @value)}
  end

  def click(wait_time = 5)
    wait = Selenium::WebDriver::Wait.new(timeout: wait_time)
    wait.until do
      $driver.find_element(@type, @value).click
      true
    end
  end

  def click_until_is_displayed(element_to_be_displayed_type, element_to_be_displayed_value , wait_time = 5)
    wait = Selenium::WebDriver::Wait.new(timeout: wait_time)
    wait.until do
      $driver.find_element(@type, @value).click
      return true if $driver.find_element(element_to_be_displayed_type, element_to_be_displayed_value).displayed?
    end
  end

  def set(text, wait_time = 5)
    wait = Selenium::WebDriver::Wait.new(timeout: wait_time)
    wait.until do
      $driver.find_element(@type, @value).send_keys(text)
      true
    end
  end

  def submit(wait_time = 5)
    wait = Selenium::WebDriver::Wait.new(timeout: wait_time)
    wait.until do
      $driver.find_element(@type, @value).submit
      true
    end
  end

  def get_list_of_elements(wait_time = 5)
    wait = Selenium::WebDriver::Wait.new(timeout: wait_time)
    result = nil
    wait.until {
      element_list = $driver.find_elements(@type, @value)
      result = element_list unless element_list.empty?
      result
    }
  end

  def get_text_when_appears(wait_time = 5)
    wait = Selenium::WebDriver::Wait.new(timeout: wait_time)
    wait.until {
      text = $driver.find_element(@type, @value).text
      return text unless text.empty?
    }
  end

  def get_attribute_when_appears(attribute_name, wait_time = 5)
    wait = Selenium::WebDriver::Wait.new(timeout: wait_time)
    wait.until {
      attribute = $driver.find_element(@type, @value).attribute(attribute_name)
      unless attribute.nil?
        return attribute if !attribute.nil? && !attribute.empty?
      end
    }
  end

  def get_option_when_appears(option_text, wait_time = 5)
    wait = Selenium::WebDriver::Wait.new(timeout: wait_time)
    wait.until {
      dropdown = $driver.find_element(@type, @value)
      Selenium::WebDriver::Support::Select.new(dropdown).select_by(:text, option_text)
      true
    }
  end

  def check_if_displayed(wait_time = 5)
    wait = Selenium::WebDriver::Wait.new(timeout: wait_time)
    wait.until do
      true if $driver.find_element(@type, @value).displayed?
    end
  end

end