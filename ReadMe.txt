#Requirements
    Django>=4.2,<5.0
    djangorestframework>=3.14,<4.0
    psycopg2-binary>=2.9

# Commands
    #postgres WoW!
    psql -U postgres
    #C:\Program Files\PostgreSQL\15\data file pg_hba.conf
    #Django  
    python manage.py runserver

# DevOps
    the .env needs 
        for running local
            DB_HOST = 'localhost'
            DB_PORT = '5432'
        for docker (It was set to this before I got it working again locally. 
        I am not 100% sure this works on docker, 
        but i don't know why else it would have been set to this.)
            DB_HOST = 'db'
            DB_PORT = '5433'