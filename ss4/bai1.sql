use quan_ly_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from subject
where credit = (select max(credit) from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.sub_id, s.sub_name, status, mark_id, mark
from subject s
join mark m
on s.sub_id = m.mark_id
where m.mark = (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.student_id, s.student_name, avg(m.mark) as avg_mark
from student s
join mark m
on s.student_id = m.mark_id
group by s.student_name, s.student_id
order by avg_mark desc;