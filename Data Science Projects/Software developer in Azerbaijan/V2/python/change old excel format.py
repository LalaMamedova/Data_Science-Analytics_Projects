import pandas as pd

old_excel_format = pd.read_excel("../data/vacancy_data_part_one.xlsx")
part_two = pd.read_excel("../data/vacancy_data_part_two.xlsx")

grouped_skills = old_excel_format.groupby("Id")["Skills"].apply(list)
grouped_alter_name = old_excel_format.groupby("Id")["Vacancy Alter Name"].apply(list)

skills_as_dict = grouped_skills.to_dict()
alter_name_as_dict = grouped_alter_name.to_dict()

old_excel_format["Skills"] = old_excel_format["Id"].map(skills_as_dict)
old_excel_format["Vacancy Alter Name"] = old_excel_format["Id"].map(alter_name_as_dict)

new_excel = old_excel_format.drop_duplicates(subset=['Id'])
combined_data = pd.concat([new_excel, part_two], ignore_index=True)


combined_data.to_excel('../data/full vacancy data.xlsx.xlsx')