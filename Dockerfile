# Sử dụng Python bản Alpine để tiết kiệm dung lượng
FROM python:3.9-alpine

# Thiết lập thư mục làm việc
WORKDIR /app

# Cập nhật index và nâng cấp các gói hệ thống để fix CVE
RUN apk update && apk upgrade --no-cache

# Cài đặt thư viện cần thiết
RUN pip install flask redis

# Copy code vào container
COPY app.py .

# Mở port 8080
EXPOSE 8080

# Lệnh khởi chạy
CMD ["python", "app.py"]