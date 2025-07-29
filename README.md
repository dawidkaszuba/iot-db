1. Create database and users:
    ```
     export ADMIN_PASSWORD="<password>"
     export APP_PASSWORD="<password2>"
    ./create_users.sh

    ```
3. Create `liquiase.properties` file under src/main/resources and fill relevant values:

    ```driver= org.postgresql.Driver
    url=jdbc:postgresql://<host>:5432/iot
    username=iot_admin
    password=<password>
    changeLogFile=db/changelog-master.xml
    ```

4. Update database using liquibase:

    ```
    liquibase:update
    ```
   Note: User in mvn-liquibase command is not the same user as my_budget_user.
         You should have user for maintain database different from my_budget_user.