FROM alpine:3 AS multy
RUN apk add npm
#RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py && python2.7 get-pip.py 
COPY . /app 
WORKDIR /app
RUN npm install
RUN npm run build
#RUN  pip2 install -r requirements.txt
WORKDIR /app
#ENTRYPOINT [ "python", "app.py" ] 


FROM alpine:3
WORKDIR /app
COPY --from=multy /app . 
RUN apk add python2 
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py && python2.7 get-pip.py 
RUN pip2 install -r requirements.txt
ENTRYPOINT [ "python", "app.py" ] 

