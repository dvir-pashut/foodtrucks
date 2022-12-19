FROM alpine:3.15 
RUN apk add python2 && apk add npm
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py && python2.7 get-pip.py 
COPY flask-app/ /app 
WORKDIR /app
RUN npm install
RUN npm run build
RUN  pip2 install -r requirements.txt
WORKDIR /app

COPY . .
ENTRYPOINT [ "python", "flask-app/app.py" ] 

#RUN python2 app.py
