# devops-dba-interview

# Instructions for the Candidate

1. Clone the repository.
```sh
git clone git@github.com:thegreyham/dba-interview-andris.git
cd dba-interview-andris
```

2. Setup and Run the MySQL Container (Locally):

```sh
docker build -t test-mysql .
docker run -d --name test-mysql -p 3306:3306 test-mysql
```

3. Choose and Setup a Migration Tool:

Use a tool you are comfortable with (Flyway, Liquibase, etc.).

4. Implement CI/CD Pipeline:

Update the `.github/workflows/migration.yml` file with the necessary steps to automate the database migration process.

5. Perform the Migration:

Add an age column to each of the schemas in the database.
```sql
ALTER TABLE users ADD COLUMN age INT;
```

6. Document the Migration:

Provide a brief documentation explaining the migration process, including any challenges encountered and how they were overcome.



# Expected Deliverables

## Migration Script:
A migration script that performs a schema change across all schemas.

## CI/CD Pipeline Configuration:
The configuration for a CI/CD pipeline that automates the database migration process.

## Documentation:
A brief documentation explaining their choice of migration tool, steps to run the setup, and how the CI/CD pipeline works.



# Notes
The `.github/workflows/migration.yml` file already includes the necessary steps to build and run the MySQL container and output the current schemas. The container is named `mysql-db` and is exposed on port 3306 within the Github Actions environment.