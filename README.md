README
======

### 1. Introduction
This repository is destinated to the project of the Coursera "Getting and Cleaning Data" course. The project goal is to transform the [UCI-HAR Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) in tidy data, ready for statistical analisys. 

### 2. Contents
This repo contains:

* **CodeBook.md**: describes what UCI-HAR raw data should be collected and how it is transformed in tidy data. It also shows the structure of the tidy data.

* **run_analisys**: the R script which transforms the raw data in tidy data.

### 3. Software Requirements.

* R statistical software.
* The library "reshape2" installed in R statistical software.
* The UCI-HAR Data Set file. It can be obtained in [UCI-HAR site](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip).

### 4. Instructions

4.1 Download the UCI-HAR data set zipped file (UCI HAR Dataset.zip).

4.2 Unzip the data set file in the same directory of the "run_analisys.R" script. The data files will be stored in the "UCI-HAR Dataset" folder.

4.3 Run the "run_analisys.R" script.

4.4 The output of script is the text file "UCI-HAR-TidyData.txt" which contains the tidy data, ready for analysis.
