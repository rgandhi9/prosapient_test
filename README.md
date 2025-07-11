### DAG
<img width="1425" height="336" alt="image" src="https://github.com/user-attachments/assets/a6cff0b9-3f8e-4640-bcf0-c5aeb1303cbc" />

### Notes
- The standardised layer is reserved for ensuring correct datatypes and field names.
- The dim and fact tables are created from these standardised models.  If further transformation is required (e.g. versioning), a staging layer can be added before creating the dim and fct models.
- Mart model are materialised as Tables as these models are likely to be quired directly by end-users / BI tools.

### Testing
- Basic built-in data tests have been added to `models/standardised/schema/std_customers.yml`.  These include `accepted_values`,`not_null` and `unique`.
- dbt_expectations package has been installed with `dbt deps` so other pre-built tests can be used e.g. `expect_column_min_to_be_between`
- Custom test have been created in `macros/is_valid_email.sql` which can be used to test more complex or custom logic.

### Tableau 
- https://public.tableau.com/app/profile/r.g5623/viz/Book1_17521731317210/Dashboard1?publish=yes

### Further Development
- Ensuring all models have `yml` files for testing and casting datatypes as well as naming of tests and appropriate descriptions.
- CI/CD workflows to be added so that commands like `dbt test` will run with GitHub actions when a commit is pushed.
- Unit test to test logical workflows e.g. we can mock a user's data and have that flow though the `standardised` models to the `mart` models to ensure customer segmentation logic is behaving as expected - [https://docs.getdbt.com/docs/build/unit-tests]
- Setup PROD environment with jobs running on required cadence.
- Confirgure Slack notifications for dbt run errors.
