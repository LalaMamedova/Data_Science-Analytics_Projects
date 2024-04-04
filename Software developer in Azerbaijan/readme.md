# Software Developer Vacancies in Azerbaijan: Data Analysis

This project aims to analyze software developer job vacancies in Azerbaijan to understand trends in skills demand, popular languages, frequency of postings, and other relevant insights.

## Data Collection and Analysis

The data was collected by scraping [busy.az](https://busy.az/) for software developer vacancies using a custom-built program. The analysis was conducted using Python and various libraries, including BeautifulSoup for parsing HTML, pandas for data manipulation, matplotlib for visualization, and fuzzywuzzy for string matching.

## Dataset Description

The dataset consists of 889 software developer job vacancies. Each entry includes the vacancy name, URL, posting company, required age, salary, required skills, alternative vacancy name, posting date, and deadline date.

For detailed analysis and code, please refer to the `data.ipynb` file.

## Libraries Used

- requests
- BeautifulSoup
- json
- pandas
- matplotlib (pyplot)
- fuzzywuzzy
- calendar

### File Structure
- `README.md`: This file provides an overview of the project.

# V1
- `website data.ipynb`: Main Jupyter Notebook containing detailed analysis and code.
- `website parsing.py`: Program for parsing `Busy.az`.

### Excel Files
- `main vacancy_data.xlsx`: Main Excel file with all data.
- `vacancy primary info.xlsx`: Excel file with information about the vacancy in one line, for example title, URL, etc.
- `vacancy skills.xlsx`: Excel file with skills needed for the job.

# V2
- `website data.ipynb`: Main Jupyter Notebook containing detailed analysis and code.
- `website parsing.py`: Program for parsing `Busy.az`.
- `change old excel format.py`: Program for changing old `vacancy_data_part_one` and `vacancy_data_part_two` to new `full vacancy data`.

### Excel Files
- `vacancy_data_part_one.xlsx`: Data about vacancies from March 2024 to January 2021.
- `vacancy_data_part_two.xlsx`: Data about vacancies from January 2021 to February 2015.
- `full vacancy data.xlsx`: Combined file containing data from the first two files.

## Usage
1. Clone the repository.
2. Open `website parsing.py` in Python for parsing fresh vacancies.
   In the `V1` folder, `website parsing.py` parses only the first 90 pages, while in `V2`, it parses from page 91 to 160 (the last page in April 2024). However, you can parse from page 1 to 160+.
3. Open `website data.ipynb` in Jupyter Notebook or JupyterLab to view the analysis.
4. Execute the cells in the notebook to reproduce the analysis or modify as needed.

Have a nice read!
