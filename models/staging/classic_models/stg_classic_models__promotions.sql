with source as (

    select *
    from {{ source('classic_models', 'promotions') }}

),

renamed as (

    select
        promotion_id,
        promotion_name,
        product_line,
        discount_pct,
        start_date,
        end_date,
        description,
        _sync_date
    from source

)

select *
from renamed