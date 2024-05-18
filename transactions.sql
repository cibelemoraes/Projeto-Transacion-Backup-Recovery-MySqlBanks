USE ecommerce;

# statements de consultas e modificações de dados persistidos no banco de dados via transações.
SET @@autocommit = 0;
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
	INSERT INTO product (category, price, Pname) VALUES ('Móveis', 109.99, 'Cadeira de balanço');
COMMIT;

-- 5% de aumento no produto com mais registros de entregas
SET @@autocommit = 0;
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
	WITH best_sellers AS (
		SELECT idproduct, COUNT(*) pdt_dlvrd 
        FROM productdelivery 
        GROUP BY idproduct
        ORDER BY 2 DESC LIMIT 1
	) SELECT idproduct INTO @best FROM best_sellers;
    
    UPDATE product SET price = price * 1.05 
	WHERE idproduct = @best;
COMMIT;

# transação definida dentro de uma procedure.
USE company;
drop procedure employee_salary_increase;
DELIMITER //
CREATE PROCEDURE employee_salary_increase (
	in increase_percent int,
    in essn char(9)
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		SHOW ERRORS LIMIT 1;
		ROLLBACK;
        -- SELECT 'An exception was occured' as exception_message;
    END;
    
    SET @@autocommit = 0;
    SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;
		UPDATE employee SET salary = salary + (salary * (increase_percent/100)) WHERE ssn = essn;
	COMMIT;
END //
DELIMITER ;

select * from employee;
CALL employee_salary_increase(5, '123405389');