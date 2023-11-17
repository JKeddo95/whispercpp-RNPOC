#!/bin/bash
# bash ./models/download-ggml-model.sh large-v3

## Backup for loop to keep trying to kill stream if it stays alive in BG
pkill -f "./stream" && while pgrep -l "stream";
  do sleep 1;
done;

while true
do
  pkill -f "./stream"  # Kill the process that matches the script name
  echo "Starting whisper cpp..."

  TIMESTAMP=`date "+%Y%m%d"`
  TIMESTAMP_YEARMONTH=`date "+%Y%m"`
  TIMESTAMP_HOUR=`date "+_%H-%M-%S"`
  INPUT="$TIMESTAMP$TIMESTAMP_HOUR"
  FILENAME="WHISPER_$INPUT"
  DESTINATION=""
  mkdir "/Users/jibreelkeddo/DailyLogs/Whispers/"
  mkdir "/Users/jibreelkeddo/DailyLogs/WhisperPages/"
  mkdir "/Users/jibreelkeddo/DailyLogs/Whispers/$TIMESTAMP_YEARMONTH/"
  mkdir "/Users/jibreelkeddo/DailyLogs/WhisperPages/$TIMESTAMP_YEARMONTH/"
  touch "/Users/jibreelkeddo/DailyLogs/Whispers/$TIMESTAMP_YEARMONTH/$FILENAME.txt"
  touch "/Users/jibreelkeddo/DailyLogs/WhisperPages/$TIMESTAMP_YEARMONTH/$FILENAME.html"




  ./stream -m models/ggml-large-v3.bin -t 6 -pc --language "auto" -f "/Users/jibreelkeddo/DailyLogs/Whispers/$TIMESTAMP_YEARMONTH/$FILENAME.txt" -fh "/Users/jibreelkeddo/DailyLogs/WhisperPages/$TIMESTAMP_YEARMONTH/$FILENAME.html" --step 57000 --length 57000 --keep 3000 &  # Run the script in the background
  sleep 1800  # Wait for 30 minutes
  echo "Killing the script..."
  pkill -f "./stream"  # Kill the process that matches the script name
  wait
  ## Backup for loop to keep trying to kill stream if it stays alive in BG
  pkill -f "./stream" && while pgrep -l "stream";
    do sleep 1;
  done;
done

pkill -f "./stream"  # Kill the process that matches the script name
## Backup for loop to keep trying to kill stream if it stays alive in BG
pkill -f "./stream" && while pgrep -l "stream";
  do sleep 1;
done;