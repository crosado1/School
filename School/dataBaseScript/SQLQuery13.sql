USE [School]
GO
/****** Object:  StoredProcedure [dbo].[proc_Grade_StudentDetailByPeriod]    Script Date: 06/28/2016 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[proc_Grade_StudentDetailByPeriod]
	@periodId int,
	@gradeId int,
	@firstName varchar(50),
	@lastName varchar(50),
	@genderId int,
	@studentCode varchar(max),
	@pageIndex int,
	@pageCount int,
	@sortBy varchar(100),
	@sortOrder varchar(10)

AS
BEGIN
	
Declare @sqlStatement varchar(max)
Declare @periodConfiguredId int

select @periodConfiguredId =  isnull(p.periodId,0) from period p inner join periodStatus ps
		on p.periodId = ps.periodId
where ps.todate is null
	and ps.periodstatustypeId in (1,2)

Set @periodConfiguredId = isnull(@periodConfiguredId,0)



Set @sqlStatement = 'Select * into #tempStudentSearch from 
						(Select pgs.*,
							pgg.periodGradeId,
							g.gradeId,
							g.gradeDescription,
							s.firstName,
							s.middleName,
							s.lastName,
							gen.*,
							pg.periodId,
							p.YearFrom,
							p.YearTo,
							cast(p.YearFrom as varchar(max)) + '' - '' + cast(p.YearTo as varchar(max)) YearDescription,
							case 
								when ' + cast(@periodConfiguredId as varchar(max)) + '!= 0 And ' + cast(@periodConfiguredId as varchar(max)) + ' != pg.periodId then
									 (select case when count(*) = 0 then
												1
											else
												0
											end from PeriodGradeStudent x inner join Student y
												on x.studentId = y.studentId inner join PeriodGradeGroup z
												on x.periodGradeGroupId = z.periodGradeGroupId inner join PeriodGrade t
												on z.periodGradeId = t.periodGradeId
											where t.periodId = ' + cast(@periodConfiguredId as varchar(max)) + '
												and y.studentId = s.studentId
													and x.todate is null)
								else
									0					
							end IsReadyToNextYear
					from dbo.PeriodGradeStudent pgs inner join dbo.PeriodGradeGroup pgg
								on pgs.periodGradeGroupId = pgg.periodGradeGroupId inner join PeriodGrade pg
								on pgg.periodGradeId = pg.periodGradeid inner join Grade g
								on pg.gradeId = g.gradeId inner join Student s
								on pgs.studentId = s.studentId inner join Gender gen
								on s.genderId = gen.genderId inner join Period p
								on pg.periodId = p.periodId
							where pgs.todate is null) masterTable where 1=1 '


if (LEN(@studentCode)  > 0)
begin
	Set @sqlStatement = @sqlStatement + ' and masterTable.studentId= ' + convert(varchar(max),@studentCode)
end

if (@periodId != 0)
begin
	Set @sqlStatement = @sqlStatement + ' and masterTable.PeriodId= ' + convert(varchar(max),@periodId)
end

if (@gradeId != 0)
begin
	Set @sqlStatement = @sqlStatement + ' and masterTable.GradeId= ' + convert(varchar(max),@gradeId)
end

if (@genderId != 0)
begin
	Set @sqlStatement = @sqlStatement + ' and masterTable.GenderId= ' + convert(varchar(max),@genderId)
end

if (LEN(@firstName)  > 0)
begin
	Set @sqlStatement = @sqlStatement + ' and masterTable.FirstName like ''' + @firstName + '%'''
end

if (LEN(@lastName)  > 0)
begin
	Set @sqlStatement = @sqlStatement + ' and masterTable.LastName like ''' + @lastName + '%'''
end

Set @sqlStatement = @sqlStatement + ' Select * From (Select ROW_NUMBER() OVER (order by '+ @sortBy + ' '+ @sortOrder+') as RowNum,*,(select count(*) from #tempStudentSearch) TotalRecord from #tempStudentSearch) ReturnResult where RowNum between ' + cast(@pageIndex as varchar(max)) + ' AND ' + cast(@pageCount as varchar(max)) + ' if exists (select  * from tempdb.dbo.sysobjects o where o.xtype in (''U'') and o.id = object_id(N''tempdb..#tempStudentSearch''))DROP TABLE #tempStudentSearch'

exec (@sqlStatement)
--print @sqlStatement

--Declare @periodConfiguredId int
--
--select @periodConfiguredId =  isnull(p.periodId,0) from period p inner join periodStatus ps
--		on p.periodId = ps.periodId
--where ps.todate is null
--	and ps.periodstatustypeId in (1,2)
--Select pgs.*,
--		pgg.periodGradeId,
--		g.gradeId,
--		g.gradeDescription,
--		s.firstName,
--		s.middleName,
--		s.lastName,
--		gen.*,
--		pg.periodId
--from dbo.PeriodGradeStudent pgs inner join dbo.PeriodGradeGroup pgg
--			on pgs.periodGradeGroupId = pgg.periodGradeGroupId inner join PeriodGrade pg
--			on pgg.periodGradeId = pg.periodGradeid inner join Grade g
--			on pg.gradeId = g.gradeId inner join Student s
--			on pgs.studentId = s.studentId inner join Gender gen
--			on s.genderId = gen.genderId
--		where pg.PeriodId = 4
--			--and g.gradeId = @gradeId
--			and pgs.todate is null
END
