IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Departments] (
    [EmpID] int NOT NULL IDENTITY,
    [EmpName] nvarchar(max) NULL,
    [EmpPhone] float NOT NULL,
    CONSTRAINT [PK_Departments] PRIMARY KEY ([EmpID])
);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210428035534_EmployeeDB1', N'5.0.5');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [Departments] ADD [DOJ] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.0000000';
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20210428061051_EmployeeDB2', N'5.0.5');
GO

COMMIT;
GO

