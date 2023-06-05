########################################
# load libraries
########################################

# load some packages that we'll need
library(tidyverse)
library(scales)

# be picky about white backgrounds on our plots
theme_set(theme_bw())

# load RData file output by load_trips.R
load('trips.RData')


########################################
# plot trip data
########################################

# plot the distribution of trip times across all rides (compare a histogram vs. a density plot)

min_value <- min(trips$tripduration)
# I noticed the max value is an outlier and squished the rest of the data 
# It was not easy to read so I set the max value manually in xlim
max_value <- max(trips$tripduration)

ggplot(trips, aes(x = tripduration)) +
  geom_histogram() +
  xlim(min_value, 10000) +
  scale_y_continuous(label = comma)

# I also plotted it using the log scale instead
ggplot(trips, aes(x = tripduration)) +
  geom_histogram() + 
  scale_x_log10(label = comma)

ggplot(trips, aes(x = tripduration)) + 
  geom_density(fill = "grey") +
  scale_x_log10(label = comma) +
  xlab('trip duration') +
  ylab('density')

# plot the distribution of trip times by 
# usertype indicated using color and fill 
# (compare a histogram vs. a density plot)

ggplot(trips, aes(x = tripduration, fill = usertype)) +
  geom_histogram() +
  labs(x = "Trip Duration", y = "Frequency") +
  scale_fill_manual(values = c("blue", "red")) + 
  scale_x_log10(label = comma)

ggplot(trips, aes(x = tripduration, fill = usertype)) +
  geom_density(alpha = 0.5) +
  labs(x = "Trip Duration", y = "Density") +
  scale_fill_manual(values = c("blue", "red")) + 
  scale_x_log10(label = comma)


# plot the total number of trips on each day
# in the dataset
ggplot(trips, aes(x = ymd)) + 
  geom_histogram(bins = 365) 

# plot the total number of trips (on the y 
# axis) by age (on the x axis) and gender 
# (indicated with color)

ggplot(trips, aes(x = birth_year, fill = gender)) +
  geom_histogram(bins = 100) +
  labs(x = "Birth Year", y = "Total Number of Trips") +
  scale_fill_manual(values = c("grey", "blue", "red")) +
  scale_y_log10(label = comma)
  

# plot the ratio of male to female trips (on the y axis) by age (on the x axis)
# hint: use the pivot_wider() function to reshape things to make it easier to compute this ratio
# (you can skip this and come back to it tomorrow if we haven't covered pivot_wider() yet)



########################################
# plot weather data
########################################
# plot the minimum temperature (on the y axis) over each day (on the x axis)


# plot the minimum temperature and maximum temperature (on the y axis, with different colors) over each day (on the x axis)
# hint: try using the pivot_longer() function for this to reshape things before plotting
# (you can skip this and come back to it tomorrow if we haven't covered reshaping data yet)


########################################
# plot trip and weather data
########################################

# join trips and weather
trips_with_weather <- inner_join(trips, weather, by="ymd")

# plot the number of trips as a function of the minimum temperature, where each point represents a day
# you'll need to summarize the trips and join to the weather data to do this

# repeat this, splitting results by whether there was substantial precipitation or not
# you'll need to decide what constitutes "substantial precipitation" and create a new T/F column to indicate this

# add a smoothed fit on top of the previous plot, using geom_smooth

# compute the average number of trips and standard deviation in number of trips by hour of the day
# hint: use the hour() function from the lubridate package

# plot the above

# repeat this, but now split the results by day of the week (Monday, Tuesday, ...) or weekday vs. weekend days
# hint: use the wday() function from the lubridate package
