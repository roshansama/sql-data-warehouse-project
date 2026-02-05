create or alter procedure bronze.load_bronze  as
Begin
	declare @start_time datetime, @end_time datetime
	declare @batch_start_time datetime, @batch_end_time datetime
	set @batch_start_time = GETDATE()
	Begin TRY
		print '=================================================================================='
		print 'Loading Bronze Layer'
		print '=================================================================================='

		print '=================================================================================='
		print 'Loading CRM Table'
		print '=================================================================================='


		set @start_time = GETDATE()
		print 'Truncating Table: crm_cust_info'
		truncate table bronze.crm_cust_info;
		print 'Inserting data into Table: crm_cust_info'
		bulk insert bronze.crm_cust_info
		from 'D:\DataWarehouse BARAA\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE()
		print '>>Load Duration :' + Cast(DATEDIFF(second,@start_time,@end_time) as NVARCHAR(50)) + 'seconds'
		print '>================================================================================='

		set @start_time = GETDATE()
		print 'Truncating Table: crm_prd_info'
		truncate table bronze.crm_prd_info;
		print 'Inserting data into Table: crm_prd_info'
		bulk insert bronze.crm_prd_info
		from 'D:\DataWarehouse BARAA\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE()
		print '>>Load Duration :' + Cast(DATEDIFF(second,@start_time,@end_time) as NVARCHAR(50)) + 'seconds'
		print '>================================================================================='
		set @start_time = GETDATE()


		print 'Truncating Table: crm_sales_details'
		truncate table bronze.crm_sales_details;
		print 'Inserting data into Table: crm_sales_details'
		bulk insert bronze.crm_sales_details
		from 'D:\DataWarehouse BARAA\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE()
		print '>>Load Duration :' + Cast(DATEDIFF(second,@start_time,@end_time) as NVARCHAR(50)) + 'seconds'
		print '>================================================================================='


		print '=================================================================================='
		print 'Loading ERP Table'
		print '=================================================================================='
		set @start_time = GETDATE()
		print 'Truncating Table: erp_cust_info'
		truncate table bronze.erp_cust_az12;
		print 'Inserting data into Table: erp_cust_az12'
		bulk insert bronze.erp_cust_az12
		from 'D:\DataWarehouse BARAA\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE()
		print '>>Load Duration :' + Cast(DATEDIFF(second,@start_time,@end_time) as NVARCHAR(50)) + 'seconds'
		print '>================================================================================='

		set @start_time = GETDATE()
		print 'Truncating Table: erp_loc_a101'
		truncate table bronze.erp_loc_a101;
		print 'Inserting data into Table: erp_loc_a101'
		bulk insert bronze.erp_loc_a101
		from 'D:\DataWarehouse BARAA\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE()
		print '>>Load Duration :' + Cast(DATEDIFF(second,@start_time,@end_time) as NVARCHAR(50)) + 'seconds'
		print '>================================================================================='

		set @start_time = GETDATE()
		print 'Truncating Table: erp_px_cat_g1v2'
		truncate table bronze.erp_px_cat_g1v2;
		print 'Inserting data into Table: erp_px_cat_g1v2'
		bulk insert bronze.erp_px_cat_g1v2
		from 'D:\DataWarehouse BARAA\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		)
		set @end_time = GETDATE()
		print '>>Load Duration :' + Cast(DATEDIFF(second,@start_time,@end_time) as NVARCHAR(50)) + 'seconds'
		print '>================================================================================='
	set @batch_end_time = GETDATE()
	print 'Total Duration to run Bronze Layer:' + cast(DATEDIFF(second,@batch_start_time,@batch_end_time) as Nvarchar(50))
	END TRY
	Begin Catch
		print '=========================================================================================='
		print 'Error Message' + Error_Message();
		print 'Error Message' + cast (Error_number() as Nvarchar);
		print 'Error Message' + cast (Error_state() as Nvarchar);
		print '=========================================================================================='
	END Catch
End
