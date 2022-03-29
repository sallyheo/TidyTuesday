#### Tidy Tuesday 5: Baby Names ####
#### Created by: Sally Heo ####
#### Updated on: 2022-03-28 ####

#### Load Libraries needed to Code ####
library(tidyverse) #Load tidyverse
library(here) #Load here
library(ggthemes) #Load ggthemes

#### Load Data ####
babynames <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-03-22/babynames.csv')
glimpse(babynames) #Glimpse babynames data
View(babynames) #View babynames data in a separate tab

#### Data Analysis ####
#### Data Wrangling ####
baby <- babynames %>% #Giving object name baby; brining babynames dataframe over to use 
  select(year, sex, n) %>% #Only show year, sex, n
  group_by(year,sex) %>% #Group by year and sex
  summarise(number = n()) #Rename the n column to number
View(baby) #View baby object data

#### GG plot ####
baby %>% #Bringing baby dataframe over 
  ggplot(aes(x = year, #Plot x-axis is year
             y = number, #Plot y-axis is number
             color = sex)) + #Map color to sex
  geom_line() + #Geometry line
  geom_point() + #Geometry point
  labs(title = "Number of Unique Male and Female Baby Names", #Giving plot title
       subtitle = "From Years 1860 to 2017",#Giving subtitle to plot
       x = "Year", #Renaming the x-axis to Year
       y = "Raw Count of Unique Baby Names", #Renaming the y-axis to Raw count of Unique Baby Names
       color = "Sex", #Renaming the legend to Sex
       caption = "Source: R package babynames from Hadley Wickham")+ #Adding caption for plot
  theme(title = element_text(size = 16, color = "blueviolet"))+ #Editing title, font, and color
  theme_bw()+ #theme black and white
  scale_color_stata() #theme scale color stata
ggsave(here("TidyTuesday_5", "Output", "babynames.png"),#Save here
       width = 9, height = 7)#Dimensions in inches for width and height of plot
##################################################################################################################
