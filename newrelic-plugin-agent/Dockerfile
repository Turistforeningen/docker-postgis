FROM alpine:latest

RUN adduser -D -H newrelic
RUN mkdir -p /var/log/newrelic

RUN apk update
RUN apk add python py-pip python-dev postgresql-dev gcc musl-dev
RUN pip install newrelic-plugin-agent newrelic-plugin-agent\[postgresql\] psycopg2
RUN apk del gcc musl-dev

CMD ["newrelic-plugin-agent", "-c", "/etc/newrelic/newrelic-plugin-agent.cfg", "-f"]
