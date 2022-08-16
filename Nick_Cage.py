import requests
from bs4 import BeautifulSoup
import pandas as pd
import csv

# pull table from rotton tomatoes website
url = 'https://www.rottentomatoes.com/celebrity/nicolas_cage'
req = requests.get(url)
soup = BeautifulSoup(req.text, 'html.parser')
main_table = soup.find_all('table')[0]

# write the critic and audience score to Nick_Cage.csv
with open('Nick_Cage.csv', 'w') as csvfile:
    csvwriter = csv.writer(csvfile)
    csvwriter.writerow(['critic', 'audience'])

    for row in main_table.find('tbody').find_all('tr'):
        score_cols = row.find_all('td', class_='celebrity-filmography__score-content')
        critics = score_cols[0].find_all('span', class_='icon__tomatometer-score')
        audiences = score_cols[1].find_all('span', class_='icon__tomatometer-score')

        for i,j in zip(critics, audiences):
            csvwriter.writerow([int(i.text.replace('%','')), int(j.text.replace('%',''))])
