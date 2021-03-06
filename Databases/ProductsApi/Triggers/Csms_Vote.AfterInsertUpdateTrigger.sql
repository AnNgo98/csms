USE [CSMS.DB.Products]
GO
/****** Object:  Trigger [dbo].[Csms_Vote.AfterInsertUpdateTrigger]    Script Date: 2/28/2020 10:06:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[Csms_Vote.AfterInsertUpdateTrigger] ON [dbo].[CSMS_Vote]
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @product_id int;

	SELECT @product_id = i.ProductId FROM inserted i;

		UPDATE CSMS_Product
		SET Rate = (
			SELECT AVG(Score)
			FROM CSMS_Vote
			WHERE ProductId = @product_id
		)
		WHERE Id = @product_id
    
END