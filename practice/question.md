## **PHẦN 1: TRUY VẤN CƠ BẢN (SELECT, WHERE, ORDER BY)**

1. **Liệt kê nhân viên:** Lấy `first_name`, `last_name` và `title` của tất cả nhân viên có tiêu đề là 'Teller'. Sắp xếp theo `last_name` bảng chữ cái.
2. **Khách hàng ở thành phố lớn:** Tìm tất cả khách hàng (`customer`) có `city` là 'Salem' hoặc 'Waltham'.
3. **Tài khoản đang hoạt động:** Liệt kê `account_id`, `avail_balance` của các tài khoản có `status` là 'ACTIVE' và có số dư khả dụng (`avail_balance`) trên 2000.
4. **Mở rộng:** từ đó suy ra thứ tự thực thi (Logical Query Processing) đúng của các mệnh đề trong câu lệnh SELECT … FROM … WHERE… trên là gì

## **PHẦN 2: TRUY VẤN CÓ KẾT NỐI (JOIN)**

1. **Chi tiết tài khoản:** Hiển thị `account_id`, `avail_balance` cùng với `first_name` và `last_name` của khách hàng cá nhân (`individual`) sở hữu tài khoản đó.
2. **Chi nhánh và nhân viên:** Liệt kê tên chi nhánh (`branch.name`) và tên đầy đủ của các nhân viên làm việc tại chi nhánh đó.
3. **Giao dịch của tài khoản:** Hiển thị 10 giao dịch gần đây nhất (`acc_transaction`), bao gồm: `txn_id`, `txn_date`, `amount` và tên loại sản phẩm (`product.name`) của tài khoản thực hiện giao dịch đó.
4. Giả sử bạn có 2 bảng employees và departments. Hãy viết câu SQL để lấy danh sách tất cả nhân viên, cùng với tên phòng ban của họ, kể cả nhân viên chưa được phân phòng.


## **PHẦN 3: TỔNG HỢP DỮ LIỆU (GROUP BY, HAVING)**

1. **Thống kê số dư theo chi nhánh:** Tính tổng số dư khả dụng (`avail_balance`) của tất cả tài khoản theo từng chi nhánh (`open_branch_id`).
2. **Tìm khách hàng VIP:** Liệt kê các khách hàng (`cust_id`) có tổng số dư trong tất cả các tài khoản của họ lớn hơn 5000.
3. **Đếm giao dịch:** Tìm những tài khoản (`account_id`) có nhiều hơn 5 giao dịch được thực hiện trong năm 2025.
4. Tính số lượng nhân viên trong từng phòng ban (department_id) và chỉ hiển thị các phòng ban có trên 5 nhân viên.

## **PHẦN 4: NÂNG CAO (SUBQUERY & LOGIC)**

1. **Nhân viên chưa bao giờ mở tài khoản:** Tìm `emp_id`, `first_name` của những nhân viên chưa từng thực hiện mở bất kỳ tài khoản nào (không xuất hiện trong cột `open_emp_id` của bảng `account`).
2. Tìm tất cả nhân viên làm việc trong cùng phòng ban với nhân viên có firstname là "sarah".
3. Tìm tất cả giao dịch có số tiền (amount) lớn hơn mức trung bình của tất cả các giao dịch.

## **PHẦN 5: TRUY VẤN NÂNG CAO (ADVANCED SQL)**

1.  **Quản lý và nhân viên (Self-JOIN)** Hiển thị danh sách nhân viên gồm: `Tên nhân viên`, `Chức danh` và `Tên người quản lý trực tiếp` của họ (dựa trên cột `superior_emp_id`). Nếu nhân viên không có quản lý (Sếp tổng), hãy hiển thị là 'No Manager'.
2. **Thống kê khách hàng theo loại (Business vs Individual)** Đếm xem có bao nhiêu khách hàng là doanh nghiệp (`business`) và bao nhiêu khách hàng là cá nhân (`individual`). Kết quả trả về gồm 2 cột: `Loại khách hàng` và `Số lượng`.
3.  **Truy vấn con tương quan (Correlated Subquery)** Tìm tất cả các tài khoản (`account`) có số dư khả dụng (`avail_balance`) lớn hơn số dư trung bình của tất cả các tài khoản cùng loại sản phẩm (`product_cd`) đó.
4.  **Tìm chi nhánh "bận rộn" nhất** Tìm tên chi nhánh (`branch.name`) đã thực hiện nhiều giao dịch nhất (`acc_transaction`) trong lịch sử.
5.  **Phân tích dòng tiền theo ngày** Với mỗi ngày có giao dịch, hãy tính tổng số tiền gửi (giả sử `txn_type_cd = 'CDT'`) và tổng số tiền rút (giả sử `txn_type_cd = 'DBT'`). Kết quả gồm: `Ngày`, `Tổng gửi`, `Tổng rút`.
6. Lấy danh sách cust_id của cả khách hàng cá nhân và doanh nghiệp (từ customer và business).