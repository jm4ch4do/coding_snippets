''' ------------------- SCRAPING A SINGLE PAGE ---------------- '''
# imports
import requests
from bs4 import BeautifulSoup

# get response from web and parse it
url = 'https://quotes.toscrape.com/'
response = requests.get(url)
soup = BeautifulSoup(response.text, 'lxml')  # use the lxml parser

# get the pieces of info we want
quotes = soup.find_all('span', class_='text')  # it gets all span tags with class='text'
authors = soup.find_all('small', class_='author')  # get the authors
tags = soup.find_all('div', class_='tags')  # get the tags (one quotes has multiple tags)

# print info
for i in range(0, len(quotes)):
    print(quotes[i].text)
    print(authors[i].text)
    quote_tags = tags[i].find_all('a', class_='tag')
    for tag in quote_tags:
        print(tag.text)
