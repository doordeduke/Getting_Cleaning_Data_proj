# Getting and Cleaning Data Project

After importing the measurement, activity, and subject data for the training and test groups, the script uses rbind to merge each of these data sets.

It then labels the 561 measurement columns with the appropriate measurement name and uses grep pattern matching to find the measurements involving mean and standard deviations. 

Next, the activity data is converted from a numeric code to a simple description after importing the appropriate table containing the descriptions.

The appropriately labeled measurement data is merged with the activity descriptions and subject identifiers using cbind; then the activity and subject columns are correctly labeled.  This is the fully labeled data set.

The aggregate function helps tidy the data, computing the mean per activity per person in the study. The resultant table is cleaned up, yielding the final tidy data set.

