--наиболее востребованные навыки (жёсткие) для различных грейдов и позиций
SELECT experience, key_skill, COUNT(id)
FROM (
SELECT id, experience, key_skills_1 AS key_skill
FROM public.parcing_table
UNION
SELECT id, experience, key_skills_2
FROM public.parcing_table
UNION
SELECT id, experience, key_skills_3
FROM public.parcing_table
UNION
SELECT id, experience, key_skills_4
FROM public.parcing_table
) AS skills
WHERE key_skill IS NOT NULL AND key_skill <> ''
GROUP BY experience, key_skill 
ORDER BY COUNT(id) DESC
-- топ 3
--Junior+ (1-3 years)	SQL	467
--Junior+ (1-3 years)	Анализ данных	252
--Middle (3-6 years)	SQL	247

