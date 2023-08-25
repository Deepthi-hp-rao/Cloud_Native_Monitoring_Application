#base image
FROM python:3.11-slim

#directory where the conatiner work
WORKDIR /app 

#req file inside /app so that container should have all the dependencies
COPY requirements.txt /app 

# Install development tools and headers
RUN apt-get update && \
    apt-get install -y gcc python3-dev && \
    rm -rf /var/lib/apt/lists/*

#instal all the dependencies in req file
RUN pip3 install --no-cache-dir -r requirements.txt 

#to copy everything in clo_nat_mon dir to the /app dir
COPY . /app

#even Running this appl in docker container it works fine, which is not restricting appl
ENV FLASK_RUN_HOST=0.0.0.0

#Expose port 18080 for web traffic
EXPOSE 18080 

#Define the command to run when the container starts
CMD ["flask", "run", "--port=18080"]

# ENTRYPOINT ["python"]

# CMD ["app.py"]