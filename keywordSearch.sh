echo "Please enter the keyword you would like to search..."
read SEARCHKEY


FILENAME="/Users/jibreelkeddo/DailyLogs/Searches/SearchResults"
TIMESTAMP_YEARMONTH=`date "+%Y%m"`
echo "Searching for $SEARCHKEY"
echo "Old search mods below"

echo "<html><body style=\"background-color:grey;\">" > $FILENAME.html
grep -i -r "$1" /Users/jibreelkeddo/DailyLogs/Whispers/* /Users/jibreelkeddo/DailyLogs/TODOs/* /Users/jibreelkeddo/DailyLogs/DailyLogs/*| sed 's/$/<br><br>/' >> $FILENAME.html
echo "</body></html>" >> $FILENAME.html

open $FILENAME.html



##################################################
##### old/broken/retired keywordSearchQueries#####
##################################################
# grep -i -r --color=always "$SEARCHKEY" "/Users/jibreelkeddo/DailyLogs/Whispers" | sed 's/^\(.*\/\)\{0,1\}\([^\/]*\):\(.*\)$/\2:\3/' | less -R
# grep -i -r "$1" /Users/jibreelkeddo/DailyLogs/Whispers/* | sed 's/^\(.*\/\)\{0,1\}\([^\/]*\):\(.*\)$/\2:\3/' >> $FILENAME.html
# grep -i -r --color=always "$SEARCHKEY" "/Users/jibreelkeddo/DailyLogs/Whispers" | sed 's/^\(.*\/\)\{0,1\}\([^\/]*\):\(.*\)$/\2:\3/'
##################################################
##################################################


echo "\n\nKeyword search completed!"

exit
