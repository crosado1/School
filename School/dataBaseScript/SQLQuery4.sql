USE [School]
GO
/****** Object:  StoredProcedure [dbo].[proc_Period_Insert]    Script Date: 06/28/2016 10:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[proc_Period_Insert]
	@periodId int output,
	@yearFrom	int,
	@yearTo	int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into Period(yearFrom,yearTo,active)Values(@yearFrom,@yearTo,0)
	Select @periodId = Scope_Identity()

	exec dbo.proc_PeriodStatus_Insert @periodId,1
END
