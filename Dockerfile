FROM node:8.0-alpine

ARG app_env
ENV HOME=/home/app APP_ENV=$app_env

RUN mkdir -p $HOME/frontend
WORKDIR $HOME/frontend
COPY ./frontend ./

RUN npm install

CMD if [ ${APP_ENV} = production ]; \
	then \
	npm install -g http-server && \
	npm run build && \
	cd build && \
	hs -p 3000; \
	else \
	npm run start; \
	fi

EXPOSE 3000

USER node
