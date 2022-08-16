import requests
from bs4 import BeautifulSoup
import pandas as pd

# pull table from rotton tomatoes website
url = 'https://www.rottentomatoes.com/celebrity/nicolas_cage'
req = requests.get(url)
soup = BeautifulSoup(req.text, 'html.parser')
main_table = soup.find_all('table')[0]

critics = []
audience = []
for row in main_table.find('tbody').find_all('tr'):
    score_cols = row.find_all('td', class_='celebrity-filmography__score-content')
    # print(score_cols[0].find_all('span', class_='icon__tomatometer-score'),
    #  score_cols[1].find_all('span', class_='icon__tomatometer-score'), '\n')
    for i in score_cols[0].find_all('span', class_='icon__tomatometer-score'):
        critics.append(i.text)
    for i in score_cols[1].find_all('span', class_='icon__tomatometer-score'):
        audience.append(i.text)
print(critics, '\n', audience)
