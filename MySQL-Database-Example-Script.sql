select * from employee e;
select * from acc_transaction at2 ;

-- Giả sử bạn có 2 bảng employees và departments. Hãy viết câu SQL để lấy danh sách tất cả nhân viên, cùng với tên phòng ban của họ, kể cả nhân viên chưa được phân phòng.
select * from employee e LEFT JOIN department d  ON e.dept_id  = d.dept_id

-- Tính số lượng nhân viên trong từng phòng ban (department_id) và chỉ hiển thị các phòng ban có trên 5 nhân viên.
select dept_id, count(*) from employee e GROUP BY dept_id HAVING count(*) > 5;

-- Tìm tất cả nhân viên làm việc trong cùng phòng ban với nhân viên có firstname là "sarah".
select * from employee e WHERE e.dept_id = (select dept_id FROM employee e2  WHERE first_name like "sarah");
-- Tìm tất cả giao dịch có số tiền (amount) lớn hơn mức trung bình của tất cả các giao dịch.
select * from acc_transaction at2 WHERE at2.amount > (select AVG(amount) FROM acc_transaction at3);

-- Lấy danh sách cust_id của cả khách hàng cá nhân và doanh nghiệp (từ customer và business).
select cust_id, fed_id  from customer c UNION SELECT cust_id, state_id  FROM  business b 