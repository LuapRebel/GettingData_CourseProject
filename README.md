---
title: "README - run_analysis.R script"
date: "10/15/2014"
output: html_document
---
****
# Overview 

The run_analysis.R script will process the "Human Activity Recognition Using Smartphones Data Set" from the UCI Machine Learning Repository located at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset itself is located at:

http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

****
## How the script works

### Downloads and unzips the data
* Checks to see whether data is present
* Downloads data if not present
* Unzips data

### Merges data in zip file to create one dataset
* Imports features data, which will be used to name variables
* Imports/merges test data
* Imports/merges training data
* Merges test and training data together

### Selects columns for use in final dataset
* Creates factor variables from set, activity, and subject variables
* Selects columns with Mean and Standard Deviation variables
* Renames columns to be more human readable

### Creates a "tidy" dataset
* A list of the average values of the variables in the final dataset, broken down by **subject** and **activity**

****

## To use run_analysis.R:
* Place run_analysis.R in your working directory
* type source("run_analysis.R")

run_analysis.R will produce:
    tidy.txt, a "tidy" dataset consisting of 180 observations of 68 variables
