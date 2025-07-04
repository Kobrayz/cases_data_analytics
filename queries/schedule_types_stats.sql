SELECT schedule,  COUNT(id)
FROM public.parcing_table 
GROUP BY schedule
ORDER BY COUNT(id) DESC
--
--      schedule     | num_vacancies 
-- ------------------+---------------
--  Полный день      |          1441
--  Удаленная работа |           310
--  Гибкий график    |            41
--  Сменный график   |             9
--
--
-- Большинство вакансий (1441) предлагают работу с полным днём. 
-- Однако значительное количество вакансий (310) также позволяет 
-- удалённую работу. Это указывает на то, что работодатели готовы быть
-- гибкими в современных условиях. Возможно, в ответ на пандемию COVID-19 
-- и изменения в предпочтениях работников.
--
--
