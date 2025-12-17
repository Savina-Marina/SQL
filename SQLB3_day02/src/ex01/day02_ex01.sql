SELECT CAST(all_dates.missing_date AS date) AS missing_date
FROM (
    SELECT generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_date
) AS all_dates
LEFT JOIN person_visits pv ON all_dates.missing_date = pv.visit_date 
    AND (pv.person_id = 1 OR pv.person_id = 2)
WHERE pv.visit_date IS NULL
ORDER BY all_dates.missing_date;