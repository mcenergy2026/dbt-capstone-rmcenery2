WITH date_spine AS (

    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="to_date('2003-01-01')",
        end_date="to_date('2006-01-01')"
    ) }}

),

final AS (

    SELECT
        cast(date_day as date) AS date_day,
        year(cast(date_day as date)) AS year_number,
        quarter(cast(date_day as date)) AS quarter_number,
        month(cast(date_day as date)) AS month_number,
        day(cast(date_day as date)) AS day_of_month,
        dayofweekiso(cast(date_day as date)) AS day_of_week_number,
        to_char(cast(date_day as date), 'Day') AS day_name,
        to_char(cast(date_day as date), 'Month') AS month_name,
        date_trunc('week', cast(date_day as date)) AS week_start_date,
        date_trunc('month', cast(date_day as date)) AS month_start_date,
        date_trunc('quarter', cast(date_day as date)) AS quarter_start_date,
        date_trunc('year', cast(date_day as date)) AS year_start_date
    FROM date_spine

)

SELECT *
FROM final
