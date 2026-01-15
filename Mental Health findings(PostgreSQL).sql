-- The following query simply views the first five rows of the data to start exploring the data at hand

SELECT * 
FROM students_data
LIMIT 5;

/* After initially exploring the students data, we would like to see how the length of stay affects the mental health 
   diagnostic scores of the international students */

SELECT stay,
	   COUNT(*) AS count_int, 
	   ROUND(AVG(todep)::numeric, 2) AS average_phq,
	   ROUND(AVG(tosc)::numeric, 2) AS average_scs,
	   ROUND(AVG(toas)::numeric, 2) AS average_as
FROM students_data
WHERE (inter_dom = 'Inter') AND (stay IS NOT NULL)
GROUP BY stay
ORDER BY stay DESC;

 -- The average columns contain the average of the `todep` (PHQ-9 test), `tosc` (SCS test), and `toas` (ASISS test) columns 
 -- for each length of stay, rounded to two decimal places.
 -- The `count_int` column is the number of international students for each length of stay.
 -- Sorted the results by the length of stay in descending order

 -- the data shows that among 8 groups of different ages they suffer from mild depression 
 -- as they scored from 4 to 9 on average and the 10 years category might not be representative
 -- for the whole population but it still shows or indicate that the more the time international students spend
 -- in another culuture, the more the risk of high depression.
 
 -- while the students might suffer from light depression. The socre of social connectedness which 
 -- shows the level or extent to which individuals feel connected to otheres in their culutural environment
 -- This shows an important conclusion that the 'Alaska Pacific University' provides their international students
 -- a robust support and feelings of belonging to the culture and the University's atmosphere.
 

