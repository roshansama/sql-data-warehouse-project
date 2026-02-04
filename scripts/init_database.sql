/* 
=========================================================
Create Database and schemas
=========================================================
Script Purpose:
	This script creates a new database called 'DataWarehouse' after checking if it exists or not.
	if exists then it will drop the database and create a new one .

	Additionally this script also creates three schemas Bronze, Silver and Gold.

*/
Use Master;
go

If exists (select 1 from sys.databases where name = 'DataWarehouse' )
BEGIN
Alter Database DataWarehouse set single_user with rollback immediate;
	Drop database DataWarehouse;
	END;
go

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

create schema Bronze;
go
create schema Silver;
go
create schema Gold;
go
