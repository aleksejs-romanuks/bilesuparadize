require "selenium-webdriver"
require "webdrivers"
require 'date'

Before do
  $driver = Selenium::WebDriver.for :chrome
  $driver.manage.window.maximize
  @pages = Pages.new

  $driver.navigate.to "https://www.bilesuparadize.lv/"
end

After do
  $driver.quit
end