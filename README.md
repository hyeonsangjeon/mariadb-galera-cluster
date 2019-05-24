# mariadb-galera-cluster
mariadb 10.1 galera-cluster  docker-compose
Galera is a full synchronous HA Cluster.
Data can be changed on all nodes, Active-Active multi-master configuration - read / write on all nodes

* This docker image does not work for automatic migration of sql files such as the official mariadb image when the container image is deployed.

                
                
## How to use

1.Galera Cluster container starting 
```shell
docker-compose  -f ./docker-compose.yml up -d
```

2.Galera Cluster Creates a database user in mysql schema and app schema within the node1 container.
* This does not work for automatic migration of sql files such as the official mariadb image when the container image is deployed.

 It is necessary to enter the container of node 1 and execute the volume-linked account file in advance as a shell.
```shell
> docker exec -it node1-mariadb /bin/bash
> cd /docker-entrypoint-initdb.d/
> ./migration.sh root iamgroot mysql ./create_user.sql
```

3.Migrate sql dump file from the Galilean cluster node1. 
  
```shell
> ./migration.sh root iamgroot MODEL ./dump.sql
```

7.Confirm the sync state of Galera working and data migration at each node.
```shell
show status like 'wsrep_%';

show status like  'wsrep_incoming_addresses'
```


#### Failover Test 
When one of the Galera nodes fails, the rest of the nodes are blocked by the ensemble check, and when the stopped node is restarted, the data of the started node is automatically synchronized.

- Node1 ~ N sequential DCL, DML, DDL input test
- Node N stop -> nodeN-1 DCL, node N After startup, check for sync
- node1 스탑 -> node1 grastate.dat의 safe_to_bootstrap: 1 변경, node1 기동  

#### When Node1 Container Reboot
Node1 has the wsrep new cluster creation(wsrep-new-cluster) option. 
Node1 is started after changing the safe_to_bootstrap of 'grastate.dat 'to 1 in mariadb volume mount when starting up after stopping the container.


```txt 
# GALERA saved state
version: 2.1
uuid:    9382b31e-7de5-11e9-8653-12a8b887ac66
seqno:   -1
safe_to_bootstrap: 1    #<----- has to be 1 before start node1
```


#### When there is no DNS server in the closed network
Add mariadb variable skip_name_resolve is On
```yaml
    command:
      --wait_timeout=28800
      --character-set-server=utf8
      --collation-server=utf8_general_ci
      --max-allowed-packet=512M
      --net-buffer-length=5048576
      --skip-name-resolve=On
```

```shell
show status variables like 'skip_name_resolve';
```



