# Base image Linux with Pyton 
FROM python:3.10-slim

# Create variable of the environment
ENV APP_HOME /my_app

#Chose workdir in container
WORKDIR $APP_HOME

# Set dependencies in container
COPY pyproject.toml $APP_HOME/pyproject.toml
COPY poetry.lock $APP_HOME/poetry.lock

RUN pip install poetry 
RUN poetry config virtualenvs.create false && poetry install --only main

# Copy another files in workdir
COPY . .

# Run programm in container
CMD ["python", "./remind_me/main.py"]
