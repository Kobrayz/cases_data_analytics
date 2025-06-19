-- основные работодатели, предлагаемые зарплаты и условия труда для аналитиков
SELECT employer,
       COUNT(*) AS num_vacancies,
       ROUND(AVG(salary_from), 2) AS avg_salary_from,
       ROUND(AVG(salary_to), 2) AS avg_salary_to,
       employment,
       schedule
FROM public.parcing_table 
WHERE (
    name ILIKE '%аналитик данных%' 
    OR name ILIKE '%data analyst%' 
    OR name ILIKE '%системный аналитик%'
)
GROUP BY employer, employment, schedule 
ORDER BY num_vacancies DESC
--
-- СБЕР выделяется как основной работодатель для аналитиков данных и системных аналитиков 
-- с 134 вакансиями и средней зарплатой от 125500 рублей до 130666 рублей. 
-- Средняя зарплата «до» ниже средней зарплаты «от» — скорее всего, СБЕР часто пишет сумму «до», не указываю сумму «от». 
-- Основной тип занятости в СБЕР — полная занятость с полным рабочим днём. Значит, компания предпочитает длительное сотрудничество с сотрудниками.

