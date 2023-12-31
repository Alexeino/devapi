# Base Builder Image for Multi Stage build

FROM python:3.10-alpine as builder

ENV PYTHONDONTWRITEBYTECODE 1

RUN apk add --update --virtual .build-deps \
    build-base \
    postgresql-dev \
    python3-dev \
    libpq

COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

# Main Image Build

FROM python:3.10-alpine 

RUN apk add libpq

# Copy executables from builder
COPY --from=builder /usr/local/lib/python3.10/site-packages/ /usr/local/lib/python3.10/site-packages/
COPY --from=builder /usr/local/bin/ /usr/local/bin/

COPY . /app

RUN chmod +x /app/gunicorn_config.py
ENV PYTHONUNBUFFERED 1

WORKDIR /app
# For local
# CMD [ "python","/app/manage.py","runserver","0.0.0.0:8000" ]

# For Prod to use Gunicorn
CMD [ "gunicorn","--config","/app/gunicorn_config.py","devapi.wsgi:application" ] 
# CMD [ "gunicorn","devapi.wsgi:application","-b","0.0.0.0:8000" ]