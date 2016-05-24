#!/bin/bash
# Author : Arjun Shrinivas
# Purpose : This script is usefull for managing tomcat

CATALINA_HOME=/u01/tomcat
OPTION=$1

case $OPTION in
start)
	echo "Starting tomcat"
	$CATALINA_HOME/bin/startup.sh
;;
stop)
	echo "Stopping tomcat"
	$CATALINA_HOME/bin/shutdown.sh
;;
restart)
	PID=`ps -ef | grep catalina | grep -vi 'grep\|out$' | awk '{print $2}'`
	if [[ -z $PID ]]
	then
		echo "Starting tomcat"
		$CATALINA_HOME/bin/startup.sh
	else
		echo "Stopping tomcat"
		$CATALINA_HOME/bin/shutdown.sh
		sleep 20
		PID=`ps -ef | grep catalina | grep -vi 'grep\|out$' | awk '{print $2}'`
		if [[ -z $PID ]]
		then
			echo "Starting tomcat"
			$CATALINA_HOME/bin/startup.sh
		else
			echo -e "Unable to shutdown tomcat. Force killing tomcat PID : $PID"
			kill -9 $PID
			echo "Starting tomcat"
			$CATALINA_HOME/bin/startup.sh
		fi
	fi
;;
status)
	PID=`ps -ef | grep catalina | grep -vi 'grep\|out$' | awk '{print $2}'`
	if [[ ! -z $PID ]]
	then
		echo -e "Tomcat is running on pid : $PID"
	else
		echo -e "Tomcat is not running"
	fi
;;
*)
	echo "Invalid operation"
	echo "Usage: `basename $0` start|stop|restart|status"
;;
esac

# END
