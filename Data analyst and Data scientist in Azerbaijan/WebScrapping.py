from bs4 import BeautifulSoup
import requests
import pandas as pd


def busy_az_scrapping(url,file_name,vacancy_index):

    all_vacancy = []
    vacancy_data = {}
    link_page = 1
    
    while True:
        
        link = f"{url}{link_page}"
        response =  requests.get(link)
        content = response.content
        

        soup = BeautifulSoup(content, 'lxml',from_encoding='utf-8')
        all_vacancy_cards = soup.find_all('a', class_="job-listing with-apply-button")

        if(len(all_vacancy_cards) > 0):

            for card in all_vacancy_cards:

                location = ''
                type_of_employment = ''
                age_category = ''
                education_degree = ''
                salary = ''
                posting_date = ''
                deadline_date = ''
                all_skills = ''
                all_alter_name = ''

                vacancy_name = card.find("h3", class_="job-listing-title").get_text()
                company_name = card.find("li").get_text().replace("\n", "").strip()
                link_to_vacancy_detail = card.get("href")

                response_to_vacancy_detail = requests.get(link_to_vacancy_detail).content

                vacancy_detail_soup = BeautifulSoup(response_to_vacancy_detail, 'lxml',from_encoding='utf-8')
                vacancy_details = vacancy_detail_soup.find("div", class_="job-overview-inner")

                if vacancy_details.find("span", string="Yer"):
                    location = vacancy_details.find("span", string="Yer").find_next_sibling("h5").text.strip()
                    

                if vacancy_details.find("span", string="Məşğulluq növü"):
                    type_of_employment = vacancy_details.find("span", string="Məşğulluq növü").find_next_sibling("h5").text.strip()

                if vacancy_details.find("span", string="Yaş"):
                    age_category = vacancy_details.find("span", string="Yaş").find_next_sibling("h5").text.strip()

                if vacancy_details.find("span", string="Təhsil"):
                    education_degree = vacancy_details.find("span", string="Təhsil").find_next_sibling("h5").text.strip()

                if vacancy_details.find("span", string="Maaş"):
                    salary = vacancy_details.find("span", string="Maaş").find_next_sibling("h5").text.strip()

                if vacancy_details.find("span", string="Elanın qoyulma tarixi"):
                    posting_date = vacancy_details.find("span", string="Elanın qoyulma tarixi").find_next_sibling("h5").text.strip()

                if vacancy_details.find("span", string="Son müraciət tarixi"):
                    deadline_date = vacancy_details.find("span", string="Son müraciət tarixi").find_next_sibling("h5").text.strip()


                if vacancy_details.findAll("div", class_="task-tags"):
                    tags_container = vacancy_details.findAll("div", class_="task-tags")

                    if len(tags_container) > 0:
                        all_skills = [tag.text.strip() for tag in tags_container[0].find_all("span")]

                    if len(tags_container) > 1:
                        all_alter_name = [tag.text.strip() for tag in tags_container[1].find_all("span")]



                vacancy_data = {
                    "Id": vacancy_index,
                    "Name": vacancy_name,
                    "Url to Vacancy": link_to_vacancy_detail,
                    "Company": company_name,
                    'Location':location,
                    'Type of Employment ':type_of_employment,
                    'Age Range':age_category,
                    'Skills':all_skills,
                    'Posting Date':posting_date,
                    'Deadline Date':deadline_date,
                    'Salary':salary,
                    'Education Degree':education_degree,
                    "Vacancy Alter Name":all_alter_name
                }

                all_vacancy.append(vacancy_data)
                
                if vacancy_index % 10 == 0:
                    df = pd.DataFrame.from_dict(all_vacancy)
                    df.to_excel(f'{file_name}.xlsx',index=False)

                vacancy_index +=1
        else: 
            break

        link_page+=1
        print(link)

busy_az_scrapping("https://busy.az/professions/data-analyst?page=","Data analytics",1)
busy_az_scrapping("https://busy.az/professions/data-scientist?page=","Data scientist",1)
