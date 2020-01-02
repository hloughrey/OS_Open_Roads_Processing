# OS OpenRoads Data Processing

[OS Open Roads](https://www.ordnancesurvey.co.uk/business-government/products/open-map-roads) is an Open data set provided by OS. OS Open Roads provides the geometry & spatial location of all roads within the UK. This can facilitate in answer spatial questions such as: How many miles of roads are there in the country? What and where’s within 10 miles of this location?
Unfortunately to make use of this data, you need to be able to convert it into a format you can use, for me, that is within a PostGIS database.

This project automates the creation of a PostGIS enabled Postgres database which is ready for you to populate with the Open Roads data via the `load_road_data` script.

To create you own version of the database you will need to download your own copy of OS Open Roads in the `ESRI Shape` format from [Ordance Survey](https://www.ordnancesurvey.co.uk/opendatadownload/products.html#OPROAD) and save it into the route of this project, then run the following commands:

```
docker build -t <name>:<tag .
docker run --rm -d -p 5432:5432 -v ~/Desktop:/db_data --name <container name> <name>:<tag
```

Once you have the container running you can the `exec` into it and manually run the `load_road_data` script.
This script does the following:

1. Populates the Postgres database with the OS Open Roads data;
2. Create GIST indexes using the geom column to make spatial queries faster;
3. Vacuum Analyses each table to optimise query times;
4. Creates an export of the database in Postgres custom data format `*.dump` file;
5. Places a copy of the `dump` file on a the host machines desktop;

```
docker exec -it road_closures_db_1 bash
./load_road_data
```
