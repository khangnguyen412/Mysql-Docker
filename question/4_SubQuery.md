## **PHẦN 4: NÂNG CAO (SUBQUERY & LOGIC)**
1. **Nhân viên chưa bao giờ mở tài khoản:** Tìm `emp_id`, `first_name` của những nhân viên chưa từng thực hiện mở bất kỳ tài khoản nào (không xuất hiện trong cột `open_emp_id` của bảng `account`).
2. Tìm tất cả nhân viên làm việc trong cùng phòng ban với nhân viên có firstname là "sarah".
3. Tìm tất cả giao dịch có số tiền (amount) lớn hơn mức trung bình của tất cả các giao dịch.
4. **Tìm các nhân viên chưa từng được phân công làm `teller_emp_id` trong bất kỳ giao dịch nào** (không xuất hiện trong `acc_transaction.teller_emp_id`).
5. **Liệt kê các khách hàng (`cust_id`) có ít nhất 2 tài khoản** (đếm số lượng tài khoản trong bảng `account`).
6. **Tìm sản phẩm (`product_cd`) chưa từng được bất kỳ tài khoản nào sử dụng** (không xuất hiện trong `account.product_cd`).
7. **Lấy danh sách các chi nhánh (`branch`) có tổng số dư khả dụng của tài khoản lớn hơn 10,000** (sử dụng subquery trong `HAVING` hoặc `WHERE` với `SUM`).
8. **Tìm nhân viên có mức lương (không có sẵn, nhưng có thể giả sử) – thay vào đó: Tìm nhân viên có số lượng tài khoản do họ mở nhiều hơn bất kỳ nhân viên nào có `title = 'Teller'`.** (Sử dụng `ALL` hoặc `MAX` subquery).

