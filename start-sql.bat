@REM Vào thư mục dự án
cd "%USERPROFILE%\Desktop\Practice MySQL"

@REM Tạo docker compose
docker image prune -a -f
docker volume prune -a -f

@REM Khởi tạo dự án (chạy lần đầu)
docker compose up -d

docker restart SQL-learning