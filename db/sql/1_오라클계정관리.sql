

sqlplus <아이디> ex) system/1234 -> 로그인 

alter user hr identified by hr account unlock; -> hn/hr 계정을 언락해주세요.

그후에는 sqlplus <아이디(hr)> 로 로그인이 가능하다.

conn hr/hr 하게 되면 그전에 계정 로그아웃되고 접속이 된다.

select * from tab;
select * from employees;


기본적인 테이블 스페이스 명령(관리자가 보낼수 있는 명령)
create TABLESPACE mc
datafile 'C:\oraclexe\app\oracle\oradata\XE\mc.dbf'
size 10M
autoextend on next 1M maxsize UNLIMITED;


drop TABLESPACE <FIILNAME> INCLOUDING CONTENTS AND Datafiles;


==================================
계정 생성과 삭제. (관리자)
==================================

create user test01 identified by 1234
create user <NAME> identified by <PASSWORD> 계정이름고 비밀번호 정하기.
default TABLESPACE mc;
default TABLESPACE <FILENAME>; 기본값일 파일 이름.

grant connect,resource,dba to test01; -> 권한부여 권한없이 접근할경우 접근되지않음.

revoke dba from test01; -> dba 권한만 뺏음. 커넥트 권한은 있음.
revoke connect from test01; ->  connect 권한마저 뺏어버림

drop user test01 cascade; -> test01 삭제 뒤의 cascade 는 강제성을줌

==========================
SCOTT/TIGER 계정 생성
==========================
create user SCOTT identified by TIGER
default TABLESPACE mc;

@c:\lib\scott.sql; -> sql파일 안에 있는 모든 명령어를 실행하는 명령어 : @

set linesize 300;
set pagesize 20;

select * from emp; -> emp table 에 있는 데이터들 보여주세요

select * from Book;

PRIMARY KEY 절대 중복되지 않는 값. PK (not null)
FOREIGN KEY 존재하는 키값으로 설정해주는 것. FK(null 가능)
FK 는 다른곳의 PK 여야 한다. 꼬리에 꼬리를 물고