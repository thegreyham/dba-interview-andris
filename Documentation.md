My selection of Liquibase as the database migration tool was influenced by prior experience with it in the previous project. What I appreciate about Liquibase is its version-controlled method of tracking alterations, which simplifies management and deployment processes.

I also like Liquibase's compatibility with multiple changelog formats such as XML, YAML, and JSON, which facilitates maintaining these logs in an orderly structure. This not only enhances control over the modifications but also ensures that logs are kept organized and transparent. Liquibase generates database-specific SQL from non-SQL formats (like YAML or XML) and it handles variations in data types and SQL syntax across different databases (e.g., MySQL, PostgreSQL etc.)

To add a column to the `users` table I made a changelog file and placed it in the `migrations` directory.

```yaml
databaseChangeLog:
- changeSet:
      id:  1
      author:  andris.smits
      labels: dba-interview
      context: dba-interview
      comment: add age(int) column to the users table
      changes:
      - addColumn:
          tableName: users
          columns:
          - column:
              name: age
              type: int
```

Then I updated GitHun acttin workflow and added `Run Database Migrations` step. I preferred to run Liquibase docker container separately for each of the schemas in the database. This strategy permits maintaining a changelog without the need to understand how many schemas are in the database. Additionally, it offers enhanced control by allowing individual schema updates to be atomic.

Adding a new step to `.github/workflows/migration.yml` was simple; the main concern was how to correctly determine the MySQL instance service name since the Liquibase container operates in a distinct Docker network. Due to GitHub restrictions, it couldn't join the same network as the database server. To bypass this, I utilized the `172.17.0.1` address, which corresponds to the Docker host's `localhost`.