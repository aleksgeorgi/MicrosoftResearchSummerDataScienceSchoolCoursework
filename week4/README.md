# Week 4 Instructions

This is the week of our final project

# Day 1

## Predicting daily Citibike trips (open-ended)

The point of this exercise is to get experience in an open-ended prediction exercise: predicting the total number of Citibike trips taken on a given day. Create an RMarkdown file named `predict_citibike.Rmd` and do all of your work in it.

Here are the rules of the game:

1. Use the `trips_per_day.tsv` file that has one row for each day, the number of trips taken on that day, and the minimum temperature on that day.
2. Split the data into randomly selected training, validation, and test sets, with 90% of the data for training and validating the model, and 10% for a final test set (to be used once and only once towards the end of this exercise). You can adapt the code from last week's [complexity control notebook](../week3/complexity_control.ipynb) to do this. When comparing possible models, you can use a single validation fold or k-fold cross-validation if you'd like a more robust estimate.
3. Start out with the model in that notebook, which uses only the minimum temperature on each day to predict the number of trips taken that day. Try different polynomial degrees in the minimum temperature and check that you get results similar to what's in that notebook, although they likely won't be identical due to shuffling of which days end up in the train, and validation splits. Quantify your performance using [root mean-squared error](https://www.kaggle.com/wiki/RootMeanSquaredError).
4. Now get creative and extend the model to improve it. You can use any features you like that are available prior to the day in question, ranging from the weather, to the time of year and day of week, to activity in previous days or weeks, but don't cheat and use features from the future (e.g., the next day's trips). You can even try adding [holiday](https://gist.github.com/shivaas/4758439) effects. You might want to look at feature distributions to get a sense of what tranformations (e.g., `log` or manually created factors such as weekday vs. weekend) might improve model performance. You can also interact features with each other. This [formula syntax in R](https://cran.r-project.org/doc/manuals/R-intro.html#Formulae-for-statistical-models) reference might be useful.
5. Try a bunch of different models and ideas, documenting them in your Rmarkdown file. Inspect the models to figure out what the highly predictive features are, and see if you can prune away any negligble features that don't matter much. Report the model with the best performance on the validation data. Watch out for overfitting.
6. Plot your final best fit model in two different ways. First with the date on the x-axis and the number of trips on the y-axis, showing the actual values as points and predicted values as a line. Second as a plot where the x-axis is the predicted value and the y-axis is the actual value, with each point representing one day.
7. When you're convinced that you have your best model, clean up all your code so that it saves your best model in a `.RData` file using the `save` function.
8. Commit all of your changes to git, using `git add -f` to add the model `.Rdata` file if needed, and push to your Github repository.
9. Finally, use the model you just developed and pushed to Github to make predictions on the 10% of data you kept aside as a test set. Do this only once, and record the performance in your Rmarkdown file. Use this number to make a guess as to how your model will perform on future data (which we'll test it on!). Do you think it will do better, worse, or the same as it did on the 10% test set you used here? Write your answer in your Rmarkdown notebook. Render the notebook and push the final result to Github.

# Day 2

## Testing your Citibike models

Now you're going to test the model you developed yesterday using trips from 2014 with data from 2015 and 2020.

1. First you'll need to get data for 2015. Make a copy of the the [download_trips.sh](../week1/download_trips.sh) script from week 1 here and modify it to download all trips from 2015. You can call it `download_trips_2015.sh`.
2. Then make a copy of the [load_trips.R](../week1/load_trips.R) script from week 1 here and modify it to load the 2015 trip data along with weather data for 2015 contained in [weather_2015-2022.csv](weather_2015-2022.csv). You can call it `load_trips_2015.R`. If you used any other data for your model, make sure to include code that downloads and incorporates that data as well. The result should be a `trips_2015.Rdata` file similar to what you used to develop your model, but containing data from 2015 (instead of 2014).
3. Write a new file called `test_citibike_predictions.Rmd` that loads in the 2015 `trips_2015.Rdata` file and weather data along with your saved model (from yesterday's `.Rdata` file, and predicts the number of trips for each day.
4. Compute the RMSE between the actual and predicted trips for 2015 and compare the results to what you found with cross-validation on the 2014 data.
5. Now repeat this whole process for 2020. Create new `download_trips_2020.sh` and `load_trips_2020.R` files, and add your analyses for 2020 to a new section of your `test_citibike_predictions.Rmd` file. (Tip: you may have to debug and modify the url construction in the download script a bit to get things working for 2020!)
6. Pair up with a partner who has a different model, use their code to run their model, and evaluate the predictions it makes for 2015 and for 2020.
7. Write up any thoughts you have about this exercise in your Rmarkdown file, ranging from how the model performed in 2014 vs. 2015 vs. 2020, challenges you faced in running it on new data, or issues that came up in running each other's code. Commit and push the file to Github when you're done.

Now you're going to test the model you developed yesterday using trips from 2014 with data from 2015.

8. First you'll need to get data for 2015. Make a copy of the the [download_trips.sh](../week1/download_trips.sh) script from week 1 here and modify it to download all trips from 2015. You can call it `download_trips_2015.sh`.
9. Then make a copy of the [load_trips.R](../week1/load_trips.R) script from week 1 here and modify it to load the 2015 trip data along with weather data for 2015 contained in [weather_2015.csv](weather_2015.csv). You can call it `load_trips_2015.R`. If you used any other data for your model, make sure to include code that downloads and incorporates that data as well. The result should be a `trips_2015.Rdata` file similar to what you used to develop your model, but containing data from 2015 (instead of 2014).
10. Write a new file called `test_citibike_predictions.Rmd` that loads in the 2015 `trips_2015.Rdata` file and weather data along with your saved model (from yesterday's `.Rdata` file, and predicts the number of trips for each day.
11. Compute the RMSE between the actual and predicted trips for 2015 and compare the results to what you found with cross-validation on the 2014 data.
12. Pair up with a partner who has a different model, use their code to run their model, and evaluate the predictions it makes for 2015 and for 2020.
13. Write up any thoughts you have about this exercise in your Rmarkdown file, ranging from how the model performed in 2014 vs. 2015, challenges you faced in running it on new data, or issues that came up in running each other's code. Commit and push the file to Github when you're done.

# Day 3

## Project

Check out the [project](project/) details and being working on it.

<!--
>>>>>>> 4b734739a5236906bb9c364f91999e1c7cb59a11

## Thinking about experiments

These two exercises take a look at two questions and how they might be answered by randomized experiments. Use the Rmarkdown files in each directory as a template for your solution.

* [Investigating link between coffee and cancer](https://github.com/jhofman/msd2019/tree/master/homework/homework_2/problem_1)
* [Is yawning contagious?](https://github.com/jhofman/msd2019/tree/master/homework/homework_2/problem_2)

-->
