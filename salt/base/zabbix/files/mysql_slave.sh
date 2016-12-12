#!/bin/sh

usage() {
echo "usage: input io(Slave_IO_Running)|sql(Slave_SQL_Running)|errno(Last_Errno)|seconds(Seconds_Behind_Master)"
}

array=(`/usr/local/mysql/bin/mysql -uroot -p123 -e "show slave status\G" |egrep "Running|Seconds|Last_Errno"`)

case "$1" in 

 io)
   if [ "${array[1]}" == "Yes" ];then
      echo "1"    
   else
      echo "2"
   fi
    ;;
 sql)
   if [ "${array[3]}" == "Yes" ];then
      echo "1"    
   else
      echo "2"
   fi
    ;;
 errno)
   echo ${array[5]} 
    ;;
seconds)
   echo ${array[7]}
    ;;
    *)
     usage
esac

