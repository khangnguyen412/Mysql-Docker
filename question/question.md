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


## **PHẦN 4: NÂNG CAO (SUBQUERY & LOGIC)**
1. **Nhân viên chưa bao giờ mở tài khoản:** Tìm `emp_id`, `first_name` của những nhân viên chưa từng thực hiện mở bất kỳ tài khoản nào (không xuất hiện trong cột `open_emp_id` của bảng `account`).
2. Tìm tất cả nhân viên làm việc trong cùng phòng ban với nhân viên có firstname là "sarah".
3. Tìm tất cả giao dịch có số tiền (amount) lớn hơn mức trung bình của tất cả các giao dịch.
4. **Tìm các nhân viên chưa từng được phân công làm `teller_emp_id` trong bất kỳ giao dịch nào** (không xuất hiện trong `acc_transaction.teller_emp_id`).
5. **Liệt kê các khách hàng (`cust_id`) có ít nhất 2 tài khoản** (đếm số lượng tài khoản trong bảng `account`).
6. **Tìm sản phẩm (`product_cd`) chưa từng được bất kỳ tài khoản nào sử dụng** (không xuất hiện trong `account.product_cd`).
7. **Lấy danh sách các chi nhánh (`branch`) có tổng số dư khả dụng của tài khoản lớn hơn 10,000** (sử dụng subquery trong `HAVING` hoặc `WHERE` với `SUM`).
8. **Tìm nhân viên có mức lương (không có sẵn, nhưng có thể giả sử) – thay vào đó: Tìm nhân viên có số lượng tài khoản do họ mở nhiều hơn bất kỳ nhân viên nào có `title = 'Teller'`.** (Sử dụng `ALL` hoặc `MAX` subquery).


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


## **PHẦN 6: CÁC TRUY VẤN SỬ DỤNG UNION, INTERSECT, EXCEPT (hoặc NOT IN)**
1. **Kết hợp danh sách `cust_id` của khách hàng cá nhân (`individual`) và khách hàng doanh nghiệp (`business`)**. Loại bỏ trùng lặp.
2. **Tìm các `cust_id` có trong bảng `customer` nhưng không có trong bảng `individual` cũng không trong `business`** (thực tế không thể xảy ra theo ràng buộc, nhưng hãy giả sử nếu có – để rèn luyện `NOT EXISTS`).
3. **Hiển thị danh sách tất cả `first_name` của nhân viên (`employee`) và tất cả `first_name` của khách hàng cá nhân (`individual`)**. Gộp chung và sắp xếp.
4. **Lấy danh sách `product_cd` vừa thuộc loại tài khoản ('account') vừa có ngày nghỉ hưu (`date_retired`) là `NULL`.** (Kết hợp điều kiện từ `product` và `product_type`).


## **PHẦN 7: WINDOW FUNCTIONS (MySQL 8.0+)**
1. **Xếp hạng các tài khoản theo `avail_balance` giảm dần trong toàn bộ hệ thống.** Hiển thị `account_id`, `avail_balance`, và `rank`.
2. **Phân hạng các tài khoản theo `avail_balance` trong từng loại sản phẩm (`product_cd`).** Hiển thị `product_cd`, `account_id`, `avail_balance`, và thứ hạng (dense_rank).
3. **Tính số dư khả dụng trung bình động (moving average) của 3 tài khoản liền kề theo `account_id`** (sắp xếp theo `account_id`). Hiển thị `account_id`, `avail_balance`, và trung bình trượt.
4. **Với mỗi nhân viên, tính tổng số tiền giao dịch mà họ thực hiện (`teller_emp_id`), đồng thời hiển thị tổng tích lũy (cumulative sum) theo thứ tự thời gian của giao dịch.** (Khó, cần join và window function).


## **PHẦN 8: CTE (Common Table Expression) & RECURSIVE**
1. **Sử dụng CTE để tìm tất cả nhân viên có mức lương (giả định) cao hơn mức lương trung bình của phòng ban họ.** (Cần tạo bảng lương giả định – nếu không thì thay bằng: tìm nhân viên có số lượng tài khoản mở được nhiều hơn trung bình của phòng ban).
2. **Viết CTE đệ quy để liệt kê cấp bậc quản lý của nhân viên có `emp_id = 1`** (ví dụ: Michael Smith) – hiển thị `emp_id`, `first_name`, `last_name`, cấp bậc (level).
3. **Sử dụng CTE để tách riêng khách hàng là cá nhân và doanh nghiệp, sau đó union lại và tính tổng số dư tài khoản của mỗi nhóm.** (Mỗi CTE tính tổng số dư riêng).