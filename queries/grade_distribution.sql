--Распределение грейдов

WITH total AS (
  SELECT COUNT(*) AS total_count
  FROM public.parcing_table
  WHERE name ILIKE '%налитик данных%' 
     OR name ILIKE '%data analyst%' 
     OR name ILIKE '%ата аналитик%'
     OR name ILIKE '%налитик Данных%'  
     OR name ILIKE '%ата Аналитик%'
),
grade_distribution AS (
  SELECT
    CASE 
      WHEN name ILIKE '%налитик данных%' THEN 'Аналитик данных' 
      WHEN name ILIKE '%data analyst%' THEN 'Аналитик данных'
      WHEN name ILIKE '%ата аналитик%' THEN 'Аналитик данных'
      WHEN name ILIKE '%ата Аналитик%' THEN 'Аналитик данных'
      WHEN name ILIKE '%налитик Данных%' THEN 'Аналитик данных'
      ELSE name 
    END AS role,
    experience,
    COUNT(id) AS count
  FROM public.parcing_table
  GROUP BY role, experience
)
SELECT 
  role,
  experience,
  count,
  ROUND(100.0 * count / total.total_count, 2) AS percent
FROM grade_distribution, total
ORDER BY count DESC
-- Наибольшее количество вакансий предназначено для специалистов с опытом от 1 до 3 лет (Junior+), 
-- что свидетельствует о высоком спросе на специалистов начального и среднего уровней. 
-- Вакансий для Middle-специалистов (3–6 лет) также много, в то время как спрос 
-- на Senior-специалистов (6+ лет) крайне низкий, возможно, из-за узкого круга
-- специалистов с таким уровнем опыта или предпочитаемых долгосрочных позиций.
-- Однако важно понимать, что Senior-аналитиков могут чаще искать по другим каналам.
