SELECT id,time, latitude, longitude,

CASE
WHEN latitude BETWEEN 35 AND 72
AND longitude BETWEEN -25 AND 60
THEN 'Europe'

WHEN latitude BETWEEN -40 AND 38
AND longitude BETWEEN -30 AND 60
THEN 'Afrique'

WHEN latitude BETWEEN -10 AND 80
AND longitude BETWEEN 60 AND 180
THEN 'Asie'

WHEN latitude BETWEEN -50 AND 0
AND longitude BETWEEN 110 AND 180
THEN 'Océanie'

WHEN latitude BETWEEN 5 AND 85
AND longitude BETWEEN -170 AND -30
THEN 'Amérique du Nord'

WHEN latitude BETWEEN -60 AND 5
AND longitude BETWEEN -100 AND -30
THEN 'Amérique du Sud'

WHEN latitude < -60 THEN 'Antarctique'

ELSE 'Océan'
END AS continent,

TRIM(SPLIT(place,",")[OFFSET(ARRAY_LENGTH(SPLIT(place,","))-1)])AS pays, depth, mag, magType, 
rms as amplitude_residuals, net as seismic_network,updated, place as  human_location, type horizontalError, depthError, magError, 
magNst as mag_nb_station , status as review_status, locationSource, magSource
FROM {{ref("stg_safetravel__earthquake")}}
WHERE time BETWEEN TIMESTAMP("2000-01-01")AND TIMESTAMP("2024-12-31 23:59:59")