require 'rspec'
require 'appium_lib'
require 'pry'
require 'faker'
require 'selenium-webdriver'
require 'sauce_whisk'
require 'rubocop'
require 'selenium-webdriver'

def wait_for
  Selenium::WebDriver::Wait.new(:timeout => 120).until { yield }
end

$emulators = ENV['PLATFORM']
$base_emulators = YAML.load_file('./config/emulators.yml')['emulators'][$emulators]

Appium::Driver.new($base_emulators, true)
Appium.promote_appium_methods Object