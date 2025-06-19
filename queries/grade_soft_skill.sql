--наиболее востребованные навыки (мягкие) для различных грейдов и позиций
SELECT experience, soft_skill, COUNT(id)
FROM (
SELECT id, experience, TRIM(soft_skills_1) AS soft_skill
FROM public.parcing_table
UNION
SELECT id, experience, TRIM(soft_skills_2)
FROM public.parcing_table
UNION
SELECT id, experience, TRIM(soft_skills_3)
FROM public.parcing_table
UNION
SELECT id, experience, TRIM(soft_skills_4)
FROM public.parcing_table
) AS s_skills 
WHERE soft_skill IS NOT NULL
GROUP BY experience, soft_skill 
ORDER BY COUNT(id) DESC
-- Топ 3
--Junior+ (1-3 years)	Документация	150
--Junior+ (1-3 years)	Аналитическое мышление	114
--Middle (3-6 years)	Документация	109
