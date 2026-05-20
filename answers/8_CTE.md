## PHẦN 8: CTE (Common Table Expression) & RECURSIVE
1. **Sử dụng CTE để tìm tất cả nhân viên có mức lương (giả định) cao hơn mức lương trung bình của phòng ban họ.** (Cần tạo bảng lương giả định – nếu không thì thay bằng: tìm nhân viên có số lượng tài khoản mở được nhiều hơn trung bình của phòng ban).
```sql
WITH dept_avg AS (
    SELECT e.dept_id, AVG(cnt) AS avg_open
    FROM (
        SELECT e.emp_id, e.dept_id, COUNT(a.account_id) AS cnt
        FROM employee e
        LEFT JOIN account a ON e.emp_id = a.open_emp_id
        GROUP BY e.emp_id, e.dept_id
    ) AS emp_counts
    GROUP BY e.dept_id
)
SELECT e.emp_id, e.first_name, e.last_name, COUNT(a.account_id) AS so_tk
FROM employee e
LEFT JOIN account a ON e.emp_id = a.open_emp_id
GROUP BY e.emp_id
JOIN dept_avg da ON e.dept_id = da.dept_id
HAVING COUNT(a.account_id) > da.avg_open;
```
2. **Viết CTE đệ quy để liệt kê cấp bậc quản lý của nhân viên có `emp_id = 1`** (ví dụ: Michael Smith) – hiển thị `emp_id`, `first_name`, `last_name`, cấp bậc (level).
```sql
WITH RECURSIVE emp_hierarchy AS (
    SELECT emp_id, first_name, last_name, superior_emp_id, 0 AS level
    FROM employee
    WHERE emp_id = 1
    UNION ALL
    SELECT e.emp_id, e.first_name, e.last_name, e.superior_emp_id, eh.level + 1
    FROM employee e
    JOIN emp_hierarchy eh ON e.superior_emp_id = eh.emp_id
)
SELECT * FROM emp_hierarchy;
```
3. **Sử dụng CTE để tách riêng khách hàng là cá nhân và doanh nghiệp, sau đó union lại và tính tổng số dư tài khoản của mỗi nhóm.** (Mỗi CTE tính tổng số dư riêng).
```sql
WITH individual_balance AS (
    SELECT c.cust_id, SUM(a.avail_balance) AS total_balance
    FROM customer c
    JOIN individual i ON c.cust_id = i.cust_id
    LEFT JOIN account a ON c.cust_id = a.cust_id
    GROUP BY c.cust_id
),
business_balance AS (
    SELECT c.cust_id, SUM(a.avail_balance) AS total_balance
    FROM customer c
    JOIN business b ON c.cust_id = b.cust_id
    LEFT JOIN account a ON c.cust_id = a.cust_id
    GROUP BY c.cust_id
)
SELECT 'Individual' AS type, SUM(total_balance) AS grand_total FROM individual_balance
UNION ALL
SELECT 'Business' AS type, SUM(total_balance) FROM business_balance;
```