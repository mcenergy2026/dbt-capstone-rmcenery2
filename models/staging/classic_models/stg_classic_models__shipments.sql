with source as (

    select *
    from {{ source('classic_models', 'shipments') }}

),

renamed as (

    select
        shipment_id,
        order_number,
        warehouse_code,
        carrier,
        tracking_number,
        ship_date,
        estimated_delivery_date,
        actual_delivery_date,
        shipping_cost,
        _sync_date
    from source

)

select *
from renamed