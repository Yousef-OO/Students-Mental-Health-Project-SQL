# Students-Mental-Health-Project-Using-SQL
Studying abroad can be exciting and also challenging and full of difficulties. In this project I used my data manipulation skills to explore the data of a study on the mental health of international students using SQL

The goal is to explore how the length of stay impacts mental health diagnostic scores of international students. This study focuses on three key metrics:

1. PHQ-9 (todep): Depression severity.
2. SCS (tosc): Social connectedness.
3. ASISS (toas): Acculturative stress.


I initially explored the table to make sure I accuratly chose the right variables for my goal:

1. 'inter_dom': to filter out the domestic students and focus on international ones.
2. 'stay': the length of stay in years.
3. 'todep', 'tosc', 'toas': Quantitative test scores used for calculating depression, social connectedness, and acculturative stress scores respectively.


A description of the columns.

| Field Name    | Description                                      |
| ------------- | ------------------------------------------------ |
| `inter_dom`     | Types of students (international or domestic)   |
| `japanese_cate` | Japanese language proficiency                    |
| `english_cate`  | English language proficiency                     |
| `academic`      | Current academic level (undergraduate or graduate) |
| `age`           | Current age of student                           |
| `stay`          | Current length of stay in years                  |
| `todep`         | Total score of depression (PHQ-9 test)           |
| `tosc`          | Total score of social connectedness (SCS test)   |
| `toas`          | Total score of acculturative stress (ASISS test) |



SQL Query:

```sql
SELECT 
    stay,
    COUNT(*) AS count_int,
    ROUND(AVG(todep), 2) AS average_phq,
    ROUND(AVG(tosc), 2) AS average_scs,
    ROUND(AVG(toas), 2) AS average_as
FROM students
WHERE inter_dom = 'Inter'
  AND stay IS NOT NULL
GROUP BY stay
ORDER BY stay DESC;


