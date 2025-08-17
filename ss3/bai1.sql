create database quan_ly_sinh_vien;
USE quan_ly_sinh_vien;

CREATE TABLE class (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL,
    start_date DATETIME NOT NULL,
    status BIT
);

CREATE TABLE student (
    student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    status BIT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class (class_id)
);

CREATE TABLE subject (
    sub_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (credit >= 1),
    status BIT DEFAULT 1
);

CREATE TABLE mark (
    mark_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id , student_id),
    FOREIGN KEY (sub_id) REFERENCES subject (sub_id),
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);

-- Thêm dữ liệu
INSERT INTO class (class_name, start_date, status)
VALUES 
('CNTT1', '2023-09-01', 1),
('CNTT2', '2023-09-05', 1),
('QTKD1', '2023-09-10', 0);

INSERT INTO student (student_name, address, phone, status, class_id)
VALUES
('Nguyen Van Hung', 'Ha Noi', '0905123456', 1, 1),
('Tran Thi Han', 'Da Nang', '0912345678', 1, 1),
('Ho Van Cai', 'Hue', '0923456789', 0, 2),
('Hoang Thi Dam', 'Sai Gon', '0934567890', 1, 3);

INSERT INTO subject (sub_name, credit, status)
VALUES
('Lap trinh Java', 3, 1),
('Co so du lieu', 3, 1),
('Marketing', 2, 1),
('Triet hoc', 2, 0);

INSERT INTO mark (sub_id, student_id, mark, exam_times)
VALUES
(1, 1, 85, 1),   -- Hung học Java
(2, 1, 90, 1),   -- Hung học CSDL
(1, 2, 75, 1),   -- Han học Java
(3, 3, 88, 1),   -- Cai học Marketing
(4, 4, 65, 2);   -- Dam học Triết

-- Hiển thị tất cả các sinh viên có tên bắt đầu bằng ký tự ‘H’
SELECT * 
FROM student
WHERE student_name LIKE 'H%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
SELECT * 
FROM class
WHERE MONTH(start_date) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
SELECT * 
FROM subject
WHERE credit BETWEEN 3 AND 5;

-- Thay đổi mã lớp (class_id) của sinh viên có tên chứa 'Hung' thành 2
UPDATE student
SET class_id = 2
WHERE student_name LIKE '%Hung%';

-- Hiển thị danh sách điểm
SELECT s.student_name, sub.sub_name, m.mark
FROM mark m
JOIN student s ON m.student_id = s.student_id
JOIN subject sub ON m.sub_id = sub.sub_id
ORDER BY m.mark DESC, s.student_name ASC;
