# MSR NYC Data Science Summer School 2023

This is the repository for Microsoft Research NYC's 2023 Data Science Summer School (DS3). More information on the program is available [here](http://ds3.research.microsoft.com).

## Coursework breakdown

- [Week 1](week1/): Pre-requisites and background
- [Week 2](week2/): Core curriculum
- [Week 3](week3/): Extended assignments
- [Week 4](week4/): Projects

## Final Project

### Description:

Our goal was to replicate the findings of [this article](https://www.pnas.org/doi/10.1073/pnas.2006853117#sec-1) on air quality during the COVID-10 lockdowns. We worked in pairs on this project, and then presented our findings on the last day.

**Task 1: Using the data from the study, recreate the density plot and world map for PM2.5**

Figure 1C - Paper Figure:
<img style="margin: 10px; max-height: 550px; width: auto; @media (max-width: 550px) { max-height: 100%; width: auto; }" src="https://github.com/aleksgeorgi/MicrosoftResearchSummerDataScienceSchoolCoursework/blob/master/week4/Images/Paper-WorldMap.png" alt="Figure 1C - World Map and Density" />

Figure 1C - Density Plot, Our Recreation:
<img style="margin: 10px; max-height: 550px; width: auto; @media (max-width: 550px) { max-height: 100%; width: auto; }" src="https://github.com/aleksgeorgi/MicrosoftResearchSummerDataScienceSchoolCoursework/blob/master/week4/Images/DensityPlot.png" alt="DensityPlot" />

Figure 1C - Wold Map, Our Recreation:
<img style="margin: 10px; max-height: 550px; width: auto; @media (max-width: 550px) { max-height: 100%; width: auto; }" src="https://github.com/aleksgeorgi/MicrosoftResearchSummerDataScienceSchoolCoursework/blob/master/week4/Images/WoldMap.png" alt="WorldMap" />

### Results

Results from each group were mixed however most groups

1. Start by reading the paper. Focus on the bottom panel of Figure 1 (density plot inset, then the map). These will be the main results to replicate in the paper. Time permitting we will try to replicate the right panel of Figure 3B with a simplified model as well.

2. Explore the data in the [data/](data/) folder and think about how these can be used to create Figure 1.

3. Sketch out a plan for how you can use these data sets to get the results in the paper and write reproducible code to create the results in the paper. Do all of your work in your group's project repository, which you have direct read/write access to (no need to fork and issue pull requests, etc.):

   - https://github.com/msr-ds3/air-quality-2023-group-1
   - https://github.com/msr-ds3/air-quality-2023-group-2
   - https://github.com/msr-ds3/air-quality-2023-group-3
   - https://github.com/msr-ds3/air-quality-2023-group-4
   - https://github.com/msr-ds3/air-quality-2023-group-5
   - https://github.com/msr-ds3/air-quality-2023-group-6

4. From here think about extensions to the article. Each group will probably come up with different questions to ask of the data. Write down the questions your group is interested in along with a plan for how you can tackle them with the data you have.

5. Write one Rmarkdown notebook file that contains all of your results, including the replications and your extension. Commit the source code and rendered notebook to your group's Github repository, with a README that explains what each file does.

Figure 3B - Relative Change, Our Recreation:
<img style="margin: 10px; max-height: 550px; width: auto; @media (max-width: 550px) { max-height: 100%; width: auto; }" src="https://github.com/aleksgeorgi/MicrosoftResearchSummerDataScienceSchoolCoursework/blob/master/week4/Images/RelativeChange.png" alt="Relative Change" />

Figure 3B - Paper Figure:
<img style="margin: 10px; max-height: 550px; width: auto; @media (max-width: 550px) { max-height: 100%; width: auto; }" src="https://github.com/aleksgeorgi/MicrosoftResearchSummerDataScienceSchoolCoursework/blob/master/week4/Images/Paper_Figure3B.png" alt="Relative Change" />
