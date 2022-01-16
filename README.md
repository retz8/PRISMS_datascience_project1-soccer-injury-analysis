# PRISMS_datascience_project1-soccer-injury-analysis
Analyze soccer players injury data and stats per game data with Rstudio and Python  

#1. Data Collection  
Datasets were collected from www.transfermarkt.com and www.fbref.com with Python  
selenium library and google chrome driver were used  
a) injury data	
: injury records of soccer players in 20-21 season top 7 leagues  
(from transfermarkt)  
columns: player	league	season	injury	from	to	day_missed	game_missed  
size: 18168 x 8  
  
b) 20-21season_7leagues_players_game_stat  
: players stats per each game  
(from fbref)  
columns: player from day comp round venue result team opponent	start	position minutes_played	goals	assists	pk_made	pk_attempted penalty kick won penalty kick conceded	own goals	shots total	shots on target	yellow card	red card	touches	press attempted	tackle	tackle win	interception blocks expected goals	non-penalty-expected goals	xG assisted	shot-creating actions	goal-creating actions	passes completed	passes attempted pass completion per progressive passes ball carries	ball progressed	dribble succeed	dribble attempted	fouls committed	fouls drawn offsides crosses	match report  
size: 523768 x 8  
  
c) team game stats  
: data processed from a) and b), data about team results of each game  	
columns: team	from	day	comp	round	venue	result	opponent	home score	opponent score	score diff  
size: 95233 x 11  
  
(for uploaded R code, download r_injury_data, r_20-21season_7leagues_players_game_stat, team game stats)  
(be sure to add encoding = "utf-8" when you read data in python and Rstudio)  
  
#2. Data analysis  
a) injury rates per position (posisiton level)  
: Does position matters for injury frequency?  
![injury rates per position](https://user-images.githubusercontent.com/54821805/149681389-e2251928-8a71-422b-9386-80fba6f68f10.png)  
b) score difference vs tackles by team (team level)  
: Does game result matters for tackle attempts which can lead to more injuries?  
![Score difference vs total tackles by team](https://user-images.githubusercontent.com/54821805/149681392-74f7f74e-a788-4eb1-b4d2-dfb54185f659.png)  
