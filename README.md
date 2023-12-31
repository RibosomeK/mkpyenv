# A Bash Script To Create A Python Virtual Environment 

This script is aimed to making a python develop environment with git initialized for quick start. It just do the following things:
1. Making a directory by given directory argument.
2. Changed directory to that folder and git init.
3. Creating a Python virtual environment using [venv](https://docs.python.org/3/library/venv.html) 
4. Installing 3 python libraries: [black](https://github.com/psf/black) (formatter), [mypy](https://github.com/python/mypy) (static type checker), [pytest](https://github.com/pytest-dev/pytest) (test framework)
5. Adding a [.gitignore](https://raw.githubusercontent.com/github/gitignore/main/Python.gitignore) file for python

## Usage
Currently it accept 2 arguments: directory and python version. The directory is mandatory and the python version is optional, by default is `python3`.

You can use the script like the following: 

```bash
bash ./mkpyenv.sh "$directory" "$python_version"

# or
chmod +x ./mkpyenv.sh
./mkpyenv.sh "$directory" "$python_version"
```

More details, for example, if you want to create a working folder named "project1" and use Python 3.9, typing the following command in your terminal:
```bash
bash ./mkpyenv.sh project1 python3.9

# or
chmod +x ./mkpyenv.sh
./mkpyenv.sh project1 python3.9
```