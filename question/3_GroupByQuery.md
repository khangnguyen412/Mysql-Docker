## **PHẦN 3: TỔNG HỢP DỮ LIỆU (GROUP BY, HAVING)**
1. **Thống kê số dư theo chi nhánh:** Tính tổng số dư khả dụng (`avail_balance`) của tất cả tài khoản theo từng chi nhánh (`open_branch_id`).
2. **Tìm khách hàng VIP:** Liệt kê các khách hàng (`cust_id`) có tổng số dư trong tất cả các tài khoản của họ lớn hơn 5000.
3. **Đếm giao dịch:** Tìm những tài khoản (`account_id`) có nhiều hơn 5 giao dịch được thực hiện trong năm 2025.
4. Tính số lượng nhân viên trong từng phòng ban (department_id) và chỉ hiển thị các phòng ban có trên 5 nhân viên.
5. **Tính tổng số dư khả dụng (`avail_balance`) trung bình cho mỗi loại sản phẩm (`product_cd`)**. Chỉ hiển thị các loại sản phẩm có số dư trung bình > 2000.
6. **Đếm số lượng tài khoản (`account`) được mở bởi từng nhân viên (`open_emp_id`)**. Sắp xếp theo số lượng giảm dần, chỉ lấy top 5 nhân viên mở nhiều tài khoản nhất.
7. **Tìm tổng số tiền giao dịch (`amount`) theo từng loại giao dịch (`txn_type_cd`)**. Kết quả gồm: `txn_type_cd`, `total_amount`.
8. **Với mỗi chi nhánh (`branch`), tính số lượng nhân viên đang làm việc** (dựa vào `assigned_branch_id` trong `employee`). Hiển thị tên chi nhánh và số lượng.
9. **Tìm tháng (năm + tháng) có nhiều giao dịch nhất** (chỉ cần số lượng giao dịch). Hiển thị tháng (dạng 'YYYY-MM') và tổng số giao dịch.
