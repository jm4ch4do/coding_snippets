''' ------------------- WAIT FUNCTIONS ---------------- '''
# When you use Angular, Vue or React the page will change without
# triggering a reload, so we'll have to wait for it to change as part
# of our code

# Explicit Wait: will wait until a given condition is satisfied
# Implicit Wait: Tries to pull the DOM for a certain amount of time
#                until the element becomes available


''' ----------------------- EXAMPLE -------------------- '''
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
url = 'https://www.google.com/earth/'
driver = webdriver.Chrome()
driver.get(url)

# Explicit
# Triggers an exception if the condition is not satisfied after 10 seconds
wait = WebDriverWait(driver, 10) 

# define the condition for the Explicit
# button should be clickable
element = '/html/body/header/div/nav[1]/ul[2]/li[2]/a/span/span'
launchEarthButton = wait.until(EC.element_to_be_clickable((By.PATH, element)))
launchEarthButton.click()