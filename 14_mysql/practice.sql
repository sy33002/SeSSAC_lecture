create table member (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(5) not NULL,
    age int,
    gender VARCHAR(2) not NULL,
    email VARCHAR(50),
    promotion VARCHAR(2) DEFAULT 'x'
)

desc member;

ALTER Table member MODIFY id VARCHAR(10);
ALTER Table member drop age;
ALTER Table member add interest varchar(100);

CREATE Table user (
    id VARCHAR(10) not null PRIMARY KEY,
    pw VARCHAR(20) not NULL,
    name VARCHAR(5) not NULL,
    gender ENUM('F', 'M', '') DEFAULT '',
    birthday Date not null,
    age int(3) not null DEFAULT 0
 );

insert into user values
    ('hong1234', '8o4bkg', '홍길동', 'M', '1990-01-31', 33),
    ('sexysung','87awjkdf','성춘향','F','1992-03-31',31),
    ('power70','qxur8sda','변사또','M','1970-05-02',53),
    ('hanjo','jk48fn4','한조','M','1984-10-18',39),
    ('widowmaker','38ewifh3','위도우','F','1976-06-27',47),
    ('davadva','k3f3ah','송하나','F','2001-06-03',22),
    ('jungkrat','4ifha7f','정크랫','M','1999-11-11',24);

select * from user;

select * from user ORDER BY birthday asc;
select * from user where gender like "M"  ORDER BY name desc;
select id, name from user where birthday BETWEEN '1990-01-01' and '1999-12-31';
select * from user where birthday like '____-06%' ORDER BY birthday asc;
select * from user where gender like 'M' and birthday BETWEEN '1970-01-01' and '1979-12-31';
select * from user ORDER BY age desc LIMIT 3;
select * from user where age >= 25 and age <= 50;
update user set pw = '12345678' where id like 'hong1234';
delete from user where id like 'jungkrat';

-- < 실습 >
-- 아래 조건을 만족하는 SQL 문을 작성해주세요.
/*
authors, books, orders 이름을 갖는 3개의 테이블을 생성합니다. 
authors 테이블에는 author_id(기본 키), first_name, last_name 및 email의 4개 열이 있습니다. 
책 테이블에는 book_id(기본 키), title, author_id(작가 테이블에서 author_id 열을 참조하는 외부 키), publication_date의 네 개의 열이 있습니다. 
주문 테이블에는 order_id(기본 키), book_id(책 테이블의 book_id 열을 참조하는 외부 키), customer_name 및 order_date의 네 개의 열이 있습니다.

books 테이블의 author_id 컬럼은 authors 테이블의 author_id와 관계를 맺는다. 
(즉, 작가 테이블에 존재하는 작가만이 책 테이블에 데이터가 추가될 수 있다.)

orders 테이블의 book_id 컬럼은 books 테이블의 book_id와 관계를 맺는다. 
(즉, 책 테이블에 존재하는 책만이 주문 테이블에 데이터가 추가될 수 있다.)

*3가지 테이블의 자세한 정보는 추가 이미지를 참고할 것
*/

create table authors (
	author_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50)
);

desc authors;

create table books (
	book_id int primary key,
    title varchar(100),
    author_id int,
    publication_date date,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) on update cascade on delete cascade
);

desc books;

create table orders2 (
	order_id int primary key,
    book_id int,
    customer_name varchar(50),
    order_date date,
    FOREIGN KEY (book_id) REFERENCES books(book_id) on update cascade on delete cascade
);

desc orders;

-- < 실습 >
-- 직전 실습에서 생성한 authors, books, orders 테이블에 데이터를 추가하는 INSERT 문을 실행하고 각 번호에 맞는 SQL문을 작성해주세요.

-- Add data to the authors table
INSERT INTO authors (author_id, first_name, last_name, email)
VALUES (1, 'J.K.', 'Rowling', 'jkrowling@gmail.com'),
       (2, 'George R.R.', 'Martin', 'grmartin@yahoo.com'),
       (3, 'Stephen', 'King', 'sking@hotmail.com');

-- Add data to the books table
INSERT INTO books (book_id, title, author_id, publication_date)
VALUES (1, 'Harry Potter and the Philosopher''s Stone', 1, '1997-06-26'),
       (2, 'A Game of Thrones', 2, '1996-08-06'),
       (3, 'The Shining', 3, '1977-01-28');

-- Add data to the orders table
INSERT INTO orders2 (order_id, book_id, customer_name, order_date)
VALUES (1, 1, 'John Smith', '2022-02-15'),
       (2, 2, 'Jane Doe', '2022-02-16'),
       (3, 3, 'Bob Johnson', '2022-02-17');
       
SELECT * FROM authors;
drop table authors;
SELECT * FROM books;
drop table books;
SELECT * FROM orders2;
drop table orders2;
-- 1. author_id가 1인 작성자의 이메일을 jkrowling@yahoo.com으로 업데이트하는 SQL 문을 작성합니다.
update authors set email = 'jkrowling@yahoo.com' where author_id = 1;

-- 2. books 테이블에서 book_id 2인 책을 삭제하는 SQL 문을 작성합니다.
delete from orders2 where book_id = 2;
delete from books where book_id = 2;

-- 3. 다음 세부 정보가 포함된 새 책을 삽입하는 SQL 문을 작성합니다.
-- 책 ID: 4
-- 제목: The Stand
-- 저자 ID: 3
-- 발행일자 : 1978-01-01
insert into books values (4, 'The Stand', 3, '1978-01-01');

-- 4. book_id 1인 책의 출판 날짜를 1997-06-30으로 업데이트하는 SQL 문을 작성하십시오.
update books set publication_date = '1997-06-30' where book_id = 1;

-- 5. 022-02-17 이전에 접수된 모든 주문을 삭제하는 SQL 문을 작성합니다.
delete from orders2 where order_date >= '2022-02-17';

-- 6. 다음 세부 정보와 함께 새 주문을 삽입하는 SQL 문을 작성합니다.
-- 주문 ID: 4
-- 책 ID: 1
-- 고객 이름: Sarah Johnson
-- 주문일자 : 2022-02-18
insert into orders2 VALUES (4, 1, 'Sarah Johnson', '2022-02-18');

-- 7. order_id가 1인 주문의 고객 이름을 Jack Smith로 업데이트하는 SQL 문을 작성합니다.
update orders2 set customer_name = 'Jack Smith' where order_id = 1;

-- 8. 다음 세부 정보와 함께 새 작성자를 삽입하는 SQL 문을 작성합니다.
-- 저자 ID: 4
-- 이름: agatha
-- 성: christie
-- 이메일: agatha.christie@example.com
insert into authors VALUES(4, 'agatha', 'christie', 'agatha.christie@example.com');

-- 9. author_id 2인 작성자의 성을 Martinez로 업데이트하는 SQL 문을 작성합니다.
update authors set last_name = 'Martinez' where author_id = 2;

-- 10. author_id 3인 저자가 쓴 모든 책을 삭제하는 SQL 문을 작성합니다.
delete from books where author_id = 3;

