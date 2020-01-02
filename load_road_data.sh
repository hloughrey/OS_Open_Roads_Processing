#!/bin/bash

load_road_data () {
    roadnodeCreated=false;
    roadlinkCreated=false;
    motorwayJunctionCreated=false;

    for i in $(find road_data/data -type f -name '*.shp'); do
        echo "Processing $i"
        fileName=${i:18}
        fileNameWithoutExtension=${fileName%.*}
        tableName=${fileNameWithoutExtension,,}
        if [ $tableName == "roadnode" ]; then createDatabaseTable $roadnodeCreated $tableName; fi;
        if [ $tableName == "roadlink" ]; then createDatabaseTable $roadlinkCreated $tableName; fi;
        if [ $tableName == "motorwayjunction" ]; then createDatabaseTable $motorwayJunctionCreated $tableName; fi;

        shp2pgsql -s 27700 -a $i roads.$tableName | psql -h localhost -d roads -U admin -e;
    done;

    createGeomIndexes
    createDBDump
}

createDatabaseTable() {
    if "$1" = true
    then
        :
    else
        shp2pgsql -s 27700 -p $i roads.$2 | psql -h localhost -d roads -U admin;
        $1=true;
    fi;
}

createGeomIndexes() {
    psql -h localhost -d roads -U admin -f create_gist_indexes.sql
}

createDBDump() {
    pg_dump -h localhost -U admin -Fc -v -O roads > ./db_data/os_open_roads.dump
}

load_road_data