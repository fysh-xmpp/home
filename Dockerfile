FROM node:7.5.0

ADD package.json package.json
RUN npm install
ADD . .

ARG NODE_ENV=production
ENV NODE_ENV=$NODE_ENV

EXPOSE 3000

CMD ["npm", "start"]
