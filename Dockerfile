FROM python:3.7-alpine

LABEL "com.github.actions.name"="GitHub Action for pytest"
LABEL "com.github.actions.description"="Run pytest commands"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="yellow"
# Installing client libraries and any other package you need

# Installing build dependencies
RUN apk update && apk add --no-cache  musl-dev python3-dev musl-dev postgresql-dev bash libpq postgresql postgresql-contrib linux-headers gcc

RUN pip install --upgrade pip
RUN pip install pytest psycopg2 cython
RUN python --version ; pip --version ; pytest --version

COPY entry.sh /
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]
