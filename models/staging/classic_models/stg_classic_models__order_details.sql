with source as (

    select *
    from {{ source('classic_models', 'order_details') }}

),

renamed as (

    select
        order_number,
        product_code,
        quantity_ordered,
        price_each,
        order_line_number,
        _sync_date,
        quantity_ordered * price_each as line_amount
    from source

)

select *
from renamed