FROM node:16-alpine
 
WORKDIR /var/lib/jenkins/workspace/reactApplicationDeploymentPipline
 
COPY package.json .
 
RUN npm install 

COPY . .

EXPOSE 80

CMD ["npm" , "start"]
