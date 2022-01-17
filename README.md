# PRISMS_datascience_project1-soccer-injury-analysis
Analyze soccer players injury data and stats per game data with Rstudio and Python  

## **#1. Introduction
Football is one of the world’s most popular sports with over 200 million males and 21 million females registered with the Federation Internationale de Football Association (FIFA).  Dvorak et Al. reports that the typical incidence rate is 10-35 injuries per 1,000 game hours for adult male football players. Among all, injury is one of the most prominent problems, both in terms of team performance and finance (1). FIFA estimates that the average world-wide medical cost of football injury is 150 USD, aggregating to an estimated annual cost of 30 billion USD. Similarly, average cost due to injury for professional English soccer is approximately 70 million USD per season. Beyond financially, absence due to injuries also affects the team’s overall performance.  
Football players undergo different injuries experiences depending on the area and severity. Most common injuries in football include ankle sprain, hamstring injury, and anterior cruciate ligament (ACL) rupture (8). First, due to the nature of football using the feet, ankle folding causes ankle sprain. Symptoms include swelling of a player’s ankle and pain when he is walking. A typical ankle sprain recovery period is around 6.5 days, but high ankle sprains take up to 46 days (7). Second, a hamstring injury is a strain or tear to the leg muscles on the back of a player's thigh (7). A hamstring injury accounts for 5 to 15 percent of all football injuries (4). This injury requires a recovery period of weeks or months depending on the extent of the injury (7). A hamstring injury has a higher recurrence rate than other injuries. In English professional football, the recurrent rate was more than double that of other injuries, ranging from 12 to 48 percent (3). Lastly, ACL rupture is an injury in which the cruciate ligament of the knee is broken by sudden sprint or turn. If the injury is not treated early or the degree of injury is severe, a player needs to get surgery which requires several months of recovery time (5). Moreover, since the recurrence rate of ACL rupture is 17.8 percent, physicians claim that about a year is a sufficient period of recovery (10).  
Football players with these injuries have a difference in their individual performance following their return to the football field (2). A research using datasets from three Spanish professional football teams shows that hamstring injuries and shooting techniques have correlation. The researchers demonstrated that returning players from hamstring injury usually lose their shooting power because they reduce peak linear velocities of the ball to avoid overloads of hamstring (6). Their performances change due to not only physical aspects, but also psychological reasons. Player’s play style can change passively because of anxiety of recurrence and trauma from massive pain of injury.  
Therefore, this project aims to identify different scenarios of soccer injury. I collected and analyzed 18,168 web-scrapped football injury cases to identify common signals for injuries both at an individual player level, and at a team level. At a player level, we identify that certain player positions are much more prone to injury than others.  

## **#2. Data Description & Collection**  
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

## **#3. Data analysis**  
  **a) injury rates per position (posisiton level)**  
  : Does position matters for injury frequency?  
  ![image](https://user-images.githubusercontent.com/54821805/149682897-34a66c37-0e40-4101-b67e-0bb7533668e8.png)  
  Injury data and players game stats data were merged by "from" and "player name" columns. This merged dataframe is for injury cases. Normal cases (non-injury cases) is the rest of the data in players game stats data. I counted the number of injury cases and normal cases for each position. In this process, I had to split string of position column because some players had multiple positions in one game.  
  ![injury rates per position](https://user-images.githubusercontent.com/54821805/149681389-e2251928-8a71-422b-9386-80fba6f68f10.png)  
    The bar graph contains the normal group and injury group. A normal group is a group of positions of all players in matches. An injury group is a group of positions of injured players in matches. On the x-axis, 13 positions of football players are plotted. On the y-axis, percentage values of two groups are plotted. The percentage is calculated as follows: For example, the percentage of the injury group of FW positions is calculated by dividing the number of injured FW positions by the number of injured players in all positions.  
    In the FW and CB positions, the percentage value of the normal group is lower than that of the injury group. This shows that players who played in FW and CB positions are at higher risk of injury than other positions. In addition, the percentage value of FW and CB positions is the highest of the 13 positions, which is why it is statistically meaningful. In contrast, in the GK position, the normal group has about twice the percentage value of the injury group. This shows that goalkeepers are less likely to be injured than other field players.  
    Based on these results, I would recommend players playing forward wing and center back to be more cautious of injury while playing. I would also recommend these players to spend extra time training for injury preventative measures.  
  
  **b) score difference vs tackles by team (team level)**  
  : Does game result matters for tackle attempts which can lead to more injuries?  
    A team game stats data was used in this analysis. I merged players game stats data and team game stats data by "team" and "from" columns. After than I used group_by(team, from) and summarise() to calculate total number of tackles by team and to store score difference.  
  ![Score difference vs total tackles by team](https://user-images.githubusercontent.com/54821805/149681392-74f7f74e-a788-4eb1-b4d2-dfb54185f659.png)  
    This is a box plot that shows the correlation between the game score difference and the number of tackles by team.  For example, the number of tackles by the winning team is recorded for the one point difference in the game score. Unfortunately, I coudn't find meaningful meaning of this box plot.  
  
## **#4. Notes**  
  (for uploaded R code, download r_injury_data, r_20-21season_7leagues_players_game_stat, team game stats)  
  (web scraping code for 20-21season_7leagues_players_game_stat is not uploaded)  
  (be sure to add encoding = "utf-8" when you read data in python and Rstudio)  
    
## **#5. References**
1. A;, Dvorak J;Junge. “Football Injuries and Physical Symptoms. a Review of the Literature.” The American journal of sports medicine. U.S. National Library of Medicine. Accessed August 10, 2021. https://pubmed.ncbi.nlm.nih.gov/11032101/.  
2. Advanced Solutions International, Inc. “Preventing Soccer Injuries.” Soccer Injuries | Soccer Injury Prevention & Treatment. Accessed August 10, 2021. https://www.stopsportsinjuries.org/STOP/STOP/Prevent_Injuries/Soccer_Injury_Prevention.aspx.  
3. DeWitt, John, and Tim Vidale. “Recurrent Hamstring Injury: Consideration Following Operative and Non-Operative Management.” International journal of sports physical therapy. Sports Physical Therapy Section, November 2014. https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4223289/.  
4. Diemer WM;Winters M;Tol JL;Pas HIMFL;Moen MH; “Incidence of Acute Hamstring Injuries in Soccer: A Systematic Review of 13 Studies Involving More than 3800 Athletes with 2 Million Sport Exposure Hours.” The Journal of orthopaedic and sports physical therapy. U.S. National Library of Medicine. Accessed August 10, 2021. https://pubmed.ncbi.nlm.nih.gov/33306929/.  
5. Healthcare, BMI. “Returning to Football After ACL Reconstruction.” BMI Healthcare - part of Circle Health Group. Accessed August 10, 2021. https://www.bmihealthcare.co.uk/health-matters/health-and-wellbeing/returning-to-football-after-acl-reconstruction.  
6. hmpgloballearningnetwork.com. Accessed August 10, 2021. https://www.hmpgloballearningnetwork.com/site/podiatry/treating-high-ankle-sprains-football-players.  
7. Nhs choices. NHS. Accessed August 10, 2021. https://www.nhs.uk/conditions/hamstring-injury/.  
8. “Orthopaedics & Physical Performance.” Soccer Injuries - Sports Medicine Program - UR Medicine, University of Rochester Medical Center - Rochester, NY. Accessed August 10, 2021. https://www.urmc.rochester.edu/orthopaedics/sports-medicine/soccer-injuries.cfm.  
9. “Sprained Ankle.” Mayo Clinic. Mayo Foundation for Medical Education and Research, April 27, 2021. https://www.mayoclinic.org/diseases-conditions/sprained-ankle/symptoms-causes/syc-20353225.  
10. Villa, Francesco Della, Martin Hägglund, Stefano Della Villa, Jan Ekstrand, and Markus Waldén. “High Rate of Second ACL Injury Following ACL Reconstruction in Male Professional Footballers: An Updated Longitudinal Analysis from 118 Players in the Uefa Elite Club INJURY STUDY.” British Journal of Sports Medicine. BMJ Publishing Group Ltd and British Association of Sport and Exercise Medicine, April 11, 2021. https://bjsm.bmj.com/content/early/2021/04/11/bjsports-2020-103555.  
