SELECT *
FROM Nashville_housing.dbo.Housing_Data

--Cleaining date fields

Select SaleDate, CONVERT(Date,SaleDate)
From Housing_Data

ALTER TABLE Housing_Data
Add SaleDateConverted Date;

Update Housing_Data
SET SaleDateConverted = CONVERT(Date,SaleDate)

-- Populate address data

SELECT *
FROM Housing_Data
--WHERE PropertyAddress is Null
ORDER BY ParcelID

SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM Housing_Data a
JOIN Housing_Data b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID] <> b.[UniqueID]
WHERE a.PropertyAddress IS NULL

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM Housing_Data a
JOIN Housing_Data b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress IS NULL

-- Separating Address data

SELECT PropertyAddress
FROM Housing_Data
--WHERE PropertyAddress is Null
--ORDER BY ParcelID

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) AS Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress)) AS Address

FROM Housing_Data

ALTER TABLE Housing_Data
Add PropertySplitAddress NVARCHAR(255);

Update Housing_Data
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1)

ALTER TABLE Housing_Data
Add PropertySplitCity NVARCHAR(255);

Update Housing_Data
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress))

SELECT *
From Housing_Data

SELECT OwnerAddress
From Housing_Data

SELECT
PARSENAME(REPLACE(OwnerAddress, ',', '.') ,3)
, PARSENAME(REPLACE(OwnerAddress, ',', '.') ,2)
, PARSENAME(REPLACE(OwnerAddress, ',', '.') ,1)
FROM Housing_Data


ALTER TABLE Housing_Data
Add OwnerSplitAddress NVARCHAR(255);

ALTER TABLE Housing_Data
Add OwnerSplitAddress NVARCHAR(255);

Update Housing_Data
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.') ,3)

ALTER TABLE Housing_Data
Add OwnerSplitCity NVARCHAR(255);

Update Housing_Data
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') ,2)

ALTER TABLE Housing_Data
Add OwnerSplitState NVARCHAR(255);

Update Housing_Data
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.') ,1)

SELECT *
From Housing_Data

-- Changing SoldAsVacant

SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
FROM Housing_Data
GROUP BY SoldAsVacant
Order by 2

SELECT SoldAsVacant
, CASE When SoldAsVacant = 'Y' THEN 'Yes'
	WHEN SoldAsVacant = 'N' THEN 'No'
	ELSE SoldAsVacant
	END
FROM Housing_Data

UPDATE Housing_Data
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
	WHEN SoldAsVacant = 'N' THEN 'No'
	ELSE SoldAsVacant
	END

SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
FROM Housing_Data
GROUP BY SoldAsVacant
Order by 2

-- Check Duplicates
WITH RownumCTE AS(
SELECT *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				PropertyAddress, 
				SalePrice, 
				SaleDate,
				LegalReference
				ORDER BY
					UniqueID
					) Row_num
FROM Housing_Data
)
SELECT *
FROM RownumCTE
WHERE Row_num > 1
ORDER BY PropertyAddress

-- Remove unused columns

SELECT *
FROM Housing_Data

ALTER Table Housing_Data
DROP Column OwnerAddress, TaxDistrict, PropertyAddress

ALTER Table Housing_Data
DROP COLUMN SaleDate