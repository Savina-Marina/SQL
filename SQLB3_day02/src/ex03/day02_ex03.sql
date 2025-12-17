WITH all_dates(missing_date) AS(
    SELECT generate_series('2022-01-01', '2022-01-10', interval '1 day')::date
)
SELECT missing_date
FROM all_dates
LEFT JOIN person_visits pv ON all_dates.missing_date = pv.visit_date 
    AND (pv.person_id = 1 OR pv.person_id = 2)
WHERE pv.visit_date IS NULL
ORDER BY all_dates.missing_date;