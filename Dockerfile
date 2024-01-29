# pull official base image
FROM python:3.9.2-alpine

# set work directory
WORKDIR /usr/src/django

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip

RUN apk update
RUN apk add libpq tiff-dev jpeg-dev openjpeg-dev zlib-dev freetype-dev lcms2-dev \
    libwebp-dev tcl-dev tk-dev harfbuzz-dev fribidi-dev libimagequant-dev \
    libxcb-dev libpng-dev libjpeg

COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . .

RUN python3 manage.py collectstatic --noinput