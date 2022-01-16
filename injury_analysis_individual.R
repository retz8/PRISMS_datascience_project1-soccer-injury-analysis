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

#postion - injury analysis
player_injury_info = merge(player, injury, by = c('player', 'from'))
position_list <- table(player_injury_info$position)
position_list <- data.frame(position_list)
positions <- c('FW', 'LW', 'RW', 'AM', 'CM', 'RM', 'LM', 'DM', 'WB', 'CB', 'RB', 'LB', 'GK')
injury_nums <-c(0, 0, 0, 0, 0, 0, 0, 0 , 0, 0 , 0, 0 , 0)

names(position_list) = c("position", "val")
for(i in 1:nrow(position_list)){

  pos <- position_list[i, "position"]
  value <- position_list[i, "val"]
  #print(pos)
  cur <- str_split(pos, ",")
  print(cur)
  for(j in cur){ #this for loop is very dirty, there might be a way to make it shorter
    #print(j)
    #print("    ")
    if(j == "FW")
      injury_nums[1] <- injury_nums[1] + value
    else if(j == "LW")
      injury_nums[2] <- injury_nums[2] + value
    else if(j == "RW")
      injury_nums[3] <- injury_nums[3] + value
    else if(j == "AM")
      injury_nums[4] <- injury_nums[4] + value
    else if(j == "CM")
      injury_nums[5] <- injury_nums[5] + value
    else if(j == "RM")
      injury_nums[6] <- injury_nums[6] + value
    else if(j == "LM")
      injury_nums[7] <- injury_nums[7] + value
    else if(j == "DM")
      injury_nums[8] <- injury_nums[8] + value
    else if(j == "WB")
      injury_nums[9] <- injury_nums[9] + value
    else if(j == "CB")
      injury_nums[10] <- injury_nums[10] + value
    else if(j == "RB")
      injury_nums[11] <- injury_nums[11] + value
    else if(j == "LB")
      injury_nums[12] <- injury_nums[12] + value
    else if(j == "GK")
      injury_nums[13] <- injury_nums[13] + value
    }
}
injury_nums
sum(injury_nums) #1381 -> 1249 sth is missing but number is enough
injury_percentage <- injury_nums/sum(injury_nums)*100
normal_position_list <- table(player$position)
normal_position_list <- data.frame(normal_position_list)
normal_position_list
non_injury_nums <- c(0,0,0,0,0,0,0,0,0,0,0,0,0)
names(normal_position_list) = c("position", "val")
for(i in 1:nrow(normal_position_list)){
  
  pos <- normal_position_list[i, "position"]
  value <- normal_position_list[i, "val"]
  #print(pos)
  cur <- str_split(pos, ",")
  print(cur)
  for(j in cur){ #this for loop is very dirty, there might be a way to make it shorter
    #print(j)
    #print("    ")
    if(j == "FW")
      non_injury_nums[1] <- non_injury_nums[1] + value
    else if(j == "LW")
      non_injury_nums[2] <- non_injury_nums[2] + value
    else if(j == "RW")
      non_injury_nums[3] <- non_injury_nums[3] + value
    else if(j == "AM")
      non_injury_nums[4] <- non_injury_nums[4] + value
    else if(j == "CM")
      non_injury_nums[5] <- non_injury_nums[5] + value
    else if(j == "RM")
      non_injury_nums[6] <- non_injury_nums[6] + value
    else if(j == "LM")
      non_injury_nums[7] <- non_injury_nums[7] + value
    else if(j == "DM")
      non_injury_nums[8] <- non_injury_nums[8] + value
    else if(j == "WB")
      non_injury_nums[9] <- non_injury_nums[9] + value
    else if(j == "CB")
      non_injury_nums[10] <- non_injury_nums[10] + value
    else if(j == "RB")
      non_injury_nums[11] <- non_injury_nums[11] + value
    else if(j == "LB")
      non_injury_nums[12] <- non_injury_nums[12] + value
    else if(j == "GK")
      non_injury_nums[13] <- non_injury_nums[13] + value
  }
}
non_injury_nums <- non_injury_nums - injury_nums
non_injury_nums <- non_injury_nums/sum(non_injury_nums)*100

non_injury_percentage <- non_injury_nums

non_injury_percentage
injury_percentage
pi <- data.frame(positions, non_injury_percentage, injury_percentage) #df for plotting


names(pi) <- c("position", "normal_percentage", "injury_percentage")
pi
pi_graph <- pi %>% 
  pivot_longer(-position, names_to = "variable", values_to = "percentage") %>% 
  ggplot(aes(x = position, y = percentage, fill = variable)) + 
  geom_bar(stat = "identity", position = "dodge", width = 0.5) +
  ggtitle("Injury Rates Per Position")
