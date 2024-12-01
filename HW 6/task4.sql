-- 1


SELECT DISTINCT restBill.cust_name
FROM restBill
WHERE bill_total > 450.00
AND EXISTS (
    SELECT 1
    FROM restRoom_management rrm
    JOIN restStaff rs ON rrm.headwaiter = rs.staff_no
    WHERE rs.first_name = 'Charles'
    AND rrm.room_date = restBill.bill_date
    AND rrm.room_name = (
        SELECT room_name
        FROM restRest_table
        WHERE table_no = restBill.table_no
    )
);

-- 2

SELECT rs.first_name, rs.surname
FROM restRoom_management rrm
JOIN restStaff rs ON rrm.headwaiter = rs.staff_no
WHERE rrm.room_date = 160111
AND rrm.room_name = (
    SELECT room_name
    FROM restRest_table
    WHERE table_no = (
        SELECT table_no
        FROM restBill
        WHERE cust_name = 'Nerida Smith' AND bill_date = 160111
    )
);

-- 3


SELECT cust_name
FROM restBill
WHERE bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

-- 4


SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (
    SELECT DISTINCT waiter_no
    FROM restBill
);

-- 5


SELECT rb.cust_name, rs.first_name AS headwaiter_first_name, rs.surname AS headwaiter_surname, rrm.room_name
FROM restBill rb
JOIN restRest_table rrt ON rb.table_no = rrt.table_no
JOIN restRoom_management rrm ON rrm.room_name = rrt.room_name AND rrm.room_date = rb.bill_date
JOIN restStaff rs ON rrm.headwaiter = rs.staff_no
WHERE rb.bill_total = (
    SELECT MAX(bill_total)
    FROM restBill
);
