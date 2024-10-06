SELECT * FROM Training.dbo.Banglore_traffic_Dataset

--1.average congestion level for each area to identify the most congested areas.

SELECT 
    TOP 8 "Area_Name", 
    AVG("Congestion_Level") AS avg_congestion_level
FROM 
    Banglore_traffic_Dataset
GROUP BY 
    "Area_Name"
ORDER BY 
    avg_congestion_level DESC;


--2.Find areas with high congestion levels

SELECT 
    "Area_Name", 
    AVG("Congestion_Level") AS avg_congestion_level
FROM 
    Banglore_traffic_Dataset
GROUP BY 
    "Area_Name"
HAVING 
    AVG("Congestion_Level") > 75
ORDER BY 
    avg_congestion_level DESC;


--3.How different weather conditions impact traffic volume.

SELECT 
    TOP 5 "Weather_Conditions", 
    AVG("Traffic_Signal_Compliance") AS avg_traffic_volume
FROM 
    Banglore_traffic_Dataset
GROUP BY 
    "Weather_Conditions"
ORDER BY 
    avg_traffic_volume DESC;


--4.How roadwork and construction activities affect traffic volume.

SELECT 
    "Roadwork_and_Construction_Activity", 
    AVG("Traffic_Signal_Compliance") AS avg_traffic_volume
FROM 
    Banglore_traffic_Dataset
GROUP BY 
    "Roadwork_and_Construction_Activity"
ORDER BY 
    avg_traffic_volume DESC;


--5.Public transport usage in areas with high congestion levels to understand how public transportation is utilized in congested areas.

SELECT 
    "Area_Name", 
    AVG("Public_Transport_Usage") AS avg_public_transport_usage, 
    AVG("Congestion_Level") AS avg_congestion_level
FROM 
    Banglore_traffic_Dataset
GROUP BY 
    "Area_Name"
HAVING 
    AVG("Congestion_Level") > 75
ORDER BY 
    avg_public_transport_usage DESC;


--6.Areas with the most incident reports, which could indicate high-risk areas.

SELECT 
    TOP 8 "Area_Name", 
    COUNT("Incident_Reports") AS total_incident_reports
FROM 
    Banglore_traffic_Dataset
GROUP BY 
    "Area_Name"
ORDER BY 
    total_incident_reports DESC;





