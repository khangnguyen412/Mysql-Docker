## **PHẦN 1: TRUY VẤN CƠ BẢN (SELECT, WHERE, ORDER BY)**
1. **Liệt kê nhân viên:** Lấy `first_name`, `last_name` và `title` của tất cả nhân viên có tiêu đề là 'Teller'. Sắp xếp theo `last_name` bảng chữ cái.
2. **Khách hàng ở thành phố lớn:** Tìm tất cả khách hàng (`customer`) có `city` là 'Salem' hoặc 'Waltham'.
3. **Tài khoản đang hoạt động:** Liệt kê `account_id`, `avail_balance` của các tài khoản có `status` là 'ACTIVE' và có số dư khả dụng (`avail_balance`) trên 2000.
4. **Mở rộng:** từ đó suy ra thứ tự thực thi (Logical Query Processing) đúng của các mệnh đề trong câu lệnh SELECT … FROM … WHERE… trên là gì
5. **Liệt kê các sản phẩm (`product`) còn đang được cung cấp** (chưa có `date_retired`). Hiển thị `product_cd`, `name`, `date_offered`.
6. **Tìm các giao dịch (`acc_transaction`) có số tiền `amount` nằm trong khoảng từ 100 đến 1000** (không bao gồm biên 1000). Sắp xếp theo `amount` giảm dần.
7. **Lấy danh sách nhân viên có `title` bắt đầu bằng chữ 'H'** (ví dụ: 'Head Teller'). Hiển thị `first_name`, `last_name`, `title`.
8. **Tìm các tài khoản (`account`) được mở vào năm 2004** (sử dụng `open_date`). Hiển thị `account_id`, `product_cd`, `open_date`.
9. **Đếm số lượng khách hàng (`customer`) có `postal_code` bắt đầu bằng '02'** (khu vực Massachusetts?).