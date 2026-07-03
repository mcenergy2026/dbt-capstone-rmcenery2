WITH date_spine AS (

    SELECT *
    FROM {{ ref('date_spine') }}

),

final AS (

    SELECT
        date_day,
        year_number AS date_year,
        quarter_number AS date_quarter,
        month_number AS date_month,
        week_number AS date_week,
        day_of_month AS date_day_of_month
    FROM date_spine

)

SELECT *
FROM final
