#!/bin/bash

parade_path="$PWD/sql"

echo "Parade Setup"
echo
read -p "Parade path ($parade_path): " parade_path_input

if [ ! -z "$parade_path_input" ]; then
    parade_path="$parade_path_input"
fi

# Make Directories
if [ ! -d "$parade_path" ]; then
    echo "Creating directory: $parade_path"
    mkdir "$parade_path"
fi

if [ ! -d "$parade_path/migrations" ]; then
    echo "Creating directory: $parade_path/migrations"
    mkdir "$parade_path/migrations"
fi

if [ ! -d "$parade_path/rollbacks" ]; then
    echo "Creating directory: $parade_path/rollbacks"
    mkdir "$parade_path/rollbacks"
fi

if [ ! -e "$parade_path/migrations.txt" ]; then
    echo "Creating file: $parade_path/migrations.txt"
    touch "$parade_path/migrations.txt"
fi

if [ ! -e ".env" ]; then
    echo "Creating file: .env"
    touch ".env"
    echo "Adding .env to .gitignore"
    echo ".env" >> .gitignore
fi

echo
read -p "Default database: " default_db

echo
read -p "Code editor: " editor

echo
echo "Downloading Parade..."
curl https://raw.githubusercontent.com/negcx/parade/master/parade > $parade_path/parade
chmod +x $parade_path/parade
echo

echo "Updating .env..."
echo "export PARADE_PATH=\"$parade_path\""
echo "export PARADE_PATH=\"$parade_path\"" >> ".env"
export PARADE_PATH="$parade_path"

echo "export PARADE_DB=\"$default_db\""
echo "export PARADE_DB=\"$default_db\"" >> ".env"
export PARADE_DB="$default_db"

echo "export PATH=\"\$PATH:$parade_path\""
echo "export PATH=\"\$PATH:$parade_path\"" >> ".env"
export PATH="$PATH:$parade_path"

echo "export PARADE_EDITOR=\"$editor\""
echo "export PARADE_EDITOR=\"$editor\"" >> ".env"
export PARADE_EDITOR="$editor"

echo "You're all set. Don't forget to run parade install on your database(s)."