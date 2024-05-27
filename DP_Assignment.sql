---Executed in pgAdmin4

--Creating superuser to have all privileges and permissions within the database
CREATE ROLE postgres SUPERUSER LOGIN PASSWORD 'xxxxxxxx';

---Creating database
CREATE DATABASE jyoti_dp
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-----Loading Port coordinate data to updated_pub table
drop table updated_pud;
CREATE TABLE updated_pud
(OID_ text,
World_Port_Index_Number text,
Region_Name text,
Main_Port_Name text,
Alternate_Port_Name text,
UN_LOCODE text,
Country_Code text,
World_Water_Body text,
IHO_S130_Sea_Area text,
Sailing_Direction_or_Publication text,
Publication_Link text,
Standard_Nautical_Chart text,
IHO_S57_Electronic_Navigational_Chart text,
IHO_S101_Electronic_Navigational_Chart text,
Digital_Nautical_Chart text,
Tidal_Range float,
Entrance_Width float,
Channel_Depth float,
Anchorage_Depth float,
Cargo_Pier_Depth float,
Oil_Terminal_Depth float,
Liquified_Natural_Gas_Terminal_Depth float,
Maximum_Vessel_Length float,
Maximum_Vessel_Beam float,
Maximum_Vessel_Draft float,
Offshore_Maximum_Vessel_Length float,
Offshore_Maximum_Vessel_Beam float,
Offshore_Maximum_Vessel_Draft float,
Harbor_Size text,
Harbor_Type text,
Harbor_Use text,
Shelter_Afforded text,
Entrance_Restriction__Tide text,
Entrance_Restriction__Heavy_Swell text,
Entrance_Restriction__Ice text,
Entrance_Restriction__Other text,
Overhead_Limits text,
Underkeel_Clearance_Management_System text,
Good_Holding_Ground text,
Turning_Area text,
Port_Security text,
Estimated_Time_of_Arrival_Message text,
Quarantine__Pratique text,
Quarantine__Sanitation text,
Quarantine__Other text,
Traffic_Separation_Scheme text,
Vessel_Traffic_Service text,
First_Port_of_Entry text,
US_Representative text,
Pilotage__Compulsory text,
Pilotage__Available text,
Pilotage__Local_Assistance text,
Pilotage__Advisable text,
Tugs__Salvage text,
Tugs__Assistance text,
Communications__Telephone text,
Communications__Telefax text,
Communications__Radio text,
Communications__Radiotelephone text,
Communications__Airport text,
Communications__Rail text,
Search_and_Rescue text,
NAVAREA text,
Facilities__Wharves text,
Facilities__Anchorage text,
Facilities__Dangerous_Cargo_Anchorage text,
Facilities__Med_Mooring text,
Facilities__Beach_Mooring text,
Facilities__Ice_Mooring text,
Facilities__RoRo text,
Facilities__Solid_Bulk text,
Facilities__Liquid_Bulk text,
Facilities__Container text,
Facilities__Breakbulk text,
Facilities__Oil_Terminal text,
Facilities__LNG_Terminal text,
Facilities__Other text,
Medical_Facilities text,
Garbage_Disposal text,
Chemical_Holding_Tank_Disposal text,
Degaussing text,
Dirty_Ballast_Disposal text,
Cranes__Fixed text,
Cranes__Mobile text,
Cranes__Floating text,
Cranes_Container text,
Lifts__100_Tons text,
Lifts__50100_Tons text,
Lifts__2549_Tons text,
Lifts__024_Tons text,
Services__Longshoremen text,
Services__Electricity text,
Services_Steam text,
Services__Navigation_Equipment text,
Services__Electrical_Repair text,
Services__Ice_Breaking text,
Services_Diving text,
Supplies__Provisions text,
Supplies__Potable_Water text,
Supplies__Fuel_Oil text,
Supplies__Diesel_Oil text,
Supplies__Aviation_Fuel text,
Supplies__Deck text,
Supplies__Engine text,
Repairs text,
Dry_Dock text,
Railway text,
Latitude float,
Longitude float );
COPY updated_pud
 FROM 'D:\Jyoti_DP_Assignment\Data\UpdatedPub150.csv' HEADER CSV DELIMITER ',';

----Uploading 1st and 2nd Jan'20 AIS data
drop table ais_1_2_jan_data;
CREATE TABLE ais_1_2_jan_data
(mmsi text,
basedatetime timestamp,
lat float,
lon float,
sog Float,
cog Float,
heading Float,
vesselname text,
imo text,
callsign text,
vesseltype integer,
status integer,
length float,
width float,
draft float,
cargo text,
transceiverclass text
);
COPY ais_1_2_jan_data
 FROM 'D:\Jyoti_DP_Assignment\Data\Temp\AIS_2020_01_01.csv' HEADER CSV DELIMITER ',';

COPY ais_1_2_jan_data
 FROM 'D:\Jyoti_DP_Assignment\Data\Temp\AIS_2020_01_02.csv' HEADER CSV DELIMITER ',';

------Understanding the number of different statistics at each day---- 
select date(basedatetime) as dt,count(distinct mmsi) as distict_mmsi,count(mmsi) as tot_mmis
,count(case when lower(vesselname) like '%cargo%' then mmsi end) as cargo_in_name
,count(case when vesselname is not null  then mmsi end) as cargo_notnull
,count(case when vesseltype in (70,71,71,73,74,75,76,77,78,79,1003,1004)  then mmsi end) as cargo_type from ais_1_2_jan_data 
	group by dt limit 10;

"2020-01-01"	14044	7,040,389	1219	6,443,516	408,934
"2020-01-02"	14490	6,981,827	1166	6,388,507	398,911

-----Keeping only cargo vessels records 	
drop table cargo_vessels_ais;
create table cargo_vessels_ais as 
	select * from ais_1_2_jan_data where vesseltype in (70,71,71,73,74,75,76,77,78,79,1003,1004);

--Creating another user , which can access the creating tables with my DB
-- Step 1: Create the User
CREATE ROLE my_user LOGIN PASSWORD 'xxxxxxxxx';

-- Grant SELECT permission on all tables in all schemas to the user role
GRANT SELECT ON ALL TABLES IN SCHEMA public TO my_user;
