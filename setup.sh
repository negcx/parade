#!/bin/bash

parade_path="$PWD/sql"

echo "Parade Setup"
echo
read parade_path_input"?Parade path ($parade_path): " 

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
read default_db"?Default database: "

echo
read editor"?Code editor: "

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

echo
echo "Downloading Parade..."
