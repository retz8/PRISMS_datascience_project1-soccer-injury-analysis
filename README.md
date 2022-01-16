# PRISMS_datascience_project1-soccer-injury-analysis
Analyze soccer players injury data and stats per game data with Rstudio and Python  

## **#1. Data Description & Collection**  
Datasets were collected from www.transfermarkt.com and www.fbref.com with Python  
selenium library and google chrome driver were used  
  **a) injury data**	
  : injury records of soccer players in 20-21 season top 7 leagues  
  (from transfermarkt)  
  columns: player	league	season	injury	from	to	day_missed	game_missed  
  size: 18168 x 8  
  
  **b) 20-21season_7leagues_players_game_stat**  
  : players stats per each game  
  (from fbref)  
  columns: player from day comp round venue result team opponent	start	position minutes_played	goals	assists	pk_made	pk_attempted penalty kick won penalty kick conceded	own goals	shots total	shots on target	yellow card	red card	touches	press attempted	tackle	tackle win	interception blocks expected goals	non-penalty-expected goals	xG assisted	shot-creating actions	goal-creating actions	passes completed	passes attempted pass completion per progressive passes ball carries	ball progressed	dribble succeed	dribble attempted	fouls committed	fouls drawn offsides crosses	match report  
  size: 523768 x 8  
  
  **c) team game stats**  
  : this is a data processed from a) and b), data about team results of each game  	
  columns: team	from	day	comp	round	venue	result	opponent	home score	opponent score	score diff  
  size: 95233 x 11   
  
  ![image](https://user-images.githubusercontent.com/54821805/149682701-811cd9ca-3364-439a-ae94-6b96f3d082c8.png)

## **#2. Data analysis**  
  **a) injury rates per position (posisiton level)**  
  : Does position matters for injury frequency?  
  ![image](https://user-images.githubusercontent.com/54821805/149682897-34a66c37-0e40-4101-b67e-0bb7533668e8.png)  
  Injury data and players game stats data were merged by "from" and "player name" columns. This merged dataframe is for injury cases. Normal cases (non-injury cases) is the rest of the data in players game stats data. I counted the number of injury cases and normal cases for each position. In this process, I had to split string of position column because some players had multiple positions in one game.  
  ![injury rates per position](https://user-images.githubusercontent.com/54821805/149681389-e2251928-8a71-422b-9386-80fba6f68f10.png)  
    The bar graph contains the normal group and injury group. A normal group is a group of positions of all players in matches. An injury group is a group of positions of injured players in matches. On the x-axis, 13 positions of football players are plotted. On the y-axis, percentage values of two groups are plotted. The percentage is calculated as follows: For example, the percentage of the injury group of FW positions is calculated by dividing the number of injured FW positions by the number of injured players in all positions.  
    In the FW and CB positions, the percentage value of the normal group is lower than that of the injury group. This shows that players who played in FW and CB positions are at higher risk of injury than other positions. In addition, the percentage value of FW and CB positions is the highest of the 13 positions, which is why it is statistically meaningful. In contrast, in the GK position, the normal group has about twice the percentage value of the injury group. This shows that goalkeepers are less likely to be injured than other field players.  
  
  **b) score difference vs tackles by team (team level)**  
  : Does game result matters for tackle attempts which can lead to more injuries?  
    A team game stats data was used in this analysis. I merged players game stats data and team game stats data by "team" and "from" columns. After than I used group_by(team, from) and summarise() to calculate total number of tackles by team and to store score difference.  
  ![Score difference vs total tackles by team](https://user-images.githubusercontent.com/54821805/149681392-74f7f74e-a788-4eb1-b4d2-dfb54185f659.png)  
    This is a box plot that shows the correlation between the game score difference and the number of tackles by team.  For example, the number of tackles by the winning team is recorded for the one point difference in the game score. Unfortunately, I coudn't find meaningful meaning of this box plot.  
  
## **#3. Notes**  
  (for uploaded R code, download r_injury_data, r_20-21season_7leagues_players_game_stat, team game stats)  
  (web scraping code for 20-21season_7leagues_players_game_stat is not uploaded)  
  (be sure to add encoding = "utf-8" when you read data in python and Rstudio) 
