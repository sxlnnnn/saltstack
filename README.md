
# saltstack自动化部署网站集群
利用saltstack自动化部署一个大型网站集群架构
## 网站架构
![架构图](https://github.com/sxlnnnn/saltstack/blob/master/cluster.PNG)


## ip地址规划
	192.168.1.50    zabbix-server    salt-master               部署机
	192.168.1.61    lvs-master+keepalived  VIP1 192.168.1.66   四层负载均衡（双活）   
	192.168.1.62    lvs-slave +keepalived  VIP2 192.168.1.249  四层负载均衡（双活）
	192.168.1.253   nginx1     VIP2  192.168.1.249             七层负载均衡  
	192.168.1.254   nginx2     VIP2  192.168.1.249             七层负载均衡
	192.168.1.71    haproxy1   VIP1  192.168.1.66              四七负载均衡 
	192.168.1.72    haproxy2   VIP1  192.168.1.66              四七负载均衡
	192.168.1.81    tomcat                                     web集群
	192.168.1.82    php                                        web集群
	192.168.1.90    nfs                                        共享存储 
	192.168.1.91    rsync                                      备份服务器
	192.168.1.92    mysql-master                               双主单写
	192.168.1.93    mysql-slave                                双主
