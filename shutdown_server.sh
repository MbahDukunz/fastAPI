#!/bin/bash
source /home/c0121255/fastAPI/env/bin/activate
cd /home/c0121255/fastAPI

PID=`ps -eaf | grep 'uvicorn main:app' | grep -v grep | awk '{print $2, $8}'`
ADD=`netstat -tulpn | grep  $PID | grep -v grep | awk '{print $4}'`
if [[ "" !=  "$PID" ]]; then
  echo "killing $PID $ADD"
  kill -9 $PID
else
echo "FastAPI is not running"
fi

PID=`ps -eaf | grep '/home/c0121255/fastAPI/env/bin/python -c from multiprocessing' | grep -v grep | awk '{print $2, $8}'`
ADD=`netstat -tulpn | grep  $PID | grep -v grep | awk '{print $4}'`
if [[ "" !=  "$PID" ]]; then
  echo "killing $PID $ADD"
  kill -9 $PID
else
echo "FastAPI is not running"
fi

sleep 2
echo "" > nohup.out