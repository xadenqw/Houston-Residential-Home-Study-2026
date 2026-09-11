-- ==========================================
-- 1. CREATE ANALYSIS TABLE
-- ==========================================

DROP TABLE IF EXISTS property_analysis;
CREATE TABLE property_analysis AS
SELECT
    Address,
    "Zip Code",
    REPLACE(Area, '-', '/') AS Area,
    CASE
        WHEN price_group = 1 THEN 'Expensive'
        WHEN price_group = 2 THEN 'Middle'
        WHEN price_group = 3 THEN 'Low'
    END AS "Price Category",
    "Current Price",
    "List Price",
    "Close Price",
    "Baths Total",
    Bedrooms,
    CAST("Building SqFt" AS INTEGER) AS "Building SqFt",
    CAST("Lot Size" AS INTEGER) AS "Lot Size",
    CAST("Year Built" AS INTEGER) AS "Year Built",
    CDOM,
    Subdivision
FROM (
    SELECT
        *,
        NTILE(3) OVER (
            PARTITION BY Area
            ORDER BY "Current Price" DESC
        ) AS price_group
    FROM properties
);

SELECT *
FROM property_analysis;