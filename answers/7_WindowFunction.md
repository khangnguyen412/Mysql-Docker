## PHẦN 7: WINDOW FUNCTIONS (MySQL 8.0+)
1. **Xếp hạng các tài khoản theo `avail_balance` giảm dần trong toàn bộ hệ thống.** Hiển thị `account_id`, `avail_balance`, và `rank`.
```sql
SELECT account_id, avail_balance, RANK() OVER (ORDER BY avail_balance DESC) AS rank_balance
FROM account;
```
2. **Phân hạng các tài khoản theo `avail_balance` trong từng loại sản phẩm (`product_cd`).** Hiển thị `product_cd`, `account_id`, `avail_balance`, và thứ hạng (dense_rank).
```sql
SELECT product_cd, account_id, avail_balance, DENSE_RANK() OVER (PARTITION BY product_cd ORDER BY avail_balance DESC) AS rank_in_product
FROM account;
```
3. **Tính số dư khả dụng trung bình động (moving average) của 3 tài khoản liền kề theo `account_id`** (sắp xếp theo `account_id`). Hiển thị `account_id`, `avail_balance`, và trung bình trượt.
```sql
SELECT account_id, avail_balance, AVG(avail_balance) OVER (ORDER BY account_id ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS moving_avg
FROM account;
```
4. **Với mỗi nhân viên, tính tổng số tiền giao dịch mà họ thực hiện (`teller_emp_id`), đồng thời hiển thị tổng tích lũy (cumulative sum) theo thứ tự thời gian của giao dịch.** (Khó, cần join và window function).
```sql
SELECT e.emp_id, e.first_name, e.last_name, at.txn_date, at.amount, SUM(at.amount) OVER (PARTITION BY e.emp_id ORDER BY at.txn_date) AS cumulative_sum
FROM employee e
JOIN acc_transaction at ON e.emp_id = at.teller_emp_id
ORDER BY e.emp_id, at.txn_date;
```
