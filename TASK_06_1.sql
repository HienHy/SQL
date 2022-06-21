create database Lap01



use AdventureWorks2019
select * into Lap01.dbo.WorkOrder from Production.WorkOrder

use Lap01
select* into WorkOrderIX from WorkOrder

select * from WorkOrder
select* from WorkOrderIX

CREATE INDEX IX_WorkOrderID ON WorkOrderIX(WorkOrderID)


SELECT*FROM WorkOrder where WorkOrderID=72000
SELECT*FROM WorkOrderIX where WorkOrderID=72000