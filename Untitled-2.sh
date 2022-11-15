#!bin/bash

mkdir usr/share/nginx/html
mkdir usr/share/nginx/html/project
mkdir usr/share/nginx/html/WebApp

cp sample_app.py usr/share/nginx/html/.
cp -r project/* usr/share/nginx/html/project/.
cp -r WebApp/* usr/share/nginx/html/WebApp/.

echo "FROM python">>usr/share/nginx/html/Dockerfile
echo "RUN pip install flask">>usr/share/nginx/html/Dockerfile
echo "COPY ./Project /home/myapp/project/">>usr/share/nginx/html/Dockerfile
echo "COPY ./WebApp /home/myapp/WebApp/">>usr/share/nginx/html/Dockerfile
echo "COPY sample_app.py/home/myapp/">>usr/share/nginx/html/Dockerfile
echo "Expose 8080">> /usr/share/nginx/html/Dockerfile
echo "CMD python /home/myapp/sample_app.py">>usr/share/nginx/html/Dockerfile
cd /usr/share/nginx/html

docker build -t  IFA3022-Exam-Image:v1

docker run -t -d -p 8080:8080 --name samplerunning  IFA3022-Exam-Image:v1
docker ps -a















