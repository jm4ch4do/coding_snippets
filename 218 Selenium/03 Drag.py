''' ------------------- DRAG AND DROP EXAMPLE ---------------- '''
# Selenium example for drag and drop elements in a web page

# initialize
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
driver = webdriver.Chrome()
driver.maximize_window()
driver.get('http://dhtmlgoodies.com/scripts/drag-drop-custom/demo-drag-drop-3.html')

source = driver.find_element_by_xpath('//*[@id="box3"]')  # source element
dest = driver.find_element_by_xpath('//*[@id="box103"]')  # destination element
actions = ActionChains(driver)  # load driver
action.drag_and_drop(source, dest).perform()  # perform drag and drop
