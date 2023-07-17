# MSR NYC Data Science Summer School 2023

This is the repository for Microsoft Research NYC's 2023 Data Science Summer School (DS3). More information on the program is available [here](http://ds3.research.microsoft.com).

## Coursework breakdown

- [Week 1](week1/): Pre-requisites and background
- [Week 2](week2/): Core curriculum
- [Week 3](week3/): Extended assignments
- [Week 4](week4/): Projects

## Final Project

Our goal was to replicate the findings of [this article](https://www.pnas.org/doi/10.1073/pnas.2006853117#sec-1) on air quality during the COVID-10 lockdowns. We worked in pairs on this project, and then presented our findings on the last day.

### Task 1 Description:

Using the data from the study, recreate the density plot and world map for PM2.5

Figure 1C - Paper Figure:
<img style="margin: 10px; max-height: 550px; width: auto; @media (max-width: 550px) { max-height: 100%; width: auto; }" src="https://github.com/aleksgeorgi/MicrosoftResearchSummerDataScienceSchoolCoursework/blob/master/week4/Images/Paper-WorldMap.png" alt="Figure 1C - World Map and Density" />

Figure 1C - Density Plot, Our Recreation:
<img style="margin: 10px; max-height: 550px; width: auto; @media (max-width: 550px) { max-height: 100%; width: auto; }" src="https://github.com/aleksgeorgi/MicrosoftResearchSummerDataScienceSchoolCoursework/blob/master/week4/Images/DensityPlot.png" alt="DensityPlot" />

Figure 1C - Wold Map, Our Recreation:
<img style="margin: 10px; max-height: 550px; width: auto; @media (max-width: 550px) { max-height: 100%; width: auto; }" src="https://github.com/aleksgeorgi/MicrosoftResearchSummerDataScienceSchoolCoursework/blob/master/week4/Images/WoldMap.png" alt="WorldMap" />

### Task 1 Results:

Results from each group were slightly varied, yet no group replicated the paper's figures. The findings were opposite than that of the paper's claim.

The median value of PM2.5 for 2020 was actually higher than that of the 3 years prior. This could be due to a bug in the author's code. It was discovered that the figure was built on limited data. Instead of factoring the second, third, and fourth months of the year (the lock down months), the authors used the second, third, and fouth days of the year.

The world map also varied from that of the author's because our map was built using granular city data. It wasn't clear what data the authors used to produce the world map figure.

### Task 2 Description:

Replicate the relative change panel of Figure 3B. Build a simplified model trained on the lockdown months for the 3 years prior to 2020 to create the benchmark data.

Figure 3B - Paper Figure:
<img style="margin: 10px; max-height: 550px; width: auto; @media (max-width: 550px) { max-height: 100%; width: auto; }" src="https://github.com/aleksgeorgi/MicrosoftResearchSummerDataScienceSchoolCoursework/blob/master/week4/Images/Paper_Figure3B.png" alt="Relative Change" />

Figure 3B - Relative Change, Our Recreation:
<img style="margin: 10px; max-height: 550px; width: auto; @media (max-width: 550px) { max-height: 100%; width: auto; }" src="https://github.com/aleksgeorgi/MicrosoftResearchSummerDataScienceSchoolCoursework/blob/master/week4/Images/RelativeChange.png" alt="Relative Change" />

### Task 2 Results:

Our model did not account for weather patterns or other more complex features that were factored into the authors models for calcuating the benchmark data, so our relative change varied a lot from the original figure.
