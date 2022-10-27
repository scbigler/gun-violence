# gun-violence

* Prepare data to be loaded and read -
1. create a Postgres database called gun_violence.
2. Run the two CREATE TABLE sql statements in the make_tables.sql file to create the two tables (subest2021 and gunviolencedata)
3. Use the Import wizard in Postgres to populate the two tables. sub-est2021_allUTF-8.csv --> subest2021 table, gun-violence-data_01-2013_03-2018-1.csv --> gunviolencedata table. NOTE: gun-violence-data_01-2013_03-2018-1.csv is NOT in the repository because the file is too large, even when compressed. I will send a link to it in Slack.
4. Run the SQL statements (seperately) in the data_cleaning_queries.sql file. Let me know if you have any problems.
The data should now be ready to read using the gun-violence.ipynb notebook.



* About the data

The gun-violence-data_01-2013_03-2018-1.csv file contains almost 240,000 rows of data, each row representing a reported incident of a firearm being used.  The date range of the data is 1-1-2013 to 3-31-2018.  Many of these firearms incidents have resulted in an injury or death of one or more people. It is these records (resulting in at least one or more injury or death) that has been the focus of analysis so far.  

The incidents have been grouped by city, state, and the population of each city has been added so citywide incidents can be expressed in per capita terms.  Thus far I have filtered for cities about 25,000 in population and the per_capita value is expressed in incidents per 100,000.  We can easily modify the filtering in gun-violence.ipynb.


One map has been completed that places markers on cities that have incidents and qualified based on the filtering (25,000 population.)  The map focuses first on Orange County but if you zoom and scroll you will see that the markers go nationwide.  Clicking or tappinig on the marker will reveal the following (so far): gun incidents per capita, total number of incidents in the time period, and the population of the city. 

The gun incidents per capita is not a measure of crime.  It is a measure of a gun being used that resulted in bodily injury or death, which may or may not have occured during a crime. 

One intersting thing of note so far in the data - the two states with the strictest gun laws, Californa and New York, don't have any cities in the top 30 most gun incidents cities.  The first entry for NY is at 48 (Rochester) and the highest for California is 73 (Oakland).  A map showing the ranking of states instead of cities would be a good possible next map.

* Overview of the data flow

As already mentioned, the raw data is imported into a Postgres database to be read in the gun-violence.ipynb.  The database is quried in python with WHERE clauses that filter the data at the datbase level so only the filtered rows return to be put in a dataframe.  This more efficient that importing everything into the notebook.  The data is manipulated in Pandas and eventually exported as a csv (us_per_capita.csv).  This csv is converted to GeoJSON data format on a website that does this conversion, and the coverted data is downloaded as us_per_capita.geojson.  This file is referenced and read in the logic.js file for making the map.  There is a way to convert the dataframe in the notebook directly into a geojson file using a function made by an individual and is available for use but I have not done that yet.  Once we incorporate that, it will eliminate the need to use the website for the conversion.



