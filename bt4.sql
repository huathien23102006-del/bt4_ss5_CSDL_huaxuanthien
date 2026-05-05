-- cách 1:
SELECT *
FROM Orders
WHERE status = 'FAILED'
AND (
    reason = 'KHACH_HUY'
    OR reason = 'QUAN_DONG_CUA'
    OR reason = 'KHONG_CO_TAI_XE'
    OR reason = 'BOM_HANG'
);

-- cách 2
SELECT *
FROM Orders
WHERE status = 'FAILED'
AND reason IN (
    'KHACH_HUY',
    'QUAN_DONG_CUA',
    'KHONG_CO_TAI_XE',
    'BOM_HANG'
);

-- so sánh: 
-- Code sạch:
-- OR: code dài, rối khi có nhiều điều kiện
-- in: Ngắn gọn dễ đọc
-- Mở rộng (lọc 20 nguyên nhân):
-- OR: viết dài dễ sai
-- in: thêm list
-- hiệu năng: 
-- OR: kém hơn khi nhiều OR
-- IN: Thường tối ưu tốt hơn (engine xử lý như set)

-- nếu backend truyền xuống mảng rỗng VD: reason = []
-- SQL sẽ thành WHERE reason IN () => Lỗi SYNTAX

-- Cách chặn:
-- if (reasons.length === 0) {return [];}

-- SQL truy vấn em cho là giải pháp tốt nhất: 
SELECT *
FROM Orders
WHERE status = 'FAILED'
AND reason IN ('KHACH_HUY', 'QUAN_DONG_CUA', 'KHONG_CO_TAI_XE', 'BOM_HANG');