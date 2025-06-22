IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'emp_admin')
    DROP LOGIN emp_admin;
GO

CREATE LOGIN emp_admin WITH PASSWORD = 'Secure@123';
GO

USE master;  
GO

IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'emp_user')
    DROP USER emp_user;
GO

CREATE USER emp_user FOR LOGIN emp_admin;
GO

EXEC sp_addrolemember 'db_owner', 'emp_user';
GO

-- Check if 'emp_user' is in 'db_owner' role
SELECT 
    DP1.name AS DatabaseRole,
    DP2.name AS DatabaseUser
FROM 
    sys.database_role_members AS DRM
JOIN 
    sys.database_principals AS DP1 ON DRM.role_principal_id = DP1.principal_id
JOIN 
    sys.database_principals AS DP2 ON DRM.member_principal_id = DP2.principal_id
WHERE 
    DP1.name = 'db_owner' AND DP2.name = 'emp_user';

