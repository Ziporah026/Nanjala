WITH RankedProducts AS (
    SELECT 
        ProductID,
        ProductName,
        Category,
        Price,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS rn
    FROM 
        Products
)
SELECT 
    ProductID,
    ProductName,
    Category,
    Price
FROM 
    RankedProducts
WHERE 
    rn <= 3;
