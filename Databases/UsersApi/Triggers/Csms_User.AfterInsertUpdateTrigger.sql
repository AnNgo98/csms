USE [CSMS.DB.Users]
GO
/****** Object:  Trigger [dbo].[Csms_User.AfterInsertUpdateTrigger]    Script Date: 3/20/2020 10:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[Csms_User.AfterInsertUpdateTrigger] ON [dbo].[CSMS_User]
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @user_id int;
	DECLARE @old_status int;
	DECLARE @new_status int;

	SELECT @user_id = i.Id, @new_status = i.StatusId FROM inserted i;

	IF NOT EXISTS(SELECT * FROM DELETED)
    BEGIN  -- Insert
		UPDATE CSMS_User
		SET StatusId = 1, CreateDate = GETDATE()
		WHERE Id = @user_id

		INSERT INTO CSMS_Log_User_Status (UserId, StatusId, ModifiedDate)
		VALUES (@user_id, 1, GETDATE())
    END
	ELSE  -- Update
	BEGIN
	
		UPDATE CSMS_User
		SET UpdateDate = GETDATE()
		WHERE Id = @user_id

		SELECT @old_status = i.StatusId FROM deleted i;
		IF @old_status != @new_status
		BEGIN
			INSERT INTO CSMS_Log_User_Status (UserId, StatusId, ModifiedDate)
			VALUES (@user_id, @new_status, GETDATE())
		END
	END
END
