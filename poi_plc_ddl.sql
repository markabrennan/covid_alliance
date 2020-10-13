CREATE OR REPLACE SEQUENCE POI_PLC_SEQ;

CREATE OR REPLACE TABLE COVID_ALLIANCE_POI_PLC (
    ID	NUMBER DEFAULT  POI_PLC_SEQ.NEXTVAL NOT NULL UNIQUE, 
        POI_ADDR_CITY                   VARCHAR,
        POI_GEOHASH_SHORT               VARCHAR NOT NULL,        
        POI_GEOHASH                     VARCHAR NOT NULL,        
        POI_LATITUDE                    NUMBER(38,7) NOT NULL,
        POI_LONGITUDE                   NUMBER(38,7) NOT NULL,        
        POI_ID                          NUMBER,
        POI_NAME                        VARCHAR,
        POI_ALT_NAME                    VARCHAR,
        POI_CATEGORY                    VARCHAR,
        POI_SUB_CATEGORY                VARCHAR,
        POI_ADDR_STREET                 VARCHAR,
        POI_ADDR_POSTCODE               VARCHAR,
        POI_ADDR_COUNTY                 VARCHAR,
        POI_ADDR_REGION                 VARCHAR,
        POI_ADDR_COUNTRY                VARCHAR,
        POI_OSM_ID                      NUMBER(38,0),
        POI_SAFEGRAPH_ID                VARCHAR,
        POI_DATA_SOURCE                 VARCHAR,                
        PLC_ADVERTISER_ID               VARCHAR,
        PLC_CLUSTER_STARTED_UTC         TIMESTAMP_NTZ(9),
        PLC_CLUSTER_ENDED_UTC           TIMESTAMP_NTZ(9),
        PLC_LATITUDE                    FLOAT,
        PLC_LONGITUDE                   FLOAT,
        PLC_GEOHASH                     VARCHAR NOT NULL,
        PLC_GEOHASH_SHORT               VARCHAR NOT NULL,
        PLC_LON_VARIANCE                FLOAT,
        PLC_LAT_VARIANCE                FLOAT,
        PLC_SPATIAL_COVARIANCE          FLOAT,
        PLC_DWELL_TIME_MINUTES          NUMBER(18,0),
        PLC_PING_COUNT                  NUMBER(18,0),
        PLC_TIME_ZONE                   VARCHAR,
        PLC_CLUSTER_STARTED_LOCAL       TIMESTAMP_NTZ(9),
        PLC_CLUSTER_STARTED_HOUR_LOCAL, NUMBER(2,0),
        PLC_CLUSTER_STARTED_WEEKDAY_LOCAL,  NUMBER(2,0),
        PLC_CLUSTER_ENDED_LOCAL         TIMESTAMP_NTZ(9),
        PLC_CLUSTER_ENDED_HOUR_LOCAL    NUMBER(2,0),
        PLC_CLUSTER_ENDED_WEEKDAY_LOCAL NUMBER(2,0),
        PLC_IS_POTENTIALLY_CUT_OFF      BOOLEAN,
        PLC_IS_FIRST_INCREMENTAL_CLUSTER    BOOLEAN,
        PLC_IS_NIGHT_CLUSTER            BOOLEAN,
        PLC_IS_PRIMARY_SLEEP_CLUSTER    BOOLEAN
)        

insert into "SCRATCH"."ANALYTICS_DEV_SCRATCH"."COVID_ALLIANCE_POI_PLC" (
        ID,
        POI_ADDR_CITY,
        POI_GEOHASH_SHORT,
        POI_GEOHASH,
        POI_LATITUDE,
        POI_LONGITUDE,
        POI_ID,
        POI_NAME,
        POI_ALT_NAME,
        POI_CATEGORY,
        POI_SUB_CATEGORY,
        POI_ADDR_STREET,
        POI_ADDR_POSTCODE,
        POI_ADDR_COUNTY,
        POI_ADDR_REGION,
        POI_ADDR_COUNTRY,
        POI_OSM_ID,
        POI_SAFEGRAPH_ID,
        POI_DATA_SOURCE,
        PLC_ADVERTISER_ID,
        PLC_CLUSTER_STARTED_UTC,
        PLC_CLUSTER_ENDED_UTC,
        PLC_LATITUDE,
        PLC_LONGITUDE,
        PLC_GEOHASH,
        PLC_GEOHASH_SHORT,
        PLC_LON_VARIANCE,
        PLC_LAT_VARIANCE,
        PLC_SPATIAL_COVARIANCE,
        PLC_DWELL_TIME_MINUTES,
        PLC_PING_COUNT,
        PLC_TIME_ZONE,
        PLC_CLUSTER_STARTED_LOCAL,
        PLC_CLUSTER_STARTED_HOUR_LOCAL,
        PLC_CLUSTER_STARTED_WEEKDAY_LOCAL,
        PLC_CLUSTER_ENDED_LOCAL,
        PLC_CLUSTER_ENDED_HOUR_LOCAL,
        PLC_CLUSTER_ENDED_WEEKDAY_LOCAL,
        PLC_IS_POTENTIALLY_CUT_OFF,
        PLC_IS_FIRST_INCREMENTAL_CLUSTER,
        PLC_IS_NIGHT_CLUSTER,
        PLC_IS_PRIMARY_SLEEP_CLUSTER)
select 
        POI.ADDR_CITY as POI_ADDR_CITY,
        POI.GEOHASH_SHORT as POI_GEOHASH_SHORT,        
        POI.GEOHASH as POI_GEOHASH,        
        POI.LATITUDE as POI_LATITUDE,
        POI.LONGITUDE as POI_LONGITUDE,        
        POI.ID as POI_ID,
        POI.NAME as POI_NAME,
        POI.ALT_NAME as POI_ALT_NAME,
        POI.CATEGORY as POI_CATEGORY,
        POI.SUB_CATEGORY as POI_SUB_CATEGORY,
        POI.ADDR_STREET as POI_ADDR_STREET,
        POI.ADDR_POSTCODE as POI_ADDR_POSTCODE,
        POI.ADDR_COUNTY as POI_ADDR_COUNTY,
        POI.ADDR_REGION as POI_ADDR_REGION,
        POI.ADDR_COUNTRY as POI_ADDR_COUNTRY,
        POI.OSM_ID as POI_OSM_ID,
        POI.SAFEGRAPH_ID as POI_SAFEGRAPH_ID,
        POI.DATA_SOURCE as POI_DATA_SOURCE,                
        PLC.ADVERTISER_ID as PLC_ADVERTISER_ID,
        PLC.CLUSTER_STARTED_UTC as PLC_CLUSTER_STARTED_UTC,
        PLC.CLUSTER_ENDED_UTC as PLC_CLUSTER_ENDED_UTC,
        PLC.LATITUDE as PLC_LATITUDE,
        PLC.LONGITUDE as PLC_LONGITUDE,
        st_geohash(ST_MAKEPOINT(plc.longitude, plc.latitude)) as PLC_GEOHASH,
        SUBSTR(st_geohash(ST_MAKEPOINT(plc.longitude, plc.latitude)), 0, 8) as PLC_GEOHASH_SHORT,
        PLC.LON_VARIANCE as PLC_LON_VARIANCE,
        PLC.LAT_VARIANCE as PLC_LAT_VARIANCE,
        PLC.SPATIAL_COVARIANCE as PLC_SPATIAL_COVARIANCE,
        PLC.DWELL_TIME_MINUTES as PLC_DWELL_TIME_MINUTES,
        PLC.PING_COUNT as PLC_PING_COUNT,
        PLC.TIME_ZONE as PLC_TIME_ZONE,
        PLC.CLUSTER_STARTED_LOCAL as PLC_CLUSTER_STARTED_LOCAL,
        PLC.CLUSTER_STARTED_HOUR_LOCAL as PLC_CLUSTER_STARTED_HOUR_LOCAL,
        PLC.CLUSTER_STARTED_WEEKDAY_LOCAL as PLC_CLUSTER_STARTED_WEEKDAY_LOCAL,
        PLC.CLUSTER_ENDED_LOCAL as PLC_CLUSTER_ENDED_LOCAL,
        PLC.CLUSTER_ENDED_HOUR_LOCAL as PLC_CLUSTER_ENDED_HOUR_LOCAL,
        PLC.CLUSTER_ENDED_WEEKDAY_LOCAL as PLC_CLUSTER_ENDED_WEEKDAY_LOCAL,
        PLC.IS_POTENTIALLY_CUT_OFF as PLC_IS_POTENTIALLY_CUT_OFF,
        PLC.IS_FIRST_INCREMENTAL_CLUSTER as PLC_IS_FIRST_INCREMENTAL_CLUSTER,
        PLC.IS_NIGHT_CLUSTER as PLC_IS_NIGHT_CLUSTER,
        PLC.IS_PRIMARY_SLEEP_CLUSTER as PLC_IS_PRIMARY_SLEEP_CLUSTER
from (
        select 
                ADVERTISER_ID,
                CLUSTER_STARTED_UTC, 
                CLUSTER_ENDED_UTC, 
                LATITUDE, 
                LONGITUDE,
                LON_VARIANCE, 
                LAT_VARIANCE,
                SPATIAL_COVARIANCE, 
                DWELL_TIME_MINUTES,
                PING_COUNT, 
                TIME_ZONE,
                CLUSTER_STARTED_LOCAL,
                CLUSTER_STARTED_HOUR_LOCAL,
                CLUSTER_STARTED_WEEKDAY_LOCAL,
                CLUSTER_ENDED_LOCAL,
                CLUSTER_ENDED_HOUR_LOCAL,
                CLUSTER_ENDED_WEEKDAY_LOCAL, 
                IS_POTENTIALLY_CUT_OFF,
                IS_FIRST_INCREMENTAL_CLUSTER,
                IS_NIGHT_CLUSTER,
                IS_PRIMARY_SLEEP_CLUSTER
        from "ANALYTICS"."DEV"."LONGITUDINAL_PERSONAL_CLUSTERS"  limit 10000000
     ) as PLC
    inner join "SCRATCH"."ANALYTICS_DEV_SCRATCH"."COVID_ALLIANCE_POI" as POI
    on substr(st_geohash(ST_MAKEPOINT(PLC.longitude, PLC.latitude)), 0, 8) = POI.GEOHASH_SHORT
group by 
        POI_ADDR_CITY,
        POI_GEOHASH,
        POI_GEOHASH_SHORT,
        POI_LATITUDE,
        POI_LONGITUDE,
        POI_ID,
        POI_NAME,
        POI_ALT_NAME,
        POI_CATEGORY,
        POI_SUB_CATEGORY,
        POI_ADDR_STREET,
        POI_ADDR_POSTCODE,
        POI_ADDR_COUNTY,
        POI_ADDR_REGION,
        POI_ADDR_COUNTRY,
        POI_OSM_ID,
        POI_SAFEGRAPH_ID,
        POI_DATA_SOURCE,        
        PLC_CLUSTER_STARTED_UTC,
        PLC_CLUSTER_ENDED_UTC,
        PLC_LATITUDE,
        PLC_LONGITUDE,
        PLC_GEOHASH,
        PLC_GEOHASH_SHORT,
        PLC_ADVERTISER_ID,
        PLC_LON_VARIANCE,
        PLC_LAT_VARIANCE,
        PLC_SPATIAL_COVARIANCE,
        PLC_DWELL_TIME_MINUTES,
        PLC_PING_COUNT,
        PLC_TIME_ZONE,
        PLC_CLUSTER_STARTED_LOCAL,
        PLC_CLUSTER_STARTED_HOUR_LOCAL,
        PLC_CLUSTER_STARTED_WEEKDAY_LOCAL,
        PLC_CLUSTER_ENDED_LOCAL,
        PLC_CLUSTER_ENDED_HOUR_LOCAL,
        PLC_CLUSTER_ENDED_WEEKDAY_LOCAL,
        PLC_IS_POTENTIALLY_CUT_OFF,
        PLC_IS_FIRST_INCREMENTAL_CLUSTER,
        PLC_IS_NIGHT_CLUSTER,
        PLC_IS_PRIMARY_SLEEP_CLUSTER
order by POI_ADDR_CITY,
            POI_GEOHASH_SHORT