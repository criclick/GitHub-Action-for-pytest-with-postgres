FROM python:3.7.8-stretch

LABEL "com.github.actions.name"="GitHub Action for pytest"
LABEL "com.github.actions.description"="Run pytest commands"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="yellow"
# Installing client libraries and any other package you need

# Installing build dependencies
RUN apt-get update && apt-get -y install  musl-dev python3-dev musl-dev bash libpq-dev libpq-dev postgresql postgresql-contrib gcc

RUN pip install --upgrade pip
RUN pip install pytest psycopg2 cython
RUN python --version ; pip --version ; pytest --version

COPY entry.sh /
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]
