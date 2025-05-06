-- Explicitly create application database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AppDB')
BEGIN
    CREATE DATABASE AppDB;
    PRINT 'Created AppDB database';
END
GO

-- Switch to application database context
USE AppDB;
GO

-- Create users table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'users' AND type = 'U')
BEGIN
    CREATE TABLE users (
        id INT IDENTITY(1,1) PRIMARY KEY,
        username NVARCHAR(50) NOT NULL,
        email NVARCHAR(100) NOT NULL
    );
    PRINT 'Created users table';
END
GO

-- Insert default user if not exists
IF NOT EXISTS (SELECT * FROM users WHERE username = 'mssql_user')
BEGIN
    INSERT INTO users (username, email)
    VALUES ('mssql_user', 'mssql@example.com');
    PRINT 'Added default user';
END
GO

-- Verification query
SELECT 
    DB_NAME() AS database_name,
    COUNT(*) AS user_count 
FROM users;
GO