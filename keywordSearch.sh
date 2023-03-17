echo "Please enter the keyword you would like to search..."
read SEARCHKEY


grep -i -r --color=always "$SEARCHKEY" "/Users/jibreelkeddo/DailyLogs/Whispers" | sed 's/^\(.*\/\)\{0,1\}\([^\/]*\):\(.*\)$/\2:\3/'

### old search params/refinements
#| sed 's/^\(.*\/\)\{0,1\}\([^\/]*\):\(.*\)$/\2:\3/' | less -R

echo "\n\nKeyword search completed!"

exit
