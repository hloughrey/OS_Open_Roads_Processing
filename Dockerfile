FROM postgres:12.1

ENV POSTGRES_USER admin
ENV POSTGRES_PASSWORD 'password123'
ENV POSTGRES_DB roads

RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip postgis postgresql-12-postgis-3 \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d /db_data
COPY initdb.sql /docker-entrypoint-initdb.d
COPY create_postgis.sql /docker-entrypoint-initdb.d

COPY oproad_essh_gb.zip load_road_data.sh create_gist_indexes.sql ./
RUN unzip oproad_essh_gb.zip -d road_data || true

EXPOSE 5432
CMD ["postgres"]


