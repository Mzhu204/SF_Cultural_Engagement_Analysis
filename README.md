# Recovery of San Francisco Cultural Institutions After COVID-19
### Overview
<img width="1375" height="1005" alt="SEGMENTED REGRESSION" src="https://github.com/user-attachments/assets/d09272f5-294c-4499-b97c-8fb69f1d4a4e" />

The COVID-19 pandemic disrupted nearly every public-facing establishment in San Francisco. Museums closed, libraries restricted access, and visitor participation collapsed across the city.

As someone with a background in the arts who is passionate about preserving and showcasing traditional mediums, I wanted to investigate how cultural institutions were affected and whether they have recovered to pre-pandemic engagement levels.

Using public performance data from San Francisco's municipal departments available on SF.gov, I analyzed visitor participation trends across several major cultural institutions, including:

San Francisco Public Library
De Young Museum
Legion of Honor
Asian Art Museum
California Academy of Sciences

The project combines exploratory data analysis, descriptive statistics, visualization, and interrupted time series modeling to measure both the severity of the COVID disruption and the extent of institutional recovery. 

## Research Question
### Have San Francisco cultural institutions recovered to their pre-pandemic participation levels?

To answer this question, I evaluated:

What participation looked like before COVID-19.
How severe the pandemic disruption was.
Whether or not participation has recovered since reopening.

## Dataset
### Source: San Francisco Citywide Performance Metrics Dataset : available at https://data.sfgov.org/City-Management-and-Ethics/San-Francisco-Citywide-Performance-Metrics/6dpt-7w23/about_data 

The dataset contains annual performance measures reported by San Francisco departments.

The Initial dataset:
51 departments
13 variables
Multiple performance measures per department
observations are annually reported starting from 2012-2015
some missing data from unreliable reporting

For this analysis I focused specifically on visitor headcounts reported by cultural institutions.

## Methodology
### Step 1: Establish a Pre-COVID Baseline

For each institution, I calculated the mean annual participation before COVID (first reported data –2019) as well as the Pre-pandemic participation growth rates. These averages establish what "normal" participation looked like at each institution before the pandemic.

### Step 2: Analyze the Pandemic Shock

COVID-era participation was measured using observations from 2020–2021. The severity of the disruption was quantified by comparing Pandemic Mean Participation relative to Pre-COVID Mean Participation. This shows how severely different institutions were affected.

### Step 3: Measure Recovery

Recovery was evaluated using a Recovery Ratio which was calculated by dividing Post-COVID Mean / Pre-COVID Mean. 

Interpretation:

1.0 = Full recovery
Greater than 1.0 = Exceeded pre-pandemic participation
Less than 1.0 = Not fully recovered

## Interrupted Time Series Model

To estimate overall participation trends while accounting for institutional differences, I fit a pooled interrupted time series model:

Participation = β₀ + β₁(Time) + β₂(PostCOVID) + β₃(Time × PostCOVID) + Institution + ε

Where:

Time measures annual trend
PostCOVID identifies COVID shock
Time × PostCOVID measures recovery trajectory
Institution controls for baseline participation differences

## Key Findings

### Public Library 

During the pandemic, SF Public Libraries saw a a 65% drop in visitors. The pre-pandemic growth rate was approximately -144,423 people per year vs a post-pandemic growth rate of 626,365 people per year since 2021. As of 2025, the Recovery Ratio of 0.58 suggests that visitor counts are 60% of what they were pre-pandemic. 

### De Young Museum 

During the pandemic, the De Young Museum also saw a 65% drop in visitors. The pre-pandemic growth rate was approximately -39,536 people per year vs a post-pandemic growth rate of +61,542 people per year since 2021. As of 2025, the Recovery Ratio of 0.70 suggests that visitor counts are 70% of what they were pre-pandemic. 

### Legion of Honor 

The closest institution to a full recovery. The pre-pandemic growth rate was approximately +3,927 per year vs a post-pandemic growth rate of around +29,479 people per year since 2021. During the pandemic, the Legion of Honor saw a 66% drop in visitors. As of 2025, the Recovery Ratio of 0.92 suggests that visitor counts are 92% of what they were pre-pandemic. 

### Asian Art Museum 

The lowest recovery ratio among analyzed institutions. The pre-pandemic growth rate was approximately -17,988 people per year vs a post-pandemic growth rate of -10,345 people per year since 2021. During the pandemic, the Asian Art Museum saw a 77% drop in visitors. As of 2025, the Recovery Ratio of 0.54 suggests that visitor counts are only 54% what they were pre-pandemic.

### California Academy of Sciences 

Significant rebound following severe pandemic losses. The pre=pandemic growth rate was approximately -20,353 people per year vs a post-pandemic growth rate of +148,851 people per year since 2021. During the pandemic, the Asian Art Museum saw a 61% drop in visitors. As of 2025, the Recovery Ratio of 0.80 suggests that visitor counts are 80% what they were pre-pandemic.

## Pooled Model Results

The interrupted time series model suggests that unfortunately, participation was already on the decline before COVID. Then, COVID caused an immediate loss in the multiple millions of annual visitors across institutions. Post-pandemic, participation trends are positive, indicating ongoing recovery as numbers rise towards pre-pandemic averages.

## Estimated coefficients:

Pre-COVID Trend: approximately -141,000 visitors per year
Immediate COVID Shock: approximately -3.2 million visitors
Recovery Trend: approximately +375,000 visitors per year

These results suggest that while institutions have not fully recovered, participation is generally moving in a positive direction.

## Limitations

Several limitations were observed:

1. Annual data provides relatively few observations.
2. Some institutions reported missing values during the pandemic period.
4. Recovery is not be linear and thus can be difficult to quantify cleanly.
5. The interrupted time series model assumes constant post-COVID recovery trends.
6. Results should be interpreted as descriptive rather than causal.

Future work could incorporate nonlinear forecasting methods or institution-specific recovery models. 

## Repository Structure
data/
    raw/
    cleaned/

scripts/
    01_data_cleaning.R
    02_exploratory_analysis.R
    03_recovery_metrics.R
    04_interrupted_time_series.R

figures/
    public_library.png
    deyoung.png
    legion_of_honor.png
    asian_art_museum.png
    academy_of_sciences.png

README.md

## Skills Demonstrated
Data cleaning in R
Exploratory data analysis
Data visualization with ggplot2
Time series analysis
Fixed-effects regression
Interrupted time series modeling
Public-interest data storytelling
Communicating statistical results to non-technical audiences
