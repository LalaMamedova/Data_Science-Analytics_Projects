from bs4 import BeautifulSoup
import requests
import pandas as pd


all_data = []
vacancy_data = {}
vacancy_index = 890

for i in range(91,169):
    webLink = f"https://busy.az/professions/software-developer?page={i}"
    response = requests.get(webLink).content
    soup = BeautifulSoup(response, 'lxml',from_encoding='utf-8')
    all_vacancy_cards = soup.find_all('a', class_="job-listing with-apply-button")

    for card in all_vacancy_cards:
        vacancy_name = card.find("h3", class_="job-listing-title").get_text()
        company_name = card.find("li").get_text().replace("\n", "").strip()
        link_to_vacancy_detail = card.get("href")

        response_to_vacancy_detail = requests.get(link_to_vacancy_detail).content
        vacancy_details = BeautifulSoup(response_to_vacancy_detail, 'lxml',from_encoding='utf-8').find("div", class_="job-overview-inner")

        if vacancy_details.find("span", string="Yer"):
            location = vacancy_details.find("span", string="Yer").find_next_sibling("h5").text.strip()
            vacancy_data["Location"] = location
        else:
            vacancy_data["Location"] = ""

        if vacancy_details.find("span", string="Məşğulluq növü"):
            type_of_employment = vacancy_details.find("span", string="Məşğulluq növü").find_next_sibling("h5").text.strip()
            vacancy_data["Type of Employment"] = type_of_employment
        else:
            vacancy_data["Type of Employment"] = ""

        if vacancy_details.find("span", string="Yaş"):
            age_category = vacancy_details.find("span", string="Yaş").find_next_sibling("h5").text.strip()
            vacancy_data["Age category"] = age_category
        else:
            vacancy_data["Age category"] = ""

        if vacancy_details.find("span", string="Təhsil"):
            education_degree = vacancy_details.find("span", string="Təhsil").find_next_sibling("h5").text.strip()
            vacancy_data["Education degree"] = education_degree
        else:
            vacancy_data["Education degree"] = ""

        if vacancy_details.find("span", string="Maaş"):
            salary = vacancy_details.find("span", string="Maaş").find_next_sibling("h5").text.strip()
            vacancy_data["Salary"] = salary
        else:
            vacancy_data["Salary"] = ""

        if vacancy_details.find("span", string="Elanın qoyulma tarixi"):
            posting_date = vacancy_details.find("span", string="Elanın qoyulma tarixi").find_next_sibling("h5").text.strip()
            vacancy_data["Posting Date"] = posting_date
        else:
            vacancy_data["Posting Date"] = ""

        if vacancy_details.find("span", string="Son müraciət tarixi"):
            deadline_date = vacancy_details.find("span", string="Son müraciət tarixi").find_next_sibling("h5").text.strip()
            vacancy_data["Deadline Date"] = deadline_date
        else:
            vacancy_data["Deadline Date"] = ""

        if vacancy_details.findAll("div", class_="task-tags"):
            tags_container = vacancy_details.findAll("div", class_="task-tags")

            if len(tags_container) > 0:
                all_tags = [tag.text.strip() for tag in tags_container[0].find_all("span")]
                vacancy_data["Skills"] = all_tags
            else:
                vacancy_data["Skills"] = ""

            if len(tags_container) > 1:
                all_alter_name = [tag.text.strip() for tag in tags_container[1].find_all("span")]
                vacancy_data["Vacancy Alter Name"] = all_alter_name
            else:
                vacancy_data["Vacancy Alter Name"] = ""

        vacancy_data = {
            "Id": vacancy_index,
            "Name": vacancy_name,
            "Url to Vacancy": link_to_vacancy_detail,
            "Company": company_name
        }
        all_data.append(vacancy_data)
        vacancy_index +=1

df = pd.DataFrame.from_dict(all_data)
df.to_excel('../data/vacancy_data_part_two.xlsx')

