''' ------------------- SCRAPING A SINGLE PAGE ---------------- '''
from bs4 import BeautifulSoup
import requests
url = 'https://scrapingclub.com/exercise/list_basic/?page=1'
response = requests.get(url)
soup = BeautifulSoup(response.text, 'lxml')
items = soup.find_all('div', class_='col-lg-4 col-md-6 mb-4')
count = 1
for item in items:
    itemName = item.find('h4', class_='card-title').text
    itemPrice = item.find('h5').text
    print('%s ) Price: %s, Item Name: %s' % (count, itemPrice, itemName))
    count += 1


''' ------------------ BUILD URL FOR THE OTHERS --------------- '''
# get rest of pages from pagination section from the web page
pages = soup.find('ul', class_='pagination')
urls = []
links = pages.find_all('a', class_='page-link')
for link in links:
    pageNum = int(link.text) if link.text.isdigit() else None
    if pageNum is not None:
        x = link.get('href')
        urls.append(x)

print(urls)


''' ------------------ SCRAPING REST OF PAGES ---------------- '''
base_url = 'https://scrapingclub.com/exercise/list_basic/'
count = 1
for i in urls:
    newUrl = base_url + i
    response = requests.get(newUrl)
    soup = BeautifulSoup(response.text, 'lxml')
    items = soup.find_all('div', class_='col-lg-4 col-md-6 mb-4')

    for item in items:
        itemName = item.find('h4', class_='card-title').text.strip('\n')  
        itemPrice = item.find('h5').text
        print('%s ) Price: %s, Item Name: %s' % (count, itemPrice, itemName))
        count += 1
        
# note: strip('\n') remove unwanted newLines
