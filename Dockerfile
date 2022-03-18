FROM python:3.7.7-strech AS BASE

RUN apt-get update \
	&& apt-get --assume yes --no-install-recomends install \
		build-essential \
		curl \
		git \
		jq \
		libgomp1 \
		vim

WORKDIR /app
RUN pip install --no-cache --upgrade pip

RUN pip install rasa

ADD credentials.yml credentials.yml
ADD endpoints.yml endpoints.yml
ADD config.yml config.yml
ADD domain.yml domain.yml