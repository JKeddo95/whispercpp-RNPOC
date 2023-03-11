#!/bin/bash

while true
do
  pkill -f "./stream"  # Kill the process that matches the script name
  pkill -f "stream"  # Kill the process that matches the script name
  echo "Starting the whisper cpp..."

  TIMESTAMP=`date "+%Y%m%d"`
  TIMESTAMP_YEARMONTH=`date "+%Y%m"`
  TIMESTAMP_HOUR=`date "+_%H-%M-%S"`
  INPUT="$TIMESTAMP$TIMESTAMP_HOUR"
  FILENAME="WHISPER_$INPUT"
  DESTINATION=""
  mkdir "/Users/jibreelkeddo/DailyLogs/Whispers/$TIMESTAMP_YEARMONTH/"

  ./stream -m models/ggml-large.bin -t 8 -tr -f "/Users/jibreelkeddo/DailyLogs/Whispers/$TIMESTAMP_YEARMONTH/$FILENAME.txt" --step 55000 --length 60000 --keep 5000 &  # Run the script in the background
  sleep 1800  # Wait for 30 minutes
  echo "Killing the script..."
  pkill -f "./stream"  # Kill the process that matches the script name
  pkill -f "stream"  # Kill the process that matches the script name
  wait
done

pkill -f "./stream"  # Kill the process that matches the script name
pkill -f "stream"  # Kill the process that matches the script name