## **PHẦN 7: WINDOW FUNCTIONS (MySQL 8.0+)**
1. **Xếp hạng các tài khoản theo `avail_balance` giảm dần trong toàn bộ hệ thống.** Hiển thị `account_id`, `avail_balance`, và `rank`.
2. **Phân hạng các tài khoản theo `avail_balance` trong từng loại sản phẩm (`product_cd`).** Hiển thị `product_cd`, `account_id`, `avail_balance`, và thứ hạng (dense_rank).
3. **Tính số dư khả dụng trung bình động (moving average) của 3 tài khoản liền kề theo `account_id`** (sắp xếp theo `account_id`). Hiển thị `account_id`, `avail_balance`, và trung bình trượt.
4. **Với mỗi nhân viên, tính tổng số tiền giao dịch mà họ thực hiện (`teller_emp_id`), đồng thời hiển thị tổng tích lũy (cumulative sum) theo thứ tự thời gian của giao dịch.** (Khó, cần join và window function).