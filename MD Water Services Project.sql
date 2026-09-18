SHOW TABLES;

SELECT *
FROM location
LIMIT 5;

SELECT *
FROM visits
LIMIT 5;

SELECT DISTINCT type_of_water_source
FROM water_source;

SELECT *
FROM visits
WHERE time_in_queue > 500
LIMIT 5;

SELECT *
FROM water_source
WHERE source_id IN(
'AkKi00881224',
    'AkLu01628224',
    'AkRu05234224',
    'HaRu19601224',
    'HaZa21742224',
    'SoRu36096224',
    'SoRu37635224',
    'SoRu38776224')
    LIMIT 5;

SELECT *
FROM water_quality
WHERE subjective_quality_score = 10 AND visit_count = 2
LIMIT 5;

SELECT *
FROM well_pollution
LIMIT 10;

SELECT *
FROM well_pollution
WHERE description LIKE 'Clean_%';

SELECT *
FROM well_pollution
WHERE results = 'Clean' AND biological > 0.01;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE well_pollution_copy AS
SELECT *
FROM well_pollution;

UPDATE well_pollution_copy
SET description = 'Bacteria: E. coli'
WHERE description = 'Clean Bacteria: E. coli';

UPDATE well_pollution_copy
SET description = 'Bacteria: Giardia Lamblia'
WHERE description = 'Clean Bacteria: Giardia Lamblia';

UPDATE well_pollution_copy
SET results = 'Contaminated: Biological'
WHERE biological > 0.01
  AND results = 'Clean';
  
SELECT *
FROM well_pollution_copy
WHERE results = 'Clean' AND biological > 0.01 OR description LIKE "Clean_%";

SET SQL_SAFE_UPDATES = 0;

UPDATE well_pollution
SET description = 'Bacteria: E. coli'
WHERE description = 'Clean Bacteria: E. coli';

UPDATE well_pollution
SET description = 'Bacteria: Giardia Lamblia'
WHERE description = 'Clean Bacteria: Giardia Lamblia';

UPDATE well_pollution
SET results = 'Contaminated: Biological'
WHERE biological > 0.01
  AND results = 'Clean';
  
  SELECT *
FROM well_pollution
WHERE results = 'Clean' AND biological > 0.01 OR description LIKE "Clean_%";

SET SQL_SAFE_UPDATES = 1;

DROP TABLE well_pollution_copy;

