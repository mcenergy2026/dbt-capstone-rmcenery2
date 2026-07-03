WITH date_spine AS (

    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="to_date('2003-01-01')",
        end_date="to_date('2006-01-01')"
    ) }}

),

final AS (

    SELECT
        cast(date_day AS DATE) AS date_day,
        year(cast(date_day AS DATE)) AS year_number,
        quarter(cast(date_day AS DATE)) AS quarter_number,
        month(cast(date_day AS DATE)) AS month_number,
        weekiso(cast(date_day AS DATE)) AS week_number,
        day(cast(date_day AS DATE)) AS day_of_month,
        dayofweekiso(cast(date_day AS DATE)) AS day_of_week_number,
        to_char(cast(date_day AS DATE), 'Day') AS day_name,
        to_char(cast(date_day AS DATE), 'Month') AS month_name,
        date_trunc('week', cast(date_day AS DATE)) AS week_start_date,
        date_trunc('month', cast(date_day AS DATE)) AS month_start_date,
        date_trunc('quarter', cast(date_day AS DATE)) AS quarter_start_date,
        date_trunc('year', cast(date_day AS DATE)) AS year_start_date
    FROM date_spine

)

SELECT *
FROM final
