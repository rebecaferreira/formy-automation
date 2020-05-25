require "selenium-webdriver"
require "rspec"
require "webdrivers"

$first_name = 'Rebecca'
$last_name = 'Oliveira'
$job_title = 'Intern'
$date = '05/25/2022'
$expected_banner_text = 'The form was successfully submitted!'

describe "automating a form" do
  it "submits a form" do
    # Selenium::WebDriver::Chrome::Service.driver_path = "C:/Ruby26/chromedriver.exe"
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to "https://formy-project.herokuapp.com/form"

    driver.find_element(id: 'first-name').send_keys($first_name)
    driver.find_element(id: 'last-name').send_keys($last_name)
    driver.find_element(id: 'job-title').send_keys($job_title)
    driver.find_element(id: 'radio-button-2').click
    driver.find_element(id: 'checkbox-2').click
    driver.find_element(css: 'option[value="2"]').click
    driver.find_element(id: 'datepicker').send_keys($date)
    driver.find_element(id: 'datepicker').send_keys :return
    driver.find_element(css: '.btn.btn-lg.btn-primary').click
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { driver.find_element(class:'alert').displayed? }

    expect(driver.find_element(class: 'alert').text).to eql($expected_banner_text)
    driver.quit
  end
end


