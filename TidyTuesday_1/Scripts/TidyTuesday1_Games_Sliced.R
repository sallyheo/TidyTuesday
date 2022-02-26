#### Tidy Tuesday 1: Video Games + Sliced ####
#### Created by: Sally Heo ####
#### Updated on: 2022-02-24 ####

#### Load libraries needed to code ####
library(tidyverse) # Load tidyverse
library(dplyr)# Load dplyr
library(plyr) # Load plyr
library(lubridate) # Load lubridate - this is to deal with dates and times
library(ggplot2) # Load ggplot2
library(here) # Load here

#### Load Data ####
games <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-16/games.csv')# Read in the data manually
glimpse(games)# Glimpse games
View(games) # View games

#### Data analysis ####

#### Data Wrangling ####
MostPopular_byyear <- games %>% # Bring games dataframe over to use
  unite(yearmonth, month:year) %>% # Bring together the two columns year and month into one column to show the year and month together
  select(-c(gain, peak, avg_peak_perc)) %>% # Taking out the columns that we don't want 
  head(arrange(games,desc(gametime)), n = 20) # To Show only the Top 20 Games
View(MostPopular_byyear) # View the MostPopular_byyear data

#### GGPlot ####
MostPopular_byyear %>% # Brining over the MostPopular_byyear data
ggplot(mapping = aes(x = avg, # Plotting x-axis
                     y = gamename, # Plotting y-axis
                     color = gamename)) + # Adding color to the game names
  geom_bar(width = 1, stat = "identity")+ # Adding bar graph geometry
  labs(title = "Top 20 Games in 2021 By Number of Players",
       subtitle = "Players online at the same time",
       x = "Average number of players", # changing the x-axis name
       y = "Name of Game", # changing the y-axis name
       caption = "Source: SteamCharts",) + # Adding the source
  theme_bw() + # Adding theme black and white
  theme(axis.text.x = element_text(angle = 65, vjust = 0.6)) + # Adjusting the axis text
  theme(title = element_text(size = 12, color = "blue2")) + # changing the font and color of axis title, x-axis, and y-axis
  guides(color = FALSE) # Removing color legend
ggsave(here("TidyTuesday_1", "Output", "TidyTuesday_1.png"),# Saving to this destination
       width = 7, height = 5) # Width and Height in inches

##################################################################################################################


  
