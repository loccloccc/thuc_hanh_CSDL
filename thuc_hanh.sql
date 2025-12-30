create database thuc_hanh;

use thuc_hanh;

-- bang reader
create table Reader(
	reader_id int auto_increment primary key,
    reader_name varchar(100) not null,
    phone varchar(15) unique,
    register_date date default(current_date())
);

-- Book
create table Book(
	book_id int primary key,
    book_title varchar(150) not null ,
    author varchar(100),
    publish_year int check(publish_year >= 1900)
);

-- Borrow
create table Borrow(
	reader_id int,
    book_id int , 
    primary key(reader_id,book_id),
    foreign key(reader_id) references Reader(reader_id),
    foreign key(book_id) references Book(book_id),
    borrow_date date default(current_date()),
    return_date date
);

-- them cot email vao reader
alter table Reader add email varchar(100) unique;

-- sua author thanh varchar(150)
alter table Book modify author varchar(150);

-- them rang buoc return_date >= borrow_date
-- alter table Borrow modify return_date date check(retuen_date >= borrow_date);

-- them du lieu vao mang reader
insert into Reader values
(1,"Nguyen Van An","0901234567",'2024-09-01',"an@gmail.com"),
(2,"Trần Thị Bình","0912345678",'2024-09-05',"binh@gmail.com"),
(3,"Lê Minh Châu","0923456789",'2024-09-01',"chau.le@gmail.com");

-- them du lieu vao sach
insert into Book values 
(101,"Lập trình C căn bản","Nguyễn Văn A",2018),
(102 ,"Cơ sở dữ liệu","Trần Thị B",2020),
(103,"Lập trình Java","Lê Minh C",2019),
(104,"Hệ quản trị MySQL","Phạm Văn D",2021);

-- them du lieu muon sach
insert into Borrow values
(1,101,'2024-09-15',NULL),
(1,102,'2024-09-15','2024-09-25'),
(2,103,'2024-09-18',NULL);

-- cap nhat du lieu
-- update ●return_date thành 2024-10-01 cho tất cả các lượt mượn có reader_id = 1
update Borrow set return_date = '2024-10-01' where reader_id = 1;
-- update sacsh 
update Book set publish_year = 2023 where publish_year >= 2021;

-- ●Xóa các lượt mượn sách có borrow_date < '2024-09-18'
delete from Borrow where borrow_date < '2024-09-18';

-- lay tat ca
select *from  Reader;
select *from  Borrow;
select *from  Book;