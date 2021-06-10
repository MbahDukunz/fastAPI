#!/bin/bash
source /home/c0121255/fastAPI/env/bin/activate
cd /home/c0121255/fastAPI

PID=`ps -eaf | grep 'uvicorn main:app' | grep -v grep | awk '{print $2}'`
CMD=`ps -eaf | grep 'uvicorn main:app' | grep -v grep | awk '{print $8}'`
if [[ "" !=  "$PID" ]]; then
	ADD=`netstat -tulpn | grep  $PID | grep -v grep | awk '{print $4}'`
	echo "killing $PID $CMD $ADD"
	kill -9 $PID
else
	echo "FastAPI is not running"
fi

PID=`ps -eaf | grep '/home/c0121255/fastAPI/env/bin/python -c from multiprocessing' | grep -v grep | awk '{print $2}'`
CMD=`ps -eaf | grep '/home/c0121255/fastAPI/env/bin/python -c from multiprocessing' | grep -v grep | awk '{print $8}'`
if [[ "" !=  "$PID" ]]; then
	ADD=`netstat -tulpn | grep  $PID | grep -v grep | awk '{print $4}'`
	echo "killing $PID $CMD $ADD"
	kill -9 $PID
else
	echo "FastAPI is not running"
fi

sleep 2
echo "" > nohup.out
