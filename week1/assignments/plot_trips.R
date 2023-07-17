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
  geom_histogram(position = "identity", alpha = 0.5) +
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

# redoing last problem with line plot
trips %>% group_by(ymd) %>% summarize(count = n()) %>% 
  ggplot(aes(x=ymd, y=count)) + 
  geom_line()
  geom_histogram(bins = 365) 

# plot the total number of trips (on the y 
# axis) by age (on the x axis) and gender 
# (indicated with color)

ggplot(trips, aes(x = birth_year, fill = gender)) +
  geom_histogram(bins = 100) +
  labs(x = "Birth Year", y = "Total Number of Trips") +
  scale_fill_manual(values = c("grey", "blue", "red")) +
  scale_y_log10(label = comma)

# redo this last problem with doing grouping etc 

# plot the ratio of male to female trips (on the y axis) by age (on the x axis)
# hint: use the pivot_wider() function to reshape things to make it easier to compute this ratio
# (you can skip this and come back to it tomorrow if we haven't covered pivot_wider() yet)

trips_wide <- trips %>% select(birth_year, gender) %>%
  group_by(birth_year) %>% 
  arrange(birth_year) %>%
  count(gender, name = "gender_count")

trips_wide <- trips_wide %>% 
  pivot_wider(names_from = gender, values_from = gender_count)

male_trips_wide <- select(trips_wide, birth_year, Male)
female_trips_wide <- select(trips_wide, birth_year, Female)   

joined_trips_wide <- inner_join(male_trips_wide, female_trips_wide)
joined_trips_wide_drop_na <- drop_na(joined_trips_wide)

joined_trips_ratio <- joined_trips_wide_drop_na %>% 
  mutate(ratio = Male/Female)

ggplot(joined_trips_ratio, aes(x=birth_year, y=ratio)) + geom_line()

########################################
# plot weather data
########################################
# plot the minimum temperature (on the y axis) over each day (on the x axis)
weather <- read_csv('weather.csv')

weather_min_temp_by_day <- weather %>% 
  select(DATE, TMIN) %>% 
  group_by(DATE) %>% 
  arrange(DATE) 

ggplot(weather_min_temp_by_day, aes(x=DATE, y=TMIN)) + 
  geom_line()


# plot the minimum temperature and maximum temperature 
# (on the y axis, with different colors) over each day (on the x axis)
# hint: try using the pivot_longer() function for this to reshape things before plotting
# (you can skip this and come back to it tomorrow if we haven't covered reshaping data yet)

weather_min_max_temp_by_day <- weather %>% 
  select(DATE, TMIN, TMAX) %>% 
  group_by(DATE) %>% 
  arrange(DATE)

# combining TMIN and TMAX using pivot_longer
weather_min_max_longer <- pivot_longer(data = weather_min_max_temp_by_day,
                                       cols = c(TMIN, TMAX),
                                       names_to="TMP")

ggplot(weather_min_max_longer, aes(x=DATE, y=value, color=TMP)) +
  geom_line() +
  scale_color_manual(values = c("blue", "red"))


# plot the minimum temperature and maximum temperature (on the y axis, with different colors) over each day (on the x axis)
# hint: try using the pivot_longer() function for this to reshape things before plotting
# (you can skip this and come back to it tomorrow if we haven't covered reshaping data yet)


########################################
# plot trip and weather data
########################################

# join trips and weather
trips_with_weather <- inner_join(trips, weather, by=c('ymd'='DATE'))

# plot the number of trips as a function of the minimum temperature, 
# where each point represents a day. 
# You'll need to summarize the trips and join to the weather data to do this

trips_by_date <- trips_with_weather %>%
  group_by(ymd) %>%
  summarize(count=n()) 

min_temp_by_date <- weather %>% 
  group_by(DATE) %>%
  select(DATE, TMIN)

joined_trips_per_date_min <- inner_join(trips_by_date, min_temp_by_date, by=c('ymd'='DATE'))
  

joined_trips_per_date_min %>% ggplot(aes(x=TMIN, y=count)) + 
  geom_point() + 
  geom_smooth(method="lm")
  


# repeat this, splitting results by whether there was substantial 
# precipitation or not. You'll need to decide what constitutes 
# "substantial precipitation" and create a new T/F column to indicate this
unique_prcp <- unique(trips_with_weather$PRCP) 
sort(unique_prcp)
mean_prcp<- mean(unique_prcp)

# anything above mean = substantial precipitation 
# trips_with_weather %>% mutate(avg_prcp = 
#                                 case_when(PRCP > mean_prcp ~ TRUE, 
#                                          PCRP <= mean_prcp ~ FALSE))

# joining joined_trips_per_date_min and weather_prcp
weather_prcp <- weather %>% select(DATE, PRCP) %>% group_by(DATE)

joined_trips_per_date_min_prcp <- 
  inner_join(joined_trips_per_date_min, weather_prcp, by=c('ymd'='DATE'))

# if prcp > mean_prcp assign True, else assign false
mutate(.data = joined_trips_per_date_min_prcp, substantial_prcp = (PRCP>mean_prcp))


# add a smoothed fit on top of the previous plot, using geom_smooth

# compute the average number of trips and standard deviation in number of trips by hour of the day
# hint: use the hour() function from the lubridate package

# plot the above

# repeat this, but now split the results by day of the week (Monday, Tuesday, ...) or weekday vs. weekend days
# hint: use the wday() function from the lubridate package
