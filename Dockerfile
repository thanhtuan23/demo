# Sử dụng Python bản Alpine để tiết kiệm dung lượng
FROM python:3.9-alpine

# Thiết lập thư mục làm việc
WORKDIR /app

# Cài đặt thư viện cần thiết
RUN pip install flask

#Cài đặt thêm thư viện redis
RUN pip install flask redis

# Copy code vào container
COPY app.py .

# Mở port 8080
EXPOSE 8080

# Lệnh khởi chạy
CMD ["python", "app.py"]