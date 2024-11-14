-- Create replication user
CREATE USER 'repl_user'@'%' IDENTIFIED BY 'repl_password';
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'repl_user'@'%';


-- Create MaxScale user with necessary permissions
CREATE USER 'max_user'@'%' IDENTIFIED BY 'max_password';

GRANT SELECT ON mysql.user TO 'max_user'@'%';
GRANT SELECT ON mysql.db TO 'max_user'@'%';
GRANT SELECT ON mysql.tables_priv TO 'max_user'@'%';
GRANT SELECT ON mysql.columns_priv TO 'max_user'@'%';
GRANT SELECT ON mysql.procs_priv TO 'max_user'@'%';
GRANT SELECT ON mysql.proxies_priv TO 'max_user'@'%';
GRANT SELECT ON mysql.roles_mapping TO 'max_user'@'%';
GRANT SHOW DATABASES ON *.* TO 'max_user'@'%';
GRANT SELECT, REPLICATION CLIENT, REPLICATION SLAVE, SLAVE MONITOR, SHOW DATABASES, SUPER, PROCESS, RELOAD, EVENT
ON *.*
TO 'max_user'@'%';
