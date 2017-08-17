FILE="/data/db/default.json"

if [ -e $FILE ]; then
    echo "Importing $FILE"
    mongoimport --file $FILE
fi
