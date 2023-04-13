FILENAME="/Users/jibreelkeddo/DailyLogs/Searches/SearchResults"
TIMESTAMP_YEARMONTH=`date "+%Y%m"`
echo "Searching for $1"
echo "Old search mods below"

echo "<!DOCTYPE html><html><head><title>Whisper Search Results</title></head><body>" > $FILENAME.html
echo "<link rel="stylesheet" href="./pico.css"></link><div &nbsp data-theme="dark">" >> $FILENAME.html
grep -i -r -H "$1" /Users/jibreelkeddo/DailyLogs/Whispers/* /Users/jibreelkeddo/DailyLogs/TODOs/* /Users/jibreelkeddo/DailyLogs/DailyLogs/*| sed 's/:/\<br>/;s/$/<br><br>/' >> $FILENAME.html
echo "</div></body></html>" >> $FILENAME.html

open $FILENAME.html
exit