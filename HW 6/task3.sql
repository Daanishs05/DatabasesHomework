-- 1


SELECT DISTINCT CONCAT(restStaff.first_name, ' ', restStaff.surname) AS waiter_name
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
WHERE restBill.cust_name = 'Tanya Singh';

-- 2


SELECT room_date
FROM restRoom_management
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restStaff.first_name = 'Charles' AND restRoom_management.room_name = 'Green'
AND room_date BETWEEN 160201 AND 160229;

-- 3


SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restStaff
WHERE restStaff.headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

-- 4


SELECT 
    restBill.cust_name, 
    restBill.bill_total, 
    CONCAT(restStaff.first_name, ' ', restStaff.surname) AS waiter_name
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
ORDER BY restBill.bill_total DESC;

-- 5


SELECT DISTINCT rs.first_name, rs.surname
FROM restBill rb
JOIN restStaff rs ON rb.waiter_no = rs.staff_no
WHERE rs.headwaiter IN (
    SELECT DISTINCT headwaiter
    FROM restBill rb2
    JOIN restStaff rs2 ON rb2.waiter_no = rs2.staff_no
    WHERE rb2.bill_no IN (14, 17)
);

-- 6


SELECT DISTINCT rs.first_name, rs.surname
FROM restRoom_management rrm
JOIN restStaff rs ON rrm.headwaiter = rs.staff_no OR rs.headwaiter = rrm.headwaiter
WHERE rrm.room_name = 'Blue' AND rrm.room_date = 160312;
