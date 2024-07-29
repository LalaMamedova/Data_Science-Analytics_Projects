# Income Prediction Model

This project aims to predict income levels based on various demographic and socio-economic factors using different machine learning models. The project involves data cleaning, analysis, visualization, and model evaluation. We will explore different techniques and compare the performance of various models.

### Files
* income_evaluation.xlsx: The original dataset containing raw demographic and socio-economic data. [Original dataset](https://www.kaggle.com/datasets/vijayadityads/income-evaluation)
* Clean_Income.xlsx: The cleaned version of the original dataset, with outliers removed, unnecessary columns stripped, and other necessary transformations.
* Income_ML.ipynb: The Jupyter notebook where data is explored, cleaned, and machine learning models (Random Forest, KNN, XGBoost, LGBM) are trained and evaluated.
* IncomeVisualization.twb: Tableau workbook visualizing the Clean_Income.xlsx dataset [Link to dashboards](https://public.tableau.com/app/profile/lal.m.mm.dova/viz/IncomeVisualization/Gaindashboard?publish=yes)

## Notebooks and Scripts
### Income_ML.ipynb
This notebook contains the following sections:

* Introduction: Overview of the project and objectives.
* Data Loading: Loading the dataset and performing initial exploration to understand the structure and content.
* Data Cleaning: Handling missing values, removing outliers, and performing necessary transformations.
* Exploratory Data Analysis (EDA): Visualizing the data to uncover insights and patterns that can inform the modeling approach.
* Feature Engineering: Creating new features to improve model performance.
* Model Training and Evaluation: Training various machine learning models and evaluating their performance on the training and test datasets.
* Model Comparison: Comparing the performance of different models to determine the best one for our income prediction task.

### Visualization
* IncomeVisualization.twb: This Tableau workbook visualizes the Clean_Income.xlsx dataset. It provides interactive dashboards that offer insights into the demographic and socio-economic factors influencing income levels. [Link to dashboards](https://public.tableau.com/app/profile/lal.m.mm.dova/viz/IncomeVisualization/Gaindashboard?publish=yes)

## Getting Started
### Prerequisites
1. Python 3.6 or higher
2. Jupyter Notebook - free
3. Libraries: pandas, numpy, matplotlib, seaborn, scikit-learn, xgboost, lightgbm, imblearn - free
4. Tableau Public - free (for viewing the Tableau workbook)

## For download this project
### 1. First variant
``` 
git clone https://github.com/LalaMamedova/Data_Science_Projects/tree/master/Data%20Science%20Projects/Income
```
### 2. Second variant
Download [Gitzip for chrome](https://chromewebstore.google.com/detail/gitzip-for-github/ffabmkklhbepgcgfonabamgnfafbdlkn?pli=1), check this folder and click to arrow button in right corner

## Results
* The project explores various machine learning models including Random Forest, KNN, XGBoost, and LGBM.
* The performance of each model is evaluated and compared based on their accuracy on the training and test datasets.
* Interactive visualizations in Tableau provide additional insights into the factors affecting income levels.

This project demonstrates the end-to-end process of predicting income levels using machine learning. From data cleaning and feature engineering to model training and visualization, each step is carefully documented and executed. Future work could include further model tuning, exploring additional algorithms, and incorporating more sophisticated feature engineering techniques.