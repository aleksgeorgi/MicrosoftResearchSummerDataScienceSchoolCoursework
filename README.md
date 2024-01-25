# Microsoft Research Data Science Summer School (DS3) - Final Project Overview

**Title:** Challenging Air Quality Claims: A COVID-19 Lockdown Case Study (Summer 2023)

## Introduction

During the last week of a four-week fellowship with Microsoft Research, my partner and I were tasked with replicating and critically analyzing a published [study on air pollution levels before and after the COVID-19 lockdown](https://www.pnas.org/doi/10.1073/pnas.2006853117#sec-1). Utilizing R for data analysis, our task was to validate the study's findings and explore potential discrepancies. We presented our findings on the last day. The repo for the original study can be found [here](https://github.com/NINAnor/covid19-air-pollution).

## Project Goals and Methodology

### Objective

Our primary goal was to replicate the original study's findings on air quality changes during COVID-19 lockdowns. This involved rigorous data analysis and visualizations to confirm or contest the published results.

### Task Breakdown

- **Task 1:** Reproduce the density plot and world map for PM2.5 using the dataset from the study.
- **Task 2:** Replicate the relative change panel of Figure 3B from the study, and build a simplified model for benchmark data based on lockdown months from the three years prior to 2020.

## Results and Findings

### Task 1 Outcomes

- Our recreated density plot revealed a discrepancy. Contrary to the study's claim, the median PM2.5 value for 2020 was higher than in the previous three years.
- The inconsistency was traced to a bug in the original study's code. The authors had erroneously used data from only the first three days of the year, rather than the lockdown months.
- The world map we generated, using detailed city data, also differed significantly from the study's version, raising questions about the data sources and methods used by the original authors.

Figure 1C - Paper Figure:
<img style="margin: 10px; max-height: 550px; width: auto; @media (max-width: 550px) { max-height: 100%; width: auto; }" src="https://github.com/aleksgeorgi/MicrosoftResearchSummerDataScienceSchoolCoursework/blob/master/week4/Images/Paper-WorldMap.png" alt="Figure 1C - World Map and Density" />

Figure 1C - Our Recreation, Density Plot:
<img style="margin: 10px; max-height: 550px; width: auto; @media (max-width: 550px) { max-height: 100%; width: auto; }" src="https://github.com/aleksgeorgi/MicrosoftResearchSummerDataScienceSchoolCoursework/blob/master/week4/Images/DensityPlot.png" alt="DensityPlot" />

Figure 1C - Our Recreation, Wold Map:
<img style="margin: 10px; max-height: 550px; width: auto; @media (max-width: 550px) { max-height: 100%; width: auto; }" src="https://github.com/aleksgeorgi/MicrosoftResearchSummerDataScienceSchoolCoursework/blob/master/week4/Images/WoldMap.png" alt="WorldMap" />

### Task 2 Outcomes

- Our simplified model, which did not account for complex variables like weather patterns, showed a considerable variance from the original study's relative change figures.

Figure 3B - Paper Figure:
<img style="margin: 10px; max-height: 550px; width: auto; @media (max-width: 550px) { max-height: 100%; width: auto; }" src="https://github.com/aleksgeorgi/MicrosoftResearchSummerDataScienceSchoolCoursework/blob/master/week4/Images/Paper_Figure3B.png" alt="Relative Change" />

Figure 3B - Our Recreation, Relative Change:
<img style="margin: 10px; max-height: 550px; width: auto; @media (max-width: 550px) { max-height: 100%; width: auto; }" src="https://github.com/aleksgeorgi/MicrosoftResearchSummerDataScienceSchoolCoursework/blob/master/week4/Images/RelativeChange.png" alt="Relative Change" />

## Impact and Recognition

Our analysis uncovered critical errors in the original study, leading to [a formal correction](https://www.pnas.org/doi/10.1073/pnas.2320514120) by the authors and recognition of our contribution in 'The Proceedings of the National Academy of Sciences' (PNAS). This project not only highlights our analytical skills and attention to detail but also underscores the importance of data integrity in scientific research.

## Summary

This project was a profound learning experience in data analysis, critical thinking, and collaboration. Working alongside Microsoft Research scientists, we demonstrated that meticulous data analysis could have a significant impact on the scientific community and public understanding.

More information on the Data Science Summer School fellowship is available [here](http://ds3.research.microsoft.com).
