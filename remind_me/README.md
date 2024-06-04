As the virtual environment is used, poetry.

To install on Linux:
> curl -sSL https://install.python-poetry.org | python3 -
or via packet manager:
> pip install poetry
==================
To initialize a new project:
> poetry init
To add requirements:
> poetry add rich
> poetry add black --groups dev
==================
to install mandatory packages from pyproject.toml:
> poetry install

To activate a virtual environment:
> poetry shell
