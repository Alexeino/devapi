# A Django App

## For Local

-   Clone the repo
-   Run a Postgres container with following command 
```
docker run -itd --name local-db -e POSTGRES_DB=<your_db_name> -e POSTGRES_USER=<db_user> -e POSTGRES_PASSWORD=<db_password> -p 5432:5432 postgres
```
-   Go to the directory and install requirements
```
pip install -r requirements.txt
```
-   Create .env file and fill in the details
```
cp params.env .env
```