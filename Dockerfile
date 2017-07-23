FROM hypriot/rpi-node

RUN groupadd -r sbot && useradd --no-log-init -r -g sbot sbot
run mkdir -p /home/sbot
RUN chown -R sbot:sbot /home/sbot



# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

RUN chown -R sbot:sbot /usr/src/*

USER sbot:sbot

EXPOSE 8080
CMD [ "npm", "start" ]
