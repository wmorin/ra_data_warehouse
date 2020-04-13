{% if not var("enable_crm_warehouse") and not enable_finance_warehouse and not enable_marketing_warehouse and not enable_projects_warehouse %}
{{
    config(
        enabled=false
    )
}}
{% else %}
{{
    config(
        unique_key='company_pk',
        alias='companies_dim'
    )
}}
{% endif %}

WITH companies_dim as (
  SELECT
    GENERATE_UUID() as company_pk,
    *
  FROM
    {{ ref('sde_companies_ds') }} c
)
select * from companies_dim