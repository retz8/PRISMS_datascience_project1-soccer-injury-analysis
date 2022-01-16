library("tidyverse")
library("ggplot2")
#read data
injury <- read.csv(file = 'C:/Users/ekkic/Desktop/r_injury_data.csv')
player <- read.csv(file = 'C:/Users/ekkic/Desktop/r_20-21season_7leagues_players_game_stat.csv')
print(injury)
#injury: 18168 x 9
#player: 523768 x 48
print(paste0("injury columns: ", colnames(injury)))
print(paste0("player columns: ", colnames(player)))

mode(injury)
mode(player)

#tackle - game result
team_game <- read.csv(file = 'C:/Users/ekkic/Desktop/team game stats.csv', encoding = 'UTF-8')
#there is an encoding problem with my excel
colnames(team_game)
names(team_game) <- c("team", "from","day","comp","round","venue","result","opponent","home.score","opponent.score", "score.diff")
player_team_info <- merge(player, team_game, by = c( "team", "from"))
pt <- player_team_info %>%
  group_by(team, from) %>%
  summarise(total_tackle = sum(tackle), score_diff = mean(score.diff))
pt[order(pt$total_tackle, decreasing = TRUE),]
pt <- pt[order(pt$score_diff),]
pt <- subset(pt, !is.na(total_tackle))
pt$score_diff = as.character(pt$score_diff)
cur <- c()
for(i in seq(9, -9, by = -1)){
  print(i)
  cur<-append(i, cur)
}
cur <- as.character(cur)
cur
ggplot(data = pt,mapping = aes(score_diff)) + geom_bar() + xlim(cur)
#let's just ignor -9 ~ -5, 9 ~ 5 (data are small)
cur2 <- c()
for(i in seq(4, -4, by = -1)){
  print(i)
  cur2<-append(i, cur2)
}
cur2 <- as.character(cur2)
ggplot(data = pt, mapping = aes(score_diff,total_tackle, na.rm = TRUE)) + geom_boxplot() + xlim(cur2) +
  ggtitle("Score Difference vs Total tackles by team")
