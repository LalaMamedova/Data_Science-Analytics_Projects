# Software Developer Vacancies in Azerbaijan Data Analysis

This project aims to analyze software developer job vacancies in Azerbaijan to understand the trends in skills demand, popular languages, frequency of postings, and other relevant insights.

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

## File Structure

- `data.ipynb`: Main Jupyter Notebook containing detailed analysis and code.
- `busyAz_parsing.py`: Programm for `Busy.az` Parsing 
- `README.md`: This file, providing an overview of the project.
### Excel files
- `main vacancy_data.xlsx` : Main excel file with all data
- `vacancy primary info.xlsx` : Excel file with information about the vacancy in one line, for example title, url and etc
- `vacancy skills.xlsx` - Excel file with skills needed for the job

## Usage

1. Clone the repository.
2. Open `busyAz_parsing.py` in Python for parsing fresh vacancies
3. Open `data.ipynb` in Jupyter Notebook or JupyterLab to view the analysis.
4. Execute the cells in the notebook to reproduce the analysis or modify as needed.

Have a nice read!
