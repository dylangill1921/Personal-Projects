/* Security Logins */
USE Formula1;

-- Create a login for the user
CREATE LOGIN api_user WITH PASSWORD = 'JaxonLolaLakehouse2018!';
-- Create a user in the Formula1 database for that login
CREATE USER api_user FOR LOGIN api_user;

EXEC sp_addrolemember 'db_owner', 'api_user';

-- Check roles for the api_user
SELECT 
    dp.name AS DatabaseRoleName,
    mp.name AS MemberName
FROM 
    sys.database_role_members AS drm
JOIN 
    sys.database_principals AS dp ON drm.role_principal_id = dp.principal_id
JOIN 
    sys.database_principals AS mp ON drm.member_principal_id = mp.principal_id
WHERE 
    mp.name = 'api_user';


