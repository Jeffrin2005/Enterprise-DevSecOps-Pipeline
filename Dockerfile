# BAD PRACTICE: Using an outdated, insecure base image (Trivy will catch this!)
FROM python:3.6-alpine 

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY app.py .

CMD ["python", "app.py"]
