#### Tidy Tuesday 2: Netflix shows ####
#### Created by: Sally Heo #####
#### Updated on: 2022-03-03 ####

#### Libraries needed to code ####
library(tidyverse) # Load tidyverse
library(here) # Load here
library(lubridate) # Load lubridate
library(dplyr) # Load dplyr
library(ggplot2) # Load ggplot2
library(jpeg) # Load jpeg
library(png) # Load png


#### Load Data ####
netflix_titles <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-04-20/netflix_titles.csv')

# Checking the data #
glimpse(netflix_titles) # View netflix_titles in table format
View(netflix_titles)

#### Data Analysis ####

#### Data Wrangling ####
Ratings <- netflix_titles %>% # Using Ratings Data (Bringing dataframe over)
  select(type, release_year, rating) %>% # To show only these specific variables 
  filter(release_year >= 2000) %>% # Filter to show Years >= 2000
  View(Ratings) # View Ratings

# GG Plot #
Ratings %>% # Bringing dataframe over
  ggplot(aes(x = release_year, # Plotting x-axis as release_year
             y = rating, # Plotting y-axis as Rating
             color = rating))+ # Giving color for Rating
  geom_line(size = 5, width = 3) + # Assigning Geometry Point, geom_line
  guides(color = "none") + # Getting rid of legend
  labs(title = "Netflix TV Shows and Movies Rating", # Giving title to plot
       subtitle = "From Years 2000-2020", # Adding subtitle
       y = "Ratings", # changing the label of y-axis
       x = "Year Released", # changing the label of x-axis
       caption = "Kaggle w/ credit to Shivam Bansal") + # giving caption
  theme_classic() + # theme classic
  theme(title = element_text(size = 16, color = "firebrick1")) # changing the theme text size and color
ggsave(here("TidyTuesday_2", "Output", "Netflix.png"), # Saving to this destination
       width = 7, height = 5) # changing the dimensions in inches

########################################################################################################################

