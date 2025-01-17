[예제 3-1] 전체 정보 조회 
employees 테이블의 모든 정보를 출력하세요.

SELECT *
  FROM employees



[예제 3-2] 원하는 열만 조회 
employees 테이블에서 employee_id, first_name, last_name을 
출력하세요.
SELECT employee_id,first_name,last_name
  FROM employees;

[예제 3-3]  원하는 열만 조회후 정렬
employees 테이블에서 employee_id, first_name, last_name을 
employee_id를 기준으로 내림차순으로 출력하세요. 

SELECT employee_id, first_name, last_name
  FROM employees
  ORDER BY employee_id DESC;

[예제 3-4]  결과에서 중복값 제외 
employees 테이블에서 중복 값이 생기지 않도록 job_id를 출력하세요. 

SELECT distinct job_id
  FROM employees;
  
[예제 3-5] 별칭 사용
employees 테이블에서 employee_id는  사원번호 , first_name은 이름, 
last_name은 성으로 출력하세요 

SELECT employee_id AS 사원번호, FIRST_NAME AS 이름, LAST_NAME AS 성
  FROM EMPLOYEES
       

[예제 3-6] 연결 연산자
employees 테이블에서 employee_id를 출력하고 first_name과 last_name을 
붙여서 출력하세요. 

SELECT EMPLOYEE_ID, CONCAT(FIRST_NAME,LAST_NAME)
  FROM employees;


[예제 3-7] 연결 연산자 
employees 테이블에서 employee_id를 출력하고 first_name과 last_name을 붙여서 출력,
 email에 “@company.com”을 붙여서 출력 하세요 

SELECT EMPLOYEE_ID, CONCAT(FIRST_NAME,"-",LAST_NAME), CONCAT(EMAIL,"@COMPANY.COM")
  FROM employees;
#이메일에 따음표 붙여 하는 이유 물어보기

[예제 3-8] 산술처리
employees 테이블에서 employee_id, salary, salary에 500을 더한값, 
100을 뺀값, 10%를 추가해서 2로 나눈 값을 출력 

SELECT EMPLOYEE_ID, SALARY, SALARY+500, SALARY-100, (SALARY*1.1)/2
  FROM employees;

[예제 3-9] 산술처리
employees 테이블에서 employee_id를 사원번호, salary를 급여, 
salary에 500을 더한값을 추가급여, 100을 뺀값을 인하급여, 
10%를 추가해서 2로 나눈 값을 조정급여로  출력 

SELECT employee_id AS 사원번호, salary AS 급여, salary+500 AS 추가급여, salary-100 AS 인하급여, (salary*1.1)/2 AS 조정급여
  FROM employees;
  
  
  
[예제 3-10] WHERE 조건절 비교 연산자
employees 테이블에서 employee_id가 100인 직원 정보를 출력


SELECT *
  FROM employees
  WHERE employee_id = 100;


[예제 3-11] WHERE 조건절 비교 연산자
employees 테이블에서 first_name이 David인 직원 정보를 출력
추가 문제 sa rep인 사람 뽑아내기

SELECT *
  FROM employees
  WHERE first_name = "david"
    AND job_id = "sa_rep";    

[예제 3-12] WHERE 조건절 비교 연산자 
employees 테이블에서 employee_id가 105 이상인 직원 정보를 출력

SELECT *
  FROM employees
  WHERE employee_id >= 105;

[예제 3-13] WHERE 조건절 BETWEEN 연산자
employees 테이블에서 salary가 10,000 이상이고 
20,000 이하인 직원 정보를 출력

SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;


SELECT *
  FROM employees
  WHERE salary >= 10000
  AND  salary <= 20000
# 추가 문제 입사일이 1월인 직원을 출력하라
#정답
SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;
  AND MONTH(hire_date) = "01";

SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;
  AND SUBSTR(hire_Date,6,2)="01";



[예제 3-14] WHERE 조건절 IN  연산자
employees 테이블에서 salary가 10000, 17000, 24000인 직원 정보를 출력
SELECT *
 FROM employees
 WHERE salary = 10000
    OR salary = 17000
    OR salary = 24000;


SELECT *
  FROM employees
  WHERE salary IN (10000,17000,24000);
  
#추가 문제 FARST_NAME이 NEENA와 같은 SALARY를 받는 직원은?
SELECT *
 FROM employees
 WHERE salary IN ( SELECT SALARY 
                     FROM EMPLOYEES
							WHERE FIRST_NAME = "NEENA");

#추가 문제 JOB_id it_prog의 평균 salary 보다 많이 받는 직원은?

SELECT *
  FROM employees
  WHERE salary >= (SELECT AVG(salary) 
                     FROM employees
                     WHERE job_id = "it_prog");


# JOB_ID별 평균 SALARY를 구하고 내림차순으로 조회
SELECT job_ID, AVG(SALARY)
  FROM employees
  GROUP BY JOB_ID 
  ORDER BY AVG(SALARY) DESC;

[예제 3-15] WHERE 조건절 LIKE  연산자
employees 테이블에서 job_id값이 AD로 시작하는 모든 데이터를 조회

SELECT *
  FROM employees
  WHERE job_id LIKE ("ad%");

[예제 3-16] WHERE 조건절 LIKE  연산자
employees 테이블에서 job_id값이 AD로 시작하는 모든 데이터를 조회

SELECT *
  FROM employees
  WHERE job_id LIKE ("ad%");

employees 테이블에서 first_name이 Le로 시작하는 모든 데이터를 조회

SELECT *
  FROM employees
  WHERE first_name LIKE ("le%");
  
employees 테이블에서 first_name에 ame가 들어있는 모든 데이터를 조회

SELECT *
  FROM employees
  WHERE first_name LIKE ("%ame%");
  
employees 테이블에서 first_name이  in으로 끝나는 모든 데이터를 조회

SELECT *
  FROM employees
  WHERE first_name LIKE ("%IN");
  
employees 테이블에서 job_id가 AD로 시작하면서 5자인 데이터 값을 갖는 직원 정보를 조회

SELECT *
  FROM employees
  WHERE JOB_ID LIKE "AD___";
  
[예제 3-17]  ) WHERE 조건절 NULL 
employees 테이블에서 manager_id가 null 값인 직원 정보를 출력

SELECT *
  FROM employees
  WHERE MANAGER_ID = "NULL";
  
#실습 employees, manager_id가 NULL인데이터 3건을 추가하고
## EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID,로 구하고
# 210, "A111", "B111","2021-07-03,"dt"
## 211, "A222", "B222","2021-07-04."dt"
# 211 ,"a333","b333","2021-07-03","dt"

INSERT INTO employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID)
VALUES (210, "A111", "B111","2021-07-03",'dt');
INSERT INTO employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID)
VALUES (211, "A222", "B222","2021-07-04","dt");
INSERT INTO employees (EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID)
VALUES (212, "A333", "B333","2021-07-03","dt");

정답 SELECT *
 FROM employees
 WHERE manager_id IS NULL;
  
[예제 3-18] WHERE 조건절 논리 연산자(and)
employees 테이블에서 salary가 4000을 초과하면서,
 job_id가 IT_PROG인 직원을 조회

SELECT *
  FROM EMPLOYEES
  WHERE SALARY > 4000
  AND JOB_ID = ("IT_PROG");

[예제 3-19] WHERE 조건절 논리 연산자(and,or)
employees 테이블에서 salary가 4000을 초과하면서,
 job_id가 IT_PROG이거나 FL_ACCOUNT인 직원을 조회

정담
SELECT *
  FROM EMPLOYEES
  WHERE SALARY > 4000
  AND JOB_ID = "IT_PROG" 
  OR  job_id = "fl_account";
  
SELECT *
  FROM EMPLOYEES
  WHERE SALARY > 4000
  AND JOB_ID IN ( "IT_PROG","fl_account");
  
 
## part3  
[예제 3-20] WHERE 조건절 부정 연산자
employees 테이블에서 employee_id <> 105가 아닌 직원을 조회

SELECT *
  FROM employees
  WHERE employee_id <> 105;

[예제 3-21] WHERE 조건절 부정 연산자
employees 테이블에서 manager_id가 null이 아닌 직원을 조회

SELECT *
  FROM employees
  WHERE manager_id IS NOT NULL ;
  
[4장] 함수로 데이터 쉽게 가공하기 

[예제 4-1] 문자타입 함수(lower, upper)  
employees 테이블에서 last_name을 소문자와 대문자로 각각 출력

SELECT LAST_name, LOWER(last_name), UPPER(last_name)
 FROM employees;






[예제 4-2] 문자타입 함수(substr) 
employees 테이블에서 job_id의 앞에서 2개의 문자열을 출력
   (before, after) 
   
SELECT job_id, SUBSTR(job_id,1,2)
  FROM employees
   

[예제 4-3] 문자타입 함수(replace) 
employees 테이블에서 job_id 값이 ACCOUNT면 ACCNT로 출력
    (before, after) 

SELECT job_id, REPLACE(job_id, 'account', ' accnt')
  FROM employees
 WHERE job_id = 'FI_account';
 
 
[예제 4-4] 문자타입 함수(lpad, rpad) 
employees 테이블에서 first_name에 대해 12자리의 문자열 자리를 만들되 
first_name의 데이터 값이 12자리보다 작으면 왼쪽에서 부터 *를 채워서 출력


SELECT first_name, LPAD(first_name,12,'*'), RPAD(first_name,12,'$')
  FROM employees;

[예제 4-5] 숫자 타입 함수(round) 
employees 테이블에서 salary를 30일로 나눈 후 나눈 값의 소수점 첫째 자리, 
소수점 둘째 자리, 정수 첫째 자리에서 반올림한 각각의 값을 출력

# salary, 소수점 첫째, 둘째, 정수첫째

SELECT SALARY, SALARY/30, ROUND(SALARY/30,0), ROUND(SALARY/30,1), ROUND(SALARY/30,2), ROUND(SALARY/30,-1)
  FROM EMPLOYEES
  
  
[예제 4-6] 숫자 타입 함수(round) 
employees 테이블에서 salary를 30일로 나눈 후 나눈 값의 소수점 첫째 자리, 
소수점 둘째 자리, 정수 첫째 자리에서 반올림한 각각의 값을 출력

SELECT SALARY, SALARY/30, ROUND(SALARY/30,0), truncate(SALARY/30,1), ROUND(SALARY/30,2), ROUND(SALARY/30,-1)
  FROM EMPLOYEES
  
#ROUND 는 반올림
#TRUNCATE 는 버림


[예제 4-7] 숫자 절삭하기
employees테이블에서 salary를 30일로 나누고 나눈 값의 소수점 첫째 자리, 
소수점 둘째 자리, 정수 첫째 자리에서 절삭하여 출력하세요. 
SELECT SALARY, SALARY/30, ROUND(SALARY/30,0), truncate(SALARY/30,1), truncate(SALARY/30,2), truncate(SALARY/30,-1)
  FROM EMPLOYEES
  


4.2.3 날짜 연산
오늘날짜, 다음날짜, 이전날짜, 두날짜 빼기 


[예제 4-8] 두 날짜 사이의 개월수 계산
employees 테이블에서 department_id가 100인 직원에 대해 오늘 날짜, 
hire_date, 오늘날짜와 hire_date사이의 개월수를 출력 

SELECT SYSDATE(), hire_date, 
       TIMESTAMPDIFF (month,hire_date,SYSDATE())
  from employees
  WHERE department_id = 100;
  

  

[예제 4-9] 월에 날짜 더하기 
employees 테이블에서 department_id가 100과 106사이인 직원의
hire_date에 3개월을 더한 값, hire_date에 3개월을 뺀 값을 출력 


SELECT hire_date, DATE_ADD(hire_date, INTERVAL 3 MONTH),
                  DATE_ADD(hire_date, INTERVAL -3 MONTH)
  from employees
  WHERE department_id BETWEEN 100 AND 106;

[예제 4-10] 돌아오는 요일의 날짜 계산
employees테이블에서 employee_id가 100과 106사이의 직원의 
입사 다음날, 입사 6일후 날짜를 출력


[예제 4-11] 월의 마지막 날짜 계산 
employees테이블에서 employee_id가 100과 106사이인 직원의 
hire_date를 기준으로 해당월의 마지막 날짜를 출력 

SELECT hire_Date, LAST_DAY(hire_Date)
  FROM employees
  WHERE employee_id BETWEEN 100 AND 106;
  
  
4.2.4 데이터 변환 

[예제 4-13] NULL값 처리 
employees테이블에서 salary에 commission_pct를 곱하되, 
commission_pct가 NULL일 때에는 1로 치환하여 commission_pct를 곱한 
결과를 출력 (employee_id, salary, commission_pct, salary_new) 

SELECT employee_id, salary, commission_pct, salary_new = salary+(salary * commission_pct)
  FROM employees

SELECT employee_id, salary, commission_pct,
       case
		     when commission_pct = 0 then salary
			  ELSE (salary+salary*commission_pct)
		 END AS salary_new
  FROM employees
  ORDER BY commission_pct DESC;
  
  
[예제 4-14] 조건논리 처리 
employees테이블에서first_name, last_name, department_id, salary를 
출력하되 department_id 가 60인 경우에는 급여를 10% 인상한 값을 계산하여 출력하고,
나머지 경우에는 원래의 값을 출력하세요.  그리고 department_id가 60인 경우에는
'10%인상'을 출력하고 나머지 경우네는 '미인상'을 출력하세요. 

SELECT first_name, last_name, department_id, salary,
       case department_id
            when 60 then salary*1.1 
            ELSE salary
       END AS salary_new,
       case department_id
            when 60 then "10% 인상"
            ELSE "미인상"
       END AS 인상유무
  FROM employees;



[예제 4-15] 복잡한 조건 논리 처리
employees 테이블에서 job_id가 IT_PROG라면 employee_id, first_name, last_name, salary를 출력하되, 
salary가 9000이상이면 '상위급여', 6000과 8999 사이면 '중위급여', 그 외에는 '하위급여'
를 출력하세요 

SELECT employee_id, first_name, last_name, salary,
       case SALARY
            when >= 9000 then "상위급여" 
            when between 6000 AND 8999 then "중위급여"
            ELSE "하위급여"
       END AS 급여등급
  FROM employees
  WHERE job_id = "IT_PROG";


[예제 4-16] 데이터값에 순위 매기기
RANK, DENSE_RANK, ROW_NUMBER함수를 각각 이용해 employees 테이블의 
salary값이 높은 순서대로 순위를 매겨 출력하라. 

SELECT  employee_id,
        salary,
        RANK()       OVER(ORDER BY salary DESC) RANK_급여,
        DENSE_RANK() OVER(ORDER BY salary DESC) DENSE_RANK_급여,
        ROW_NUMBER() OVER(ORDER BY salary DESC) ROW_NUMBER_급여
FROM employees;


[예제 4-17]  데이터값에 순위 매기기
RANK, DENSE_RANK, ROW_NUMBER함수를 각각 이용해 employees 테이블의 
직원이 속한 department_id 안에서  salary값이 높은 순서대로 순위를 매겨 출력하라. 
SELECT  A.employee_id,
        A.department_id,
        B.department_name,
        salary,
        RANK()       OVER(PARTITION BY A.department_id ORDER BY salary DESC) RANK_급여,
        DENSE_RANK() OVER(PARTITION BY A.department_id ORDER BY salary DESC) DENSE_RANK_급여,
        ROW_NUMBER() OVER(PARTITION BY A.department_id ORDER BY salary DESC) ROW_NUMBER_급여
FROM employees A, departments B
WHERE A.department_id = B.department_id
ORDER BY B.department_id, A.salary DESC;


[예제 4-18] COUNT 함수
employees테이블에서salary의 행수가 몇개인지 세어서 출력 

SELECT COUNT(SALARY)
  FROM employees;
  

[예제 4-19] SUM, AVG 함수
employees테이블에서salary의 합계와 평균을 구해 보세요. 또한 AVG 함수를 사용하지 
않고 salary의 평균을 구해보세요 

SELECT SUM(SALARY)/COUNT(SALARY)
  FROM employees;

[예제 4-20] MAX, MIN 함수 
employees테이블에서salary의 최댓값과 최솟값, first_name의 최댓값과 최솟값을 출력
해 보세요 

SELECT MIN(SALARY) 최소값 ,MAX(SALARY) 최대값 ,MIN(FIRST_NAME),MAX(FIRST_NAME)
  FROM employees;

[예제 4-21] GROUP으로 묶기
employees테이블에서 employee_id가 10 이상인 직원에 대해,
job_id별로 그룹화하여 job_id별 총 급여와 job_id별 평균급여를 구하고, 
job_id별 총 급여를 기준으로 내림차순으로 정렬하세요. 

SELECT job_id 직무, SUM(salary) 직무별_총급여,
       AVG(salary) 직무별_평균급여
FROM   employees
WHERE  employee_id >= 10
GROUP BY job_id
ORDER BY  직무별_총급여 DESC, 직무별_평균급여;


[예제 4-22] 연산에 그룹함수 결과에 조건 적용하기 
employees테이블에서 employee_id가 10 이상인 직원에 대해,
job_id별로 그룹화하여 job_id별 총 급여와 job_id별 평균급여를 구하되,
job_id별 총 급여가 30000보다 큰 값만 출력하세요. 출력결과는 
job_id별 총급여를 기준으로 내림차순 정렬하세요. 

SELECT job_id  job_id_대그룹, 
       manager_id manager_id_중그룹, 
       SUM(salary) 그룹핑_총급여, 
       AVG(salary) 그룹핑_평균급여
FROM   employees
WHERE  employee_id >= 10
GROUP  BY job_id, manager_id
ORDER BY  그룹핑_총급여 DESC, 그룹핑_평균급여;

[5장] ERD 데이터베이스 개체 설계도 

5.2 employee_id가 101인 직원의 first_name, last_name, employee_id, 
start_date, end_date, job_id, department_id를 출력하세요. 


[6장] 조인과 집합 : 여러 개의 테이블 연결하기 

[예제 6-1] 동등조인 : 똑같은 데이터끼리 연결하기
employees테이블과 departments 테이블과 locations 테이블을 조인하여 
각 직원이 어느 부서에 속하는지와 부서의 소재지가 어디인지 조회하세요. 
#1단계
SELECT EMPLOYEE_ID
  FROM employees
  WHERE JOB_ID="PU_CLERK";

#2단계 
SELECT EMPLOYEE_ID, DEPARTMENT_ID
  FROM employees
  WHERE JOB_ID="PU_CLERK";

#3단계
SELECT EMPLOYEE_ID, DEPARTMENT_ID
  FROM employees e, departments d
  WHERE e.JOB_ID="PU_CLERK";
  
  
SELECT e.employee_id, e.department_id, d.department_name
  FROM employees e, departments d
 WHERE e.department_id = d.department_id
   AND job_id = "pu_clerk";

SELECT e.employee_id, e.department_id, d.department_name,
       c.city
  FROM employees e, departments d, locations c 
 WHERE e.department_id = d.department_id
  AND  d.location_id = c.location_id
  AND  job_id = "PU_CLERK";

  


[예제 6-2] 외부조인 : 모든 데이터를 연결하기
employees테이블과 departments테이블을 department_id로 외부 조인하여 
department_id가 NULL값인 Kimberely GRANT도 함께 출력 

SELECT A.employee_id, A.first_name, A.last_name, 
       B.department_id, B.department_name
FROM   employees A 
       LEFT OUTER JOIN departments B ON
                 A.department_id = B.department_id
ORDER BY A.employee_id;


[예제 6-3] 자체 조인 : 자기 자신의 데이터와 연결하기
employees테이블을 자체 조인하여 직원별 담당 매니저가 누구인지 조회


[예제 6-4] 집합 연산자 : 집합으로 연결하기
employees테이블의 department_id집합과 departments테이블의 department_id집합을
UNION 연산자를 이용해 합쳐 보세요. (중복값이 없음) 


[예제 6-5] employees테이블의 department_id집합과 departments테이블의 department_id집합을
UNION ALL 연산자를 이용해 합쳐 보세요. (중복값이 있음) 


[예제 6-6] 교집합
employees테이블의 department_id집합과 departments테이블의 department_id집합의
교집합을 intersect연산자를 이용해 출력. (중복된것만)  


[예제 6-7] employees테이블의 department_id집합과 departments테이블의 department_id집합중
employees 에는 있으나, departments 테이블에는 없는 id를 출력하세요.  


[7장] 서브쿼리 : SELECT 문안에 있는 SELECT 문 

7.2 단일행 서브쿼리

[예제 7-1]  
employees 테이블의 last_name이 'De Haan'인 직원과 
salary가 동일한 직원에는 누가 있는지 단일 행 서브쿼리를 이용해서 출력해보세요. 



 employees 테이블의 last_name이 ' Taylor'인 직원과 
salary가 동일한 직원에는 누가 있는지 단일 행 서브쿼리를 이용해서 출력해보세요. 


7.3 다중행 서브쿼리 

[예제 7-2] 
employees테이블에서 department_id별로 가장 낮은 salary가 얼마인지 찾아보고, 
찾아낸 salary에 해당하는 직원이 누구인지 다중 행 서브쿼리를 이용해 찾아보세요. 


7.4 다중 열 서브쿼리 

[예제 7-3] employees 테이블에서 job_id별로 가장 낮은 salary가 얼마인지 찾아보고, 
찾아낸 job_id별 salary에 해당하는 직원이 누구인지 다중 열 서브쿼리를 이용해 찾아보세요. 

7.5 FROM 절 서브쿼리 : 인라인 뷰 

[예제 7-4] 직원 중에서 department_name이 IT인 직원의 정보를 인라인 뷰를 
이용해 출력해 보세요. 


[8장]

8.2 INSERT 행 삽입하기 

[예제 8-1] departments 테이블에 department_id가 271, department_name이 'Sample_Dept',
manager_id가 200, location_id가 1700인 행을 등록해 보세요. 


[예제 8-2] departments 테이블에 department_id가 272, department_name이 'Sample_Dept',
manager_id가 200, location_id가 1700인 행을 등록해 보세요. 



8.3 [예제 8-3] departments 테이블에 department_name이 'Sample_Dept'인 행을 찾아서 
manager_id를 201, location_id를 1800로 변경하세요. 



[예제 8-4] departments 테이블에서 department_id가 40인 manager_id  와 
location_id의 데이터 값을 찾아내고, department_name이 'Sample_Dept'인 행의 
manager_id와 location_id를 찾아낸 데이터 값과 동일하게 변경하세요. 




8.4 Delet : 행 삭제하기 

[예제 8-5] Departments 테이블에서 department_name이 'Sample_Dept'인 행을 
삭제 하세요. 




[9장]


[10장]

10.2

[예제 10-1]

CREATE TABLE sample_product 
       ( product_id   int, 
         product_name varchar(30), 
         manu_date    date
       );
---------------------------------------------------

10.2


INSERT INTO sample_product VALUES ( 1, 'television', DATE_FORMAT('140101','%Y%m%d'));
INSERT INTO sample_product VALUES ( 2, 'washer', DATE_FORMAT('150101','%Y%m%d'));
INSERT INTO sample_product VALUES ( 3, 'cleaner', DATE_FORMAT('160101','%Y%m%d'));
commit;
---------------------------------------------------

10.3.1

[예제 10-2]

ALTER TABLE sample_product ADD (factory varchar(10));
---------------------------------------------------

10.3.2

[예제 10-3]

ALTER TABLE sample_product MODIFY( factory char(10));
---------------------------------------------------


ALTER TABLE sample_product  MODIFY( product_name varchar(5));
---------------------------------------------------

10.3.3

[예제 10-4]

ALTER TABLE sample_product RENAME COLUMN factory to factory_name; 
---------------------------------------------------

10.3.4

[예제 10-5]

ALTER TABLE sample_product DROP COLUMN factory_name; 
---------------------------------------------------

10.4

[예제 10-6]

TRUNCATE TABLE sample_product;
---------------------------------------------------

10.5

DROP TABLE sample_product;
---------------------------------------------------


SELECT *
FROM sample_product;
---------------------------------------------------


[11장]

11.1

[예제 11-1]

SELECT A.employee_id, A.hire_date, B.department_name, B.job_title
FROM  employees A, emp_details_view B
WHERE A.employee_id = B.employee_id
AND   A.employee_id = 100; 