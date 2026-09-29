# Simple Python Flask Application
from flask import Flask
import os

app = Flask(__name__)

# BAD PRACTICE: Hardcoded secret (SonarQube will catch this!)
DB_PASSWORD = "super_secret_password_123" 

@app.route("/")
def hello():
    return "Hello, DevSecOps World!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
