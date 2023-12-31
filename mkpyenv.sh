#!/bin/bash

# this is a shell script to init a python envirnment with git
# it should start with one arg, the dir name
# and an optional arg, the python venv version

usage="$(basename "$0") [-h] -- a script to create a python virtual environment

where:
    -h show this help text

Currently it accept 2 arguments: directory and python version. 
The directory is mandatory and the python version is optional, by default is python3.

You can use the script like the following:
bash ./mkpyenv.sh <directory> <python_version>
"

if [ "$1" = "" ]
then
    echo >&2 "Error: No dir name is given!"
    echo >&2 "Error: Please given a name!"
    echo "$usage"
    exit 1
fi

if [ "$1" = "-h" ]
then
    echo "$usage"
    exit 0
fi

dir_name=$1
py_ver="python3"

if [ "$2" != "" ]
then
    py_ver=$2
fi

# check directory exist or not
if [ -d "$dir_name" ]
then
    echo >&2 "Error: $dir_name already exist!"
    echo >&2 "Error: Please consider another one!"
    exit 1
fi

checkCommand(){
    if ! command -v "$1" &> /dev/null
    then
        echo >&2 "Error: Command $1 does not exist!"
        echo >&2 "Error: Please install it first!"
        exit 1
    fi
}

checkCommand "$py_ver"
checkCommand git

echo "Info: Making directory ${dir_name}..."
mkdir "$dir_name"
if ! cd "$dir_name"
then
    echo >&2 "Error: Can not change directory to $dir_name"
    exit 1
fi

echo "Info: initalizing git repository..."
git init

echo "Info: creating python virtual envirnment..."
"$py_ver" -m venv venv

# shellcheck source=/dev/null
source ./venv/bin/activate

echo "Info: Installing needed dev-kit for development..."
PIP_DEV=requirment-dev.txt
touch "$PIP_DEV"
echo -e "black\nmypy\npytest" > "$PIP_DEV"
pip install -r "$PIP_DEV"

echo "Info: Downloading .gitignore file..."
wget https://raw.githubusercontent.com/github/gitignore/main/Python.gitignore
mv Python.gitignore .gitignore
