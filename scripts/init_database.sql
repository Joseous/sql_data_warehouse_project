------------ SQL PROJECT ----------------

------------ DATA WAREHOUSE PROJECT ---------------

------- Create Database 'DataWarehouse' and Schemas--------------

/*
Script Purose:
	The script creates database 'DataWarehouse' after checking if it exist, and already exists, it is dropped and receated
	The scrpit also sets up three schemas in DataWarehouse database
	'bronze', 'silver', 'gold'.

WARNING
	Drop and recreate the 'DataWarehouse' database if it exist
	All data in the database will be permantely deleted. Proceed with caution
	and ensure you have proper backups before running this script
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE DataWarehouse;
END;

CREATE DATABASE DataWarehouse;

USE DataWareHouse;

-- Create Schemas

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
