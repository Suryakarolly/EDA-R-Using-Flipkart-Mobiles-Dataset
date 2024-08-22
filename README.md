# EDA-R-Using-Flipkart-Mobiles-Dataset

## Overview
This project explores and visualizes the Flipkart Mobiles dataset using R. The dataset encompasses various features of mobile phones listed on Flipkart, including brand, price, ratings, and more. The goal is to perform exploratory data analysis (EDA) and create insightful visualizations to better understand trends and patterns in the data.

## Dataset Contents
The dataset includes the following columns:

- *Brand*: The brand of the mobile phone.
- *Model*: The model name of the mobile phone.
- *Color*: The color of the mobile phone.
- *RAM*: The amount of RAM in the mobile phone (in GB).
- *Storage*: The internal storage capacity of the mobile phone (in GB).
- *Operating System*: The operating system running on the mobile phone.
- *Price*: The selling price of the mobile phone (in INR).
- *Rating*: The average user rating of the mobile phone.
- *Number of Ratings*: The total number of ratings received by the mobile phone.

## Usage
The dataset is well-suited for various types of analyses, including:

- *Price Analysis*: Examine pricing trends across different mobile brands and models.
- *Rating Analysis*: Investigate the relationship between mobile phone features and user ratings.
- *Market Research*: Identify popular brands and models based on ratings and reviews.
- *Feature Correlation*: Explore correlations between features such as RAM, storage, and price.

## Data Preparation
To prepare the dataset for analysis, follow these preprocessing steps:

### Objectives

*Data Cleaning:*
- Address missing values and outliers.
- Normalize or standardize numerical variables as required.

*Exploratory Data Analysis (EDA):*
- Analyze variable distributions.
- Visualize relationships between numerical variables using scatter plots and correlation heatmaps.
- Examine categorical variables and their impact on numerical outcomes with bar charts and stacked bar charts.

*Visualization:*
- Generate various plots to understand data patterns, including:
  - Scatter plots of selling price vs. rating
  - Correlation heatmaps
  - Stacked bar charts of mobile brands by rating

## Requirements
To execute this project, ensure you have the following R libraries:

- *ggplot2*: For creating plots
- *reshape2*: For data manipulation
- *corrplot*: For correlation plots (if applicable)

## Results
Here, include key insights and findings from your EDA:

- Trends in selling prices across different mobile brands.
- Correlation between ratings and selling prices.
- Distribution of ratings among various brands.
