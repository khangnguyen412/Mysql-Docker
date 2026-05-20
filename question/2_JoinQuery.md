## **PHẦN 2: TRUY VẤN CÓ KẾT NỐI (JOIN)**
1. **Chi tiết tài khoản:** Hiển thị `account_id`, `avail_balance` cùng với `first_name` và `last_name` của khách hàng cá nhân (`individual`) sở hữu tài khoản đó.
2. **Chi nhánh và nhân viên:** Liệt kê tên chi nhánh (`branch.name`) và tên đầy đủ của các nhân viên làm việc tại chi nhánh đó.
3. **Giao dịch của tài khoản:** Hiển thị 10 giao dịch gần đây nhất (`acc_transaction`), bao gồm: `txn_id`, `txn_date`, `amount` và tên loại sản phẩm (`product.name`) của tài khoản thực hiện giao dịch đó.
4. Giả sử bạn có 2 bảng employees và departments. Hãy viết câu SQL để lấy danh sách tất cả nhân viên, cùng với tên phòng ban của họ, kể cả nhân viên chưa được phân phòng.
5. **Hiển thị thông tin chi tiết của giao dịch:** `txn_id`, `txn_date`, `amount`, tên nhân viên giao dịch (`employee.first_name`, `employee.last_name`) và tên chi nhánh thực hiện giao dịch (`branch.name`).
6. **Liệt kê tất cả các khách hàng (`customer`) cùng với thông tin cá nhân nếu có** (từ bảng `individual`) **hoặc thông tin doanh nghiệp nếu có** (từ bảng `business`). Gợi ý: sử dụng `LEFT JOIN` với cả hai bảng.
7. **Tìm tất cả nhân viên và cấp trên của họ** (self-join trên `employee`), hiển thị `(emp_first, emp_last, superior_first, superior_last)`. Nếu không có cấp trên thì hiển thị `NULL`.
8. **Hiển thị danh sách tài khoản (`account`) cùng với tên sản phẩm (`product.name`) và tên khách hàng** (lấy từ `customer` bảng, không phân biệt loại khách hàng). Không cần thông tin chi tiết cá nhân/doanh nghiệp.
9. **Tìm các giao dịch được thực hiện bởi nhân viên có `title` là 'Teller'** và số tiền giao dịch > 200. Hiển thị `txn_id`, `amount`, tên nhân viên.