FROM python:3.8-slim

LABEL "com.github.actions.name"="GitHub Action for pytest"
LABEL "com.github.actions.description"="Run pytest commands"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="yellow"
# Installing client libraries and any other package you need
RUN apk update && apk add libpq postgresql postgresql-contrib

# Installing build dependencies
RUN apk add --virtual .build-deps gcc python3-dev musl-dev postgresql-dev bash

# Installing and build python module
RUN pip install psycopg2

# Delete build dependencies
RUN apk del .build-deps
RUN pip install --upgrade pip
RUN pip install pytest
RUN python --version ; pip --version ; pytest --version

COPY entry.sh /
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]
