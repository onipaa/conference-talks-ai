FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN conference_talks_ai create-db
RUN conference_talks_ai populate-db
RUN conference_talks_ai add-user -u admin -p admin
EXPOSE 5000
CMD ["conference_talks_ai", "run"]
