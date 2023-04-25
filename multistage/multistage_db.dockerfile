FROM postgres
COPY words.sql /docker-entrypoint-initdb.d/words.sql

ENV POSTGRES_HOST_AUTH_METHOD=trust

#No aplica el multietapa porque no se va a compilar la BD.

