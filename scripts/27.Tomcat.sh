#!/bin/bash
# Author : Arjun Shrinivas
# Purpose : This script is usefull for managing tomcat

# CATALINA_HOME=/u01/tomcat
CATALINA_HOME=/opt/tomcat8
OPTION=$1

case $OPTION in
start)
	$CATALINA_HOME/bin/startup.sh >> /dev/null
	if [[ $? -eq '0' ]]; then
		echo -e "\e[97mStarting Tomcat\t\t[ \e[1m\e[32mOK \e[97m]"
	else
		echo -e "\e[97mStarting Tomcat\t\t[ \e[1m\e[31mFAILED \e[97m]"
	fi
;;
stop)
	$CATALINA_HOME/bin/shutdown.sh >> /dev/null
	if [[ $? -eq '0' ]]; then
		echo -e "\e[97mStopping Tomcat\t\t[ \e[1m\e[32mOK \e[97m]"
	else
		echo -e "\e[97mStopping Tomcat\t\t[ \e[1m\e[31mFAILED \e[97m]"
	fi
;;
restart)
	PID=`ps -ef | grep catalina | grep -vi 'grep\|out$' | awk '{print $2}'`
	if [[ -z $PID ]]
	then
		$CATALINA_HOME/bin/startup.sh >> /dev/null
		if [[ $? -eq '0' ]]; then
			echo -e "\e[97mRestarting Tomcat\t\t[ \e[1m\e[32mOK \e[97m]"
		else
			echo -e "\e[97mRestarting Tomcat\t\t[ \e[1m\e[31mFAILED \e[97m]"
		fi
	else
		$CATALINA_HOME/bin/shutdown.sh >> /dev/null
		if [[ $? -eq '0' ]]; then
			echo -e "\e[97mStopping Tomcat\t\t[ \e[1m\e[32mOK \e[97m]"
		else
			echo -e "\e[97mStopping Tomcat\t\t[ \e[1m\e[31mFAILED \e[97m]"
		fi
		sleep 10
		PID=`ps -ef | grep catalina | grep -vi 'grep\|out$' | awk '{print $2}'`
		if [[ -z $PID ]]
		then
			$CATALINA_HOME/bin/startup.sh >> /dev/null
			if [[ $? -eq '0' ]]; then
				echo -e "\e[97mStarting Tomcat\t\t[ \e[1m\e[32mOK \e[97m]"
			else
				echo -e "\e[97mStarting Tomcat\t\t[ \e[1m\e[31mFAILED \e[97m]"
			fi
		else
			echo -e "Unable to shutdown tomcat. Force killing tomcat PID : $PID"
			kill -9 $PID
			$CATALINA_HOME/bin/startup.sh >> /dev/null
			if [[ $? -eq '0' ]]; then
				echo -e "\e[97mStarting Tomcat\t\t[ \e[1m\e[32mOK \e[97m]"
			else
				echo -e "\e[97mStarting Tomcat\t\t[ \e[1m\e[31mFAILED \e[97m]"
			fi
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
