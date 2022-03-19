#### Tidy Tuesday 4: Starbucks Drinks ####
#### Created by: Sally Heo ####
#### Updated on: 2022-03-17 ####

#### Load Libraries needed to Code ####
library(tidyverse) #Load Tidyverse
library(here) #Load here
library(jpeg) #Load jpeg
library(gganimate) #Load gganimate
library(gapminder) #Load gapminder
library(ggthemes) #Load ggthemes

#### Load Data ####
starbucks <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-12-21/starbucks.csv') #Load Starbucks data to analyze
glimpse(starbucks)
View(starbucks)

#### Data Analysis ####

#### Data Wrangling ####
coffee <- starbucks %>% #Brining starbucks dataframe over to use 
  select(product_name, size, calories, total_carbs_g, sugar_g, caffeine_mg) %>% #Only selects these variables
  arrange(product_name) %>% #Organize the product_name in alphabetical order 
  mutate(product_name = fct_lump(product_name, n = 5)) %>% #To show top five products
  filter(product_name != "Other", #Filter out Other in product name
         size == "venti") #Filter how to show venti size only

## GG Plot ##
coffee %>% #Using coffee data
  ggplot(aes(x = total_carbs_g, #Plot x-axis as total_carbs_g
             y = calories, #Plot y-axis as calories
             color = product_name))+ #Give color according to product name
  geom_point(size = 4)+ #Geometry point, making points bigger
  labs(title = "Top Five Most Popular Starbucks Drinks", #Giving the plot a title
       subtitle = "Amount of Carbs(g) and Calories in Venti Size", #Giving subtitle 
       y = "Calories", #changing label of y-axis to calories
       x = "Carbohydrates (g)", #changing label of x-axis to carbohydrates (g)
       color = "Product name", #changing legend title to Product name
       caption = "Source: Starbucks Nutritional dataset from the pdf Starbucks Coffee Company Beverage Nutrition Information")+ #citing the source
  theme(title = element_text(size = 18, color = "darkgreen"))+ #editing font, text size, and color of plot
  theme_few() #theme_few (from ggthemes)
 ggsave(here("TidyTuesday_4", "Output", "Starbucks.png"),#Save here
       width = 9, height = 5)#Width and height dimensions in inches
 
 ##########################################################################################################