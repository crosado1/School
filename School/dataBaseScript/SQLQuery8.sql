USE [School]
GO
/****** Object:  StoredProcedure [dbo].[proc_PeriodStatus_Insert]    Script Date: 06/27/2016 12:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[proc_PeriodStatus_Insert]
	--@periodStatusId int output,
	@periodId int,
	@periodStatusTypeId int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @periodStatusId int
	 

    -- Insert statements for procedure here
	Insert into PeriodStatus(periodId,periodStatusTypeId,fromDate,toDate)Values(@periodId,@periodStatusTypeId,getdate(),null)
	Select @periodStatusId = Scope_Identity()

	Update PeriodStatus
		Set todate = getdate()
	Where periodId = @periodId
			and todate is null
			and periodStatusId != @periodStatusId
END
