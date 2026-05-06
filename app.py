from flask import Flask, request
from redis import Redis
from werkzeug.middleware.proxy_fix import ProxyFix # Thêm dòng này
import os

app = Flask(__name__)

# Cấu hình ProxyFix: 
# x_for=1 nghĩa là tin tưởng 1 lớp proxy đứng trước nó (LXD Proxy)
app.wsgi_app = ProxyFix(app.wsgi_app, x_for=1, x_proto=1, x_host=1)

redis = Redis(host='redis', port=6379)

@app.route('/')
def hello():
    count = redis.incr('hits')
    # Hiển thị IP thực tế của Client để kiểm tra
    client_ip = request.remote_addr 
    return f"<h1>Hello DevOps!</h1><p>Your IP: {client_ip}</p><p>Hits: {count}</p>"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)