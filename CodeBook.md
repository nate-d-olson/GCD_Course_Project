---
title: "Code Book"
author: "nate_olson"
date: "June 21, 2014"
output: html_document
---

This is a description of the variables, data, and transformations performed to clean up the activity data from [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)




## Variables

<!-- html table generated in R 3.0.3 by xtable 1.7-3 package -->
<!-- Sat Jun 21 11:45:29 2014 -->
<TABLE border=1>
<TR> <TH> Variables </TH> <TH> Description </TH>  </TR>
  <TR> <TD> subject </TD> <TD> Subject who performed the activity for each window sample. Its range is from 1 to 30.  </TD> </TR>
  <TR> <TD> activity_name </TD> <TD> Type of activity performed while the measurements were acquired </TD> </TR>
  <TR> <TD> feature_names </TD> <TD> Description of accelerometer vector measurement </TD> </TR>
  <TR> <TD> feature_stat </TD> <TD> statistical summary of the feature </TD> </TR>
  <TR> <TD> average </TD> <TD> mean value </TD> </TR>
   </TABLE>

## Data
The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone.  This data can used to develop algorithms for classifying an activity based on accelerometer measurements.

## Transformations
The data set generated by `run_analysis.R` combines the test and training data sets then presents a summary in the form of the average value of the mean and standard deviation of the different accelerometer measurements for each subject and activity.


#### Additional Notes
This document was created using Rmarkdown where the variables were generated from the input data files.
