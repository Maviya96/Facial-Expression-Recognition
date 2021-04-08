#Create a ubuntu base image with python 3 installed.
FROM python:3

#Set the working directory
WORKDIR /usr/src/app

#copy all the files
COPY . .

#Install the dependencies
RUN apt-get -y update
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN apt-get update ##[edited]
RUN apt-get install ffmpeg libsm6 libxext6  -y

#Expose the required port
EXPOSE 5003

#Run the command
CMD [“python3”, “./app.py”]