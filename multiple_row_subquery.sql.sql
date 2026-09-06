-- =========================================
-- MULTIPLE-ROW SUBQUERY PRACTICE
-- =========================================

-- Q1. Find all employees who work in the same
-- departments as employees whose salary is greater than 70,000.

SELECT *
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    WHERE salary > 70000
);


-- Q2. Find employees whose salary is greater than
-- ANY salary of employees working in the HR department.

SELECT *
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE department = 'HR'
);


-- Q3. Find employees whose salary is greater than
-- ALL salaries of employees working in the HR department.

SELECT *
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE department = 'HR'
);


-- Q4. Find all employees who work in a department
-- where at least one employee earns more than 80,000.

SELECT *
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    WHERE salary > 80000
);


-- Q5. Find employees whose salary is less than
-- ANY salary of employees working in the IT department.

SELECT *
FROM employees
WHERE salary < ANY (
    SELECT salary
    FROM employees
    WHERE department = 'IT'
);


-- Q6. Find employees whose salary is less than
-- ALL salaries of employees working in the IT department.

SELECT *
FROM employees
WHERE salary < ALL (
    SELECT salary
    FROM employees
    WHERE department = 'IT'
);


-- Q7. Find employees whose salary is equal to
-- ANY salary of employees working in the HR department.

SELECT *
FROM employees
WHERE salary = ANY (
    SELECT salary
    FROM employees
    WHERE department = 'HR'
);


-- Q8. Find employees whose salary is NOT equal to
-- any salary of employees working in the HR department.

SELECT *
FROM employees
WHERE salary NOT IN (
    SELECT salary
    FROM employees
    WHERE department = 'HR'
);


-- Q9. Find employees whose salary is greater than ALL
-- salaries of employees working in the Sales department
-- AND whose department is not Sales.

SELECT *
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE department = 'Sales'
)
AND department <> 'Sales';


-- Q10. Find employees who work in a department that has
-- at least one employee earning more than 90,000,
-- but exclude employees whose own salary is less than
-- or equal to 50,000.

SELECT *
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    WHERE salary > 90000
)
AND salary > 50000;