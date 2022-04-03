#### Tidy Tuesday 6: Christmas Songs ####
#### Created by: Sally Heo ####
#### Updated on: 2022-04-01 ####

#### Load Libraries Needed to Code ####
library(tidyverse) #Load tidyverse
library(here) #Load here
library(ggthemes) #Load ggthemes
library(ggimage) #Load ggimage

#### Load Data ####
christmas_songs <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-12-24/christmas_songs.csv")
glimpse(christmas_songs)#Glimpse christmas_songs
View(christmas_songs) #View christmas_songs

#### Data Analysis ####
#### Data Wrangling ####
christmas <- christmas_songs %>% #Giving object to christmas songs 
select(week_position, song, peak_position, weeks_on_chart, year) %>% #Only choosing these specific variables
filter(year >= 2000) #To show only from Years 2000 and above
View(christmas) #View christmas data

#### GGPlot ####
christmas %>% #Using christmas dataframe
  ggplot(aes(x = weeks_on_chart, #Plot x-axis as weeks on chart
             y = song, #Plot y-axis as Song
             fill = weeks_on_chart))+ #Fill color to weeks on chart
  geom_bar(stat = "identity", width = 0.5)+ #Geometry bar plot
  scale_x_continuous(limits = c(0, 20))+ #Setting x-axis limits from 0 to 20
  theme_few()+ #Theme few 
  theme(title = element_text(size = 12, color = "red1"))+ #Editing title of plot and color
  labs(title = "Christmas Billboard Top 100 Songs", #Giving title to plot
       subtitle = "From Years 2000 to 2017", #Giving subtitle
       x = "Number of Weeks on Christmas Billboard Chart", #Giving x-axis name
       y = "Title of Song", #Giving y-axis name
       fill = "Weeks On Chart", #Labeling Legend title
       caption = "Source: Kaggle") #Giving caption
ggsave(here("TidyTuesday_6", "Output", "christmassongs.png"), #Save here
       width = 12, height = 9) #Save in inches the width and height

#######################################################################################################