## **PHẦN 5: TRUY VẤN NÂNG CAO (ADVANCED SQL)**
1.  **Quản lý và nhân viên (Self-JOIN)** Hiển thị danh sách nhân viên gồm: `Tên nhân viên`, `Chức danh` và `Tên người quản lý trực tiếp` của họ (dựa trên cột `superior_emp_id`). Nếu nhân viên không có quản lý (Sếp tổng), hãy hiển thị là 'No Manager'.
2. **Thống kê khách hàng theo loại (Business vs Individual)** Đếm xem có bao nhiêu khách hàng là doanh nghiệp (`business`) và bao nhiêu khách hàng là cá nhân (`individual`). Kết quả trả về gồm 2 cột: `Loại khách hàng` và `Số lượng`.
3.  **Truy vấn con tương quan (Correlated Subquery)** Tìm tất cả các tài khoản (`account`) có số dư khả dụng (`avail_balance`) lớn hơn số dư trung bình của tất cả các tài khoản cùng loại sản phẩm (`product_cd`) đó.
4.  **Tìm chi nhánh "bận rộn" nhất** Tìm tên chi nhánh (`branch.name`) đã thực hiện nhiều giao dịch nhất (`acc_transaction`) trong lịch sử.
5.  **Phân tích dòng tiền theo ngày** Với mỗi ngày có giao dịch, hãy tính tổng số tiền gửi (giả sử `txn_type_cd = 'CDT'`) và tổng số tiền rút (giả sử `txn_type_cd = 'DBT'`). Kết quả gồm: `Ngày`, `Tổng gửi`, `Tổng rút`.
6. Lấy danh sách cust_id của cả khách hàng cá nhân và doanh nghiệp (từ customer và business).
7. **Tính số ngày giữa ngày mở tài khoản (`open_date`) và ngày hoạt động gần nhất (`last_activity_date`)** cho mỗi tài khoản. Hiển thị `account_id`, `open_date`, `last_activity_date`, và số ngày chênh lệch.
8. **Lấy các giao dịch được thực hiện trong tháng 12 năm 2004** (bất kỳ ngày nào). Hiển thị `txn_id`, `txn_date`, `amount`.
9. **Hiển thị tên đầy đủ của khách hàng cá nhân (`individual`) ở dạng "Họ, Tên"** (ví dụ: 'Hadley, James'). Sắp xếp theo họ.
10. **Tìm các nhân viên có tên (`first_name`) chứa ký tự 'e' và độ dài tên ít nhất 5 ký tự.**
11. **Trích xuất năm từ `open_date` của tài khoản và đếm số lượng tài khoản được mở theo từng năm.** Kết quả: `nam`, `so_luong`.

