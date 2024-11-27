# Demo: HA with MariaDB and MaxScale (no single point of failure)

This repository contains a Docker Compose and related configuration files to deploy MariaDB and MaxScale with high availability on your local machine.

The deployment contains redundant MariaDB server and MaxScale nodes. Any single node can fail without affecting the availability of the database.

## Requirements

You need Docker running on your machine.

## Deploying the database

1. Clone this repository.
2. Open a terminal and move to the directory where the repository is.
3. Run the following:

```shell
docker compose up -d
```

4. Check that the containers are up and running:

```shell
docker ps
```

5. If you encounter errors, check the logs. For example:

```shell
docker logs mariadb1
docker logs maxscale1
```

## Testing high availability

1. Connect your application to the database using one of the MariaDB Connectors. Make sure to activate _transaction replay_ and use the _sequential_ mode to specify all the three hosts running MaxScale. For example, in a Java application use the following JDBC connection string:

```
jdbc:mariadb:sequential://127.0.0.1:4001,127.0.0.1:4002,127.0.0.1:4003/demo?transactionReplay=true
```

2. As your application sends reads and writes to the database, stop a MariaDB node and check that the application continues to work without failures thanks to MaxScale's automatic failover. For example:

```shell
docker stop mariadb1
```

3. As you application sends reads and writes to the database, stop a MaxScale instance and check that the application continues to work without failures thanks to the sequential mode in MariaDB Connector/J:

```shell
docker stop maxscale1
```
