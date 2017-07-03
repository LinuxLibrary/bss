#!/bin/bash
# Author : Arjun Shrinivas
# Purpose : This script is usefull for managing tomcat

# CATALINA_HOME=/u01/tomcat
CATALINA_HOME=/opt/tomcat8
OPTION=$1

case $OPTION in
start)
	PID=`ps -ef | grep catalina | grep -vi 'grep\|out$' | awk '{print $2}'`
	if [[ -z $PID ]]; then
		$CATALINA_HOME/bin/startup.sh >> /dev/null
		echo -e "\e[97mStarting Tomcat\t\t[ \e[1m\e[32mOK \e[97m]\e[39m"
	elif [[ ! -z $PID ]]; then
		echo -e "\e[97mStarting Tomcat\t\t[ \e[1m\e[31mFAILED \e[97m]"
		echo -e "\e[97mTomcat is up and running on PID: \e[32m$PID\e[39m"
	fi
;;
stop)
	PID=`ps -ef | grep catalina | grep -vi 'grep\|out$' | awk '{print $2}'`
	if [[ ! -z $PID ]]; then
		$CATALINA_HOME/bin/shutdown.sh >> /dev/null 2>&1
		echo -e "\e[97mStopping Tomcat\t\t[ \e[1m\e[32mOK \e[97m]"
	else
		echo -e "\e[97mStopping Tomcat\t\t[ \e[1m\e[31mFAILED \e[97m]\nTomcat is not running\e[39m"
	fi
;;
restart)
	PID=`ps -ef | grep catalina | grep -vi 'grep\|out$' | awk '{print $2}'`
	if [[ -z $PID ]]
	then
		$CATALINA_HOME/bin/startup.sh >> /dev/null
		echo -e "\e[97mTomcat is not running\nStarting Tomcat\t\t[ \e[1m\e[32mOK \e[97m]"
	else
		$CATALINA_HOME/bin/shutdown.sh >> /dev/null 2>&1
		echo -e "\e[97mStopping Tomcat\t\t[ \e[1m\e[32mOK \e[97m]"
		sleep 10
		PID=`ps -ef | grep catalina | grep -vi 'grep\|out$' | awk '{print $2}'`
		if [[ -z $PID ]]
		then
			$CATALINA_HOME/bin/startup.sh >> /dev/null
			echo -e "\e[97mStarting Tomcat\t\t[ \e[1m\e[32mOK \e[97m]"
		else
			echo -e "Unable to shutdown tomcat. Force killing tomcat PID : $PID"
			kill -9 $PID
			$CATALINA_HOME/bin/startup.sh >> /dev/null
			echo -e "\e[97mStarting Tomcat\t\t[ \e[32mOK \e[97m]"
		fi
	fi
;;
status)
	PID=`ps -ef | grep catalina | grep -vi 'grep\|out$' | awk '{print $2}'`
	if [[ ! -z $PID ]]
	then
		echo -e "\e[92mTomcat is running on pid : $PID\e[39m"
	else
		echo -e "\e[31mTomcat is not running\e[39m"
	fi
;;
*)
	echo "Invalid operation"
	echo "Usage: `basename $0` start|stop|restart|status"
;;
esac

# END
