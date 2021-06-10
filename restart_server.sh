#!/bin/bash
source /home/c0121255/fastAPI/env/bin/activate
cd /home/c0121255/fastAPI
PID=$(ps aux | grep 'uvicorn main:app' | grep -v grep | awk {'print $2'} | xargs)
if [ "$PID" != "" ]
then
kill -9 $PID
PID=$(ps aux | grep '/home/c0121255/fastAPI/env/bin/python -c from multiprocessing' | grep -v grep | awk {'print $2'} | x>
if [ "$PID" != "" ]
then
kill -9 $PID
fi
sleep 2
echo "" > nohup.out
echo "Restarting FastAPI server"
else
echo "No such process. Starting new FastAPI server"
fi
nohup uvicorn main:app --host 0.0.0.0 --port 8000 &