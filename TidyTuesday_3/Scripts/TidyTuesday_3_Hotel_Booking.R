#### Tidy Tuesday 3 Hotel Bookings #####
#### Created by: Sally Heo ####
#### Updated on: 2022-03-10 ####

#### Load libraries needed to code ####
library(tidyverse) # Load tidyverse
library(here) # Load here
library(lubridate) # Load lubridate
library(tsibble) #Load tsibble
library(date) #Load date

#### Load Data ####
hotels <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-11/hotels.csv')
glimpse(hotels) #View hotel data in table format
View(hotels) #View hotels

#### Data Analysis ####

#### Data Wrangling ####
h1 <- hotels %>% #Brining dataframe over
select(hotel, reservation_status, reservation_status_date, adr, lead_time) %>% #Variables I want to keep
mutate(year = year(reservation_status_date),#Make a new column for year
       month = month(reservation_status_date))#Make a new column for month
View(h1) #View the h1 data

## GG Plot ##
h1 %>% #Brining over h1 data to use
  ggplot(mapping = aes(x = reservation_status, #Plotting x-axis as reservation_status
                       y = lead_time, #Plotting y-axis as lead time
                       color = reservation_status))+ #Setting color to reservation status
  geom_boxplot()+ #Assigning geometry point boxplot
  theme_bw()+ #Theme bw
  guides(color = "none")+ #Getting rid of legend
labs(title = "Hotel Cancellations have the highest lead times", #Assigning title to plot
     subtitle = "From July 2015 to August 2017", #Adding subtitle
     y = "Lead Time (days)", #changing y-axis title
     x = "Reservation Status", #changing x-axis title
     caption = "Antonio, Almeida and Nunes, 2019")+ #Adding a caption
  theme(title = element_text(size = 16, color = "cornflowerblue")) #Editing the text size and color of font
ggsave(here("TidyTuesday_3", "Output", "HotelBooking.png"), #Saving to this specific directory
       width = 7, height = 5)#Dimensions in inches

########################################################################################################
