hadoop fs -mkdir /userinfo
hadoop fs -put u.user /userinfo
hadoop fs -ls /userinfo

hadoop fs -mkdir /movieinfo
hadoop fs -put u.item /movieinfo
hadoop fs -ls /movieinfo