''' ------------------- SIMPLE BOT WITH SELENIUM ---------------- '''
# example of filling fields and pressing buttons

# import
from selenium import webdriver

# ini web browser
driver = webdriver.Chrome()

# target url
url = 'https://www.seleniumeasy.com/test/basicfirst-form-demo.html'

# browse to target
driver.get(url)

# interact with elements in the page
messageField = driver.find_element_by_xpath('//*[@id="user-message"]')  # get field
messageField.send_keys('Hello World')  # write to field
showMessageButton = driver.find_element_by_xpath('//*[@id="get-input"]/button')  # get button
showMessageButton.click()   # clic button

additionField1 = driver.find_element_by_xpath('//*[@id="sum1"]')  # select field
additionField1.send_keys('10')  # write value
additionField2 = driver.find_element_by_xpath('//*[@id="sum2"]')  # select field
additionField2.send_keys('11')  # write value
getTotalButton = driver.find_element_by_xpath('//*[@id="get-total"]/button')  # get button
getTotalButton.click()   # clic button