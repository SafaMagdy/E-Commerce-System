CREATE Table Users 
(
username varchar(20),
first_name varchar(20),
last_name varchar(20),
pass_word varchar(20),
email varchar(50),
PRIMARY KEY (username)
);


CREATE Table User_mobile_numbers
(
mobile_number varchar(20),
username varchar(20),
PRIMARY KEY(mobile_number , username),
FOREIGN KEY (username) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE Table User_Addresses
(
username varchar(20),
uaddress varchar(100),
PRIMARY KEY (username , uaddress),
FOREIGN KEY (username) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE Table Customer
(
username varchar(20),
points int DEFAULT 0,
PRIMARY KEY (username),
FOREIGN KEY (username) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE Table Admins 
(
username varchar(20),
PRIMARY KEY (username),
FOREIGN KEY (username) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE Table Vendor
(
username varchar(20),
activated BIT DEFAULT 0 ,
company_name varchar(20),
bank_acc_no varchar(20), 
admin_username varchar(20),
PRIMARY KEY (username),
FOREIGN KEY (username) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE ,
FOREIGN KEY (admin_username) REFERENCES Admins(username) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE Table Delivery_Person
(
username varchar(20), 
is_activated BIT,
PRIMARY KEY (username) ,
FOREIGN KEY (username) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE Table Credit_Card
(
number varchar(20),
expirydate date,
cvv_code varchar(20),
PRIMARY KEY (number) 
);
 

 CREATE Table Delivery
 (
 id int IDENTITY, 
 d_type varchar(20),
 time_duration int,
 fees decimal(5,3),
 username varchar(20),
 PRIMARY KEY (id),
 FOREIGN KEY (username) REFERENCES Admins(username) ON DELETE NO ACTION ON UPDATE CASCADE
 );


 CREATE Table Orders
 (
 order_no int IDENTITY,
 order_date datetime,
 total_amount decimal(10,2), 
 cash_amount decimal(10,2),
 credit_amount decimal(10,2), 
 payment_type varchar(20), 
 order_status varchar(20) DEFAULT  'not processed', 
 remaining_days int,
 time_limit datetime, 
 customer_name varchar(20),
 delivery_id int,
 creditCard_number varchar(20),
 Gift_Card_code_used varchar(10),
 PRIMARY KEY (order_no),
 FOREIGN KEY (customer_name) REFERENCES Customer(username) ON DELETE NO ACTION ON UPDATE CASCADE,
 FOREIGN KEY (delivery_id) REFERENCES Delivery(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
 FOREIGN KEY (creditCard_number) REFERENCES Credit_Card(number) ON DELETE NO ACTION ON UPDATE NO ACTION,
 FOREIGN KEY (Gift_card_code_used) REFERENCES Giftcard(code) ON DELETE NO ACTION ON UPDATE NO ACTION
 );

 
 CREATE TABLE Product (
	serial_no INT IDENTITY	
	,product_name VARCHAR(20)
	,category VARCHAR(20)
	,product_description TEXT
	,price DECIMAL(10,2)
	,final_price DECIMAL(10,2)
	,color VARCHAR(20)
	,available BIT
	,rate INT
	,vendor_username VARCHAR(20)
	,customer_username VARCHAR(20)
	,customer_order_id int
	,PRIMARY KEY(serial_no)
	,FOREIGN KEY (vendor_username) REFERENCES Vendor on update cascade on delete cascade
	,FOREIGN KEY (customer_username) REFERENCES Customer on update NO ACTION on delete NO ACTION
	,FOREIGN KEY (customer_order_id) REFERENCES Orders on update NO ACTION on delete NO ACTION
);


CREATE TABLE CustomerAddstoCartProduct(
	serial_no INT
	,customer_name VARCHAR(20)
	,PRIMARY KEY (serial_no,customer_name)
	,FOREIGN KEY (serial_no) REFERENCES Product on update cascade on delete cascade
	,FOREIGN KEY (customer_name) REFERENCES Customer on update NO ACTION on delete NO ACTION
);


CREATE TABLE Todays_Deals(
	deal_id INT IDENTITY
	,deal_amount INT
	,expirydate DATE
	,admin_username VARCHAR(20)
	,PRIMARY KEY(deal_id)
	,FOREIGN KEY(admin_username) REFERENCES Admins on update cascade on delete NO ACTION
);



CREATE TABLE Todays_Deals_Product(
	deal_id INT
	,serial_no INT
	,PRIMARY KEY (deal_id,serial_no)
	,FOREIGN KEY (deal_id) REFERENCES Todays_Deals on update cascade on delete cascade
	,FOREIGN KEY (serial_no) REFERENCES Product on update NO ACTION on delete NO ACTION
);


CREATE Table offer(
offer_id int IDENTITY,
offer_amount int,
expirydate date,
PRIMARY KEY (offer_id)
);


CREATE Table offersOnProduct(
offer_id int,
serial_no int,
primary key (offer_id, serial_no),
foreign key(offer_id) references offer on update cascade on delete cascade,
foreign key(serial_no) references Product on update NO ACTION on delete NO ACTION
);


CREATE Table Customer_Question_Product(
serial_no int,
customer_name varchar(20),
question varchar(50),
answer TEXT,
primary key (serial_no, customer_name),
foreign key(serial_no) references Product on update cascade on delete cascade,
foreign key(customer_name) references Customer on update NO ACTION on delete NO ACTION
);



CREATE Table Wishlist(
username varchar(20),
uname varchar(20),
primary key (username, uname),
foreign key(username) references Customer on update cascade on delete cascade,
);


CREATE Table Giftcard(
code varchar(10),
expirydate date,
amount int,
username varchar(20),
primary key (code),
foreign key(username) references Admins on update cascade on delete cascade,
);


CREATE Table Wishlist_Product(
username varchar(20),
wish_name varchar(20),
serial_no int,
primary key (username, wish_name,serial_no),
foreign key(username , wish_name) references Wishlist(username ,uname) on update CASCADE on delete CASCADE,
foreign key(serial_no) references Product on update NO ACTION on delete NO ACTION
);


CREATE Table Admin_Customer_Giftcard(
code varchar(10),
customer_name varchar(20),
admin_username varchar(20),
remaining_points int,
primary key (code, customer_name,admin_username),
foreign key(code) references Giftcard on update cascade on delete cascade,
foreign key(customer_name) references Customer on update NO ACTION on delete NO ACTION,
foreign key(admin_username) references Admins on update NO ACTION on delete NO ACTION
);


CREATE Table Admin_Delivery_Order(
delivery_username varchar(20),
order_no int, 
admin_username varchar(20),
delivery_window varchar(50),
PRIMARY KEY (delivery_username , order_no),
FOREIGN KEY (delivery_username) REFERENCES Delivery_person(username) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (order_no) REFERENCES Orders(order_no) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (admin_username) REFERENCES Admins(username) ON DELETE NO ACTION ON UPDATE NO ACTION 
);


CREATE Table Customer_CreditCard(
customer_name varchar(20),
cc_number varchar(20),
primary key (customer_name,cc_number),
foreign key(customer_name) references Customer on update cascade on delete cascade,
foreign key(cc_number) references Credit_Card on update cascade on delete cascade
);

--DROP TABLE Customer_CreditCard
--DROP TABLE Admin_Delivery_Order
--DROP TABLE Admin_Customer_Giftcard
--DROP TABLE Wishlist_Product
--DROP TABLE Orders
--DROP TABLE Giftcard
--DROP TABLE Wishlist
--DROP TABLE Customer_Question_Product
--DROP TABLE offersOnProduct
--DROP TABLE offer
--DROP TABLE Todays_Deals_Product
--DROP TABLE Todays_Deals
--DROP TABLE CustomerAddstoCartProduct
--DROP TABLE Product
--DROP TABLE Delivery
--DROP TABLE Credit_Card
--DROP TABLE Delivery_Person
--DROP TABLE Vendor
--DROP TABLE Admins
--DROP TABLE Customer
--DROP TABLE User_Addresses
--DROP TABLE User_mobile_numbers
--DROP TABLE Users


GO
CREATE PROC customerRegister 
@username varchar(20),
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@email varchar(50)
AS
IF (@username NOT IN( SELECT username 
					  FROM Users))
BEGIN
INSERT INTO Users(username, first_name, last_name, pass_word, email)
VALUES(@username, @first_name, @last_name, @password, @email)
INSERT INTO Customer(username)
VALUES(@username)
END
ELSE 
BEGIN
PRINT 'username already taken'
END


GO
CREATE PROC vendorRegister 
@username varchar(20),
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@email varchar(50),
@company_name varchar(20),
@bank_acc_no varchar(20)
AS
IF (@username NOT IN( SELECT username 
					  FROM Users))
BEGIN
INSERT INTO Users(username, first_name, last_name, pass_word, email)
VALUES(@username, @first_name, @last_name, @password, @email)
INSERT INTO Vendor(username , company_name , bank_acc_no)
VALUES(@username , @company_name , @bank_acc_no)
END 
ELSE 
BEGIN
PRINT 'username already taken'
END


GO 
CREATE PROC userLogin
@username varchar(20), 
@password varchar(20),
@success BIT OUTPUT, 
@type int OUTPUT
AS
BEGIN
IF (
	EXISTS (SELECT username
	FROM Users 
	WHERE Users.username = @username AND Users.pass_word =@password)
	)
	BEGIN --5
		SET @success = 1
		IF
		 ( EXISTS (SELECT username 
				   FROM Customer
				   WHERE Customer.username = @username)
		) 
		BEGIN
			SET @type = 0
		END
		ELSE
			BEGIN --4
			IF (EXISTS (SELECT username
						 FROM Vendor
						 WHERE Vendor.username = @username))
						 BEGIN
						  SET @type = 1
						 END
			ELSE
				BEGIN --3
					IF (EXISTS (SELECT username
						 FROM Admins
						 WHERE Admins.username = @username))
						 BEGIN
							 SET @success = 1
							 SET @type = 2
						 END
					ELSE 
						BEGIN --2
							IF (EXISTS (SELECT username
								 FROM Delivery_Person
								 WHERE Delivery_Person.username = @username))
								 BEGIN --1
									 SET @success = 1
									 SET @type = 3
								 END --1
						END--2
				END --3
			END --4
	END--5

ELSE
BEGIN
	SET @success=0
	SET @type = -1
	END
END


GO 
CREATE PROC addMobile
@username varchar(20), 
@mobile_number varchar(20)
AS 
IF (EXISTS( SELECT username 
			FROM Users
			WHERE username = @username))
BEGIN
INSERT INTO User_mobile_numbers (username , mobile_number)
VALUES (@username , @mobile_number)
END 
ELSE 
BEGIN 
PRINT ' Wrong username ' 
END


GO 
CREATE PROC addAddress
@username varchar(20), 
@address varchar(100)
AS 
IF (EXISTS( SELECT username 
			FROM Users
			WHERE username = @username))
BEGIN
INSERT INTO User_Addresses (uaddress , username)
VALUES(@address ,@username)
DROP PROC addAddress
END 
ELSE 
BEGIN 
PRINT ' Wrong username ' 
END


GO 
CREATE PROC showProducts
AS 
SELECT product_name,product_description,price,final_price,color
FROM Product
WHERE available = 1


GO 
CREATE PROC ShowProductsbyPrice
AS 
SELECT product_name,product_description,price,color
FROM Product
WHERE available = 1
ORDER BY price


GO 
CREATE PROC  searchbyname
@text varchar(20)
AS 
SELECT product_name,product_description,price,final_price,color
FROM Product
WHERE Product.product_name LIKE '%' + @text + '%' AND available = 1


GO
CREATE PROC AddQuestion
@serial int, 
@customer varchar(20), 
@Question varchar(50)
AS 
IF (EXISTS (SELECT username
			FROM Customer
			WHERE username = @customer)
			AND EXISTS (SELECT serial_no
						FROM Product
						WHERE serial_no = @serial))
BEGIN
INSERT INTO Customer_Question_Product (serial_no , customer_name , question)
VALUES (@serial , @customer, @Question)
END 
ELSE 
BEGIN 
PRINT 'cannot add the question , check entries'
END


GO 
CREATE PROC addToCart
@customername varchar(20), 
@serial int
AS
IF (EXISTS ( SELECT serial_no
			 FROM Product
			 WHERE serial_no = @serial AND available = 1) 
			 AND EXISTS( SELECT username
						 FROM Customer
						 WHERE username = @customername))
BEGIN
IF (EXISTS (SELECT serial_no
			FROM CustomerAddstoCartProduct
			WHERE serial_no = @serial AND customer_name = @customername))
BEGIN
PRINT 'THE PRODUCT IS ALREADY IN THE CART'
END
ELSE 
BEGIN
INSERT INTO CustomerAddstoCartProduct (serial_no , customer_name)
VALUES (@serial , @customername)
END
END
ELSE 
BEGIN 
PRINT 'cannot do the operation , check entries'
END



GO 
CREATE PROC removefromCart
@customername varchar(20), 
@serial int
AS 
IF (EXISTS (SELECT *
			FROM CustomerAddstoCartProduct 
			WHERE customer_name = @customername AND serial_no = @serial))
BEGIN
DELETE FROM CustomerAddstoCartProduct WHERE serial_no = @serial AND customer_name = @customername 
END
ELSE 
BEGIN 
PRINT ' the record is not found to delete '
END


GO 
CREATE PROC createWishlist
@customername varchar(20), 
@name varchar(20)
AS
IF ( EXISTS (SELECT username
			FROM Customer
			WHERE username = @customername))
	BEGIN 
		IF (NOT EXISTS (SELECT uname 
						FROM Wishlist
						WHERE uname = @name AND username = @customername ))
			BEGIN
			INSERT INTO Wishlist (username , uname)
			VALUES(@customername, @name)
			END
		ELSE 
			BEGIN 
			IF (EXISTS (SELECT uname
						FROM Wishlist
						WHERE uname = @name))
						BEGIN
			PRINT ' there exists a wishlist having the same name for this customer'
			END
			END
			END
ELSE 
	BEGIN 
PRINT ' there does not exist a customer with this name'
END
 

GO 
CREATE PROC AddtoWishlist
@customername varchar(20),
@wishlistname varchar(20), 
@serial int
AS
IF (EXISTS (SELECT username
			FROM Customer
			WHERE username = @customername))
	BEGIN
	IF (EXISTS (SELECT uname
				FROM Wishlist
				WHERE uname = @wishlistname))
		BEGIN
		IF (EXISTS ( SELECT serial_no
					FROM Product
					WHERE serial_no = @serial AND available = 1))
			BEGIN
	        INSERT INTO Wishlist_Product (username ,wish_name ,serial_no )
			VALUES (@customername , @wishlistname , @serial)
			END
		ELSE 
		BEGIN 
		PRINT ' The product is not available'
		END
		END
	ELSE 
	BEGIN
	PRINT ' there does not exist a wishlist for this customer with this name'
	END 
	END
ELSE 
BEGIN 
Print ' There does not exist a customer with this name'
END
	

GO 
CREATE PROC removefromWishlist
@customername varchar(20),
@wishlistname varchar(20), 
@serial int
AS 
IF (EXISTS (SELECT *
			FROM Wishlist_Product
			WHERE username = @customername AND wish_name = @wishlistname AND serial_no = @serial ))
BEGIN
DELETE FROM Wishlist_Product WHERE username = @customername AND wish_name = @wishlistname AND serial_no = @serial
END 
ELSE 
BEGIN 
PRINT 'the record is not there to delete'
END


GO 
CREATE PROC showWishlistProduct
@customername varchar(20), 
@name varchar(20)
AS 
IF (EXISTS (SELECT * 
			FROM Wishlist_Product 
			WHERE username = @customername AND wish_name = @name))
BEGIN
SELECT P.product_name , P.product_description , P.price , P.final_price, p.color
FROM Wishlist_Product W INNER JOIN Product P ON W.serial_no = P.serial_no
WHERE username = @customername AND wish_name = @name
END
ELSE 
BEGIN 
PRINT ' wrong entries'
END


GO 
CREATE PROC viewMyCart
@customer varchar(20)
AS
IF (EXISTS (SELECT * 
			FROM CustomerAddstoCartProduct
			WHERE customer_name = @customer))
BEGIN
SELECT P.product_name , P.product_description , P.price , P.final_price , P.color
FROM Product  P INNER JOIN CustomerAddstoCartProduct C ON P.serial_no = C.serial_no 
WHERE C.customer_name = @customer
END 
ELSE 
BEGIN 
PRINT ' wrong entry '
END


GO 
CREATE PROC calculatepriceOrder
@customername varchar(20),
@sum decimal(10,2) OUTPUT
AS
IF (EXISTS (SELECT * 
			FROM CustomerAddstoCartProduct
			WHERE customer_name = @customername))
BEGIN
DECLARE @s decimal(10,2)
SELECT @s = SUM(P.final_price)
FROM Product P INNER JOIN CustomerAddstoCartProduct C ON P.serial_no = C.serial_no
WHERE C.customer_name = @customername AND P.available = 1
SET @sum = @s
END 
ELSE 
BEGIN 
PRINT ' wrong entries'
END


GO 
CREATE PROC productsinorder
@customername varchar(20), 
@orderID int
AS
IF (EXISTS (SELECT *
			FROM CustomerAddstoCartProduct
			WHERE customer_name = @customername))
BEGIN

UPDATE Product 
SET Product.customer_order_id = @orderid , Product.available = 0 , Product.customer_username = @customername
WHERE serial_no IN (SELECT P.serial_no
				    FROM CustomerAddstoCartProduct C INNER JOIN Product P ON C.serial_no = P.serial_no
			        WHERE C.customer_name = @customername)

SELECT *
FROM Product P INNER JOIN CustomerAddstoCartProduct C ON P.serial_no = C.serial_no
WHERE C.customer_name = @customername 


DELETE FROM CustomerAddstoCartProduct WHERE serial_no IN ( SELECT serial_no 
														   FROM CustomerAddstoCartProduct
														   WHERE customer_name = @customername) AND customer_name <> @customername
END
ELSE 
BEGIN 
PRINT ' wrong entries'
END


GO 
CREATE PROC emptyCart
@customername varchar(20)
AS 
IF (EXISTS (SELECT *
			FROM CustomerAddstoCartProduct
			WHERE customer_name = @customername))
BEGIN
DELETE FROM CustomerAddstoCartProduct WHERE customer_name = @customername
END
ELSE 
BEGIN 
PRINT 'wrong entries'
END


GO 
CREATE PROC makeOrder
@customername varchar(20)
AS 
IF (EXISTS (SELECT *
			FROM CustomerAddstoCartProduct
			WHERE customer_name = @customername))
BEGIN
DECLARE @sum decimal(10,2)
DECLARE @id int
EXEC calculatepriceOrder @customername, @sum OUTPUT 
INSERT INTO Orders (order_date , total_amount , customer_name)
VALUES (CURRENT_TIMESTAMP , @sum , @customername)
SET @id = (SELECT MAX(Orders.order_no)
           FROM Orders
		   WHERE customer_name = @customername)
EXEC  productsinorder @customername , @id
EXEC emptyCart @customername
END 
ELSE 
BEGIN 
PRINT 'wrong entry'
END



GO 
CREATE PROC cancelOrder
@orderid int 
AS 
DECLARE @points int
DECLARE @date date
DECLARE @customer varchar(20)
DECLARE @code varchar(10)
IF (EXISTS (SELECT *
			FROM Orders
			WHERE order_no = @orderid))
BEGIN 
	IF (EXISTS (SELECT order_status
		        FROM Orders
				WHERE order_no = @orderid AND order_status IN ('not processed','in process')))
		BEGIN
		SELECT @points = total_amount - cash_amount - credit_amount
		FROM Orders
		WHERE order_no = @orderid

		SELECT @date = expirydate , @code = Gift_Card_code_used
		FROM Giftcard G INNER JOIN Orders O ON  O.Gift_Card_code_used = G.code
		WHERE O.order_no = @orderid 

		UPDATE Product
		SET Product.available = 1 , customer_order_id = NULL , customer_username = NULL WHERE Product.customer_order_id = @orderid
		SELECT @customer = Orders.customer_name
		FROM Orders
		WHERE order_no = @orderid

		IF (@points > 0 AND CURRENT_TIMESTAMP < @date)
		BEGIN
		UPDATE Customer
		SET points = points + @points
		WHERE username = @customer

		UPDATE Admin_Customer_Giftcard
		SET remaining_points = remaining_points + @points
		WHERE customer_name = @customer AND code = @code

		END
		DELETE FROM Orders WHERE Orders.order_no = @orderid 
		END
	ELSE
	BEGIN
	PRINT 'The order cannot be cancelled'
	END
END 
ELSE 
BEGIN 
PRINT ' wrong orderid '
END


GO 
CREATE PROC returnProduct
@serialno int, 
@orderid int
AS
DECLARE @price decimal(10,2)
DECLARE @date date
DECLARE @code varchar(10)
DECLARE @midprice decimal(10,2)
DECLARE @total decimal(10,2)
DECLARE @points int
DECLARE @extra int
DECLARE @customer varchar(20)
IF (EXISTS (SELECT *
			FROM Orders O INNER JOIN Product P ON O.order_no = P.customer_order_id
			WHERE O.order_no = @orderid AND P.serial_no = @serialno AND O.order_status = 'delivered'))
BEGIN
SELECT @points = total_amount - cash_amount - credit_amount , @total = total_amount
		FROM Orders
		WHERE order_no = @orderid

SELECT @date = expirydate , @code = Gift_Card_code_used
FROM Giftcard G INNER JOIN Orders O ON  O.Gift_Card_code_used = G.code
WHERE O.order_no = @orderid 

SELECT @price = final_price
FROM Product
WHERE serial_no = @serialno

SELECT @customer = customer_name
FROM Orders
WHERE order_no = @orderid

SET @midprice = @total - @price
IF ( @points > @midprice)
BEGIN 
SET @extra = @points - @midprice

UPDATE Admin_Customer_Giftcard
		SET remaining_points = remaining_points + @extra
		WHERE customer_name = @customer AND code = @code

UPDATE Customer
		SET points = points + @points
		WHERE username = @customer

END
UPDATE Orders 
SET total_amount = @midprice 
WHERE order_no = @orderid

UPDATE Product
		SET Product.available = 1 , customer_order_id = NULL , customer_username = NULL WHERE Product.customer_order_id = @orderid
		SELECT @customer = Orders.customer_name
		FROM Orders
		WHERE order_no = @orderid

END
ELSE 
BEGIN 
PRINT 'wrong entry of the product is not delivered yet'
END 


GO 
CREATE PROC returnDeliveredProduct
@serialno int, 
@orderid int
AS 
DECLARE @paid_by_points int
IF (EXISTS (SELECT *
			FROM Orders O INNER JOIN Product P ON O.order_no = P.customer_order_id
			WHERE O.order_no = @orderid AND P.serial_no = @serialno AND O.order_status = 'delivered'))
BEGIN 
UPDATE Product
SET customer_order_id = NULL , customer_username = NULL , available = 1
WHERE serial_no = @serialno AND customer_order_id = @orderid

SELECT @paid_by_points = (total_amount - cash_amount - credit_amount)
FROM Orders 
WHERE order_no = @orderid

UPDATE Customer 
SET points = points + @paid_by_points 
END
ELSE 
BEGIN 
PRINT ' wrong entries'
END


GO
CREATE PROC ShowproductsIbought
@customername varchar(20)
AS
IF (EXISTS (SELECT *
			FROM Customer
			WHERE username = @customername))
BEGIN
SELECT Product.serial_no , Product.product_name , Product.category , Product.product_description, Product.price , Product.final_price , Product.color
FROM Product inner join Orders ON Product.customer_order_id = Orders.order_no
WHERE customer_name = @customername
END
ELSE 
BEGIN 
PRINT ' wrong customer name '
END


GO 
CREATE PROC rate
@serial_no int,
@rate int,
@customername varchar(20)
As
IF (@serial_no IN (SELECT serial_no
					FROM Product inner join Orders ON Product.customer_order_id = Orders.order_no
					WHERE Orders.order_status= 'Delivered' AND customer_name = @customername))

BEGIN
	UPDATE Product 
	SET rate = @rate
	WHERE Product.serial_no = @serial_no
END
Else
BEGIN
	PRINT 'YOU DID NOT BUY THIS PRODUCT OR THE PRODUCT IS NOT DELIVERED YET and you can only rate if it is delivered to be realistic  '
END


GO
CREATE PROC SpecifyAmount
@customername varchar(20),
@orderID int,
@cash decimal(10,2),
@credit decimal(10,2)
AS
DECLARE @total_amount decimal(10,2)
DECLARE @points int
DECLARE @mypoints int
DECLARE @cash2 decimal(10,2)
DECLARE @credit2 decimal(10,2)
DECLARE @code varchar(10)

 
SELECT @total_amount = total_amount 
FROM Orders
WHERE Orders.order_no = @orderID

SELECT @mypoints = points
FROM Customer
WHERE Customer.username = @customername

IF (@cash IS NULL)
BEGIN 
SET @cash2 = 0
END
ELSE 
BEGIN 
SET @cash2 = @cash
END

IF (@credit IS NULL)
BEGIN 
SET @credit2 = 0
END
ELSE
BEGIN 
SET @credit2 = @credit
END

SET @points = @total_amount - @cash2 - @credit2

IF(@mypoints>= @points)
BEGIN
	SELECT @code = code
	FROM Admin_Customer_Giftcard
	WHERE customer_name = @customername

	IF (@points = @total_amount)
	BEGIN
		UPDATE Orders
		SET Orders.cash_amount=@cash2 ,Orders.credit_amount=  @credit2, Orders.payment_type = 'Fully Points'
		WHERE order_no=@orderID

		UPDATE Customer
		SET points = @mypoints - @points
		WHERE username=@customername

		UPDATE Admin_Customer_Giftcard 
		SET remaining_points = remaining_points - @points
		WHERE customer_name = @customername

		UPDATE Orders
		SET Gift_Card_code_used = @code
		WHERE order_no = @orderID
	END


	IF(@cash2 = @total_amount)
	BEGIN
		UPDATE Orders
		SET Orders.cash_amount=@cash2 , Orders.credit_amount=@credit2, Orders.payment_type = 'Fully Cash'
		WHERE order_no=@orderID
	END

	IF(@credit2 = @total_amount)
	BEGIN
		UPDATE Orders
		SET Orders.cash_amount=@cash2, Orders.credit_amount=@credit2, Orders.payment_type = 'Fully Credit'
		WHERE order_no=@orderID
	END

	IF(@points>0 AND @points < @total_amount)
	BEGIN
		IF(@cash2=0)
		BEGIN
		UPDATE Orders
		SET Orders.cash_amount=@cash2, Orders.credit_amount=@credit2, Orders.payment_type = 'Credit/Points'
		WHERE order_no=@orderID

		UPDATE Customer
		SET points = @mypoints - @points
		WHERE username=@customername

		UPDATE Admin_Customer_Giftcard 
		SET remaining_points = remaining_points - @points
		WHERE customer_name = @customername

	    UPDATE Orders
		SET Gift_Card_code_used = @code
		WHERE order_no = @orderID
		END

		IF(@credit2 = 0)
		BEGIN
		UPDATE Orders
		SET Orders.cash_amount=@cash2, Orders.credit_amount=@credit2, Orders.payment_type = 'Cash/Points'
		WHERE order_no=@orderID

		UPDATE Customer
		SET points = @mypoints - @points
		WHERE username=@customername

		UPDATE Admin_Customer_Giftcard 
		SET remaining_points = remaining_points - @points
		WHERE customer_name = @customername

		UPDATE Orders
		SET Gift_Card_code_used = @code
		WHERE order_no = @orderID
		END
	END
END
ELSE
BEGIN
PRINT 'NOT ENOUGH POINTS'
END
--END HABD


GO 
CREATE PROC AddCreditCard
@creditcardnumber varchar(20), 
@expirydate date , 
@cvv varchar(4), 
@customername varchar(20)
AS
IF (EXISTS (SELECT *
			FROM Credit_Card
			WHERE number = @creditcardnumber))
BEGIN 
PRINT 'there already exists a credit card with this number'
END
ELSE 
BEGIN
IF (EXISTS (SELECT *
			FROM Customer
			WHERE username = @customername))
BEGIN
INSERT INTO Credit_Card (number , expirydate , cvv_code)
VALUES (@creditcardnumber , @expirydate , @cvv)

INSERT INTO Customer_CreditCard(customer_name , cc_number)
VALUES  (@customername,@creditcardnumber)
END
ELSE 
BEGIN 
PRINT 'wrong customer name'
END
END



GO
CREATE PROC ChooseCreditCard
@creditcard VARCHAR(20),
@orderid INT

AS
DECLARE @expiry date
DECLARE @customerO varchar(20)

IF (EXISTS (SELECT *
			FROM Customer_CreditCard
			WHERE cc_number = @creditcard))
BEGIN

	SELECT @customerO = customer_name
	FROM Orders
	WHERE order_no = @orderid

	SELECT @expiry = expirydate 
	FROM Credit_Card
	WHERE number = @creditcard

	IF (@expiry > CURRENT_TIMESTAMP AND @customerO IN (SELECT customer_name
													   FROM Customer_CreditCard 
													   WHERE cc_number = @creditcard))
	BEGIN
	UPDATE Orders
	SET creditCard_number = @creditcard
	WHERE order_no=@orderid
	END
	ELSE 
	BEGIN 
	PRINT 'the credit card has expired or you do not own this credit card'
	END
END
ELSE 
BEGIN 
PRINT ' wrong credit card number'
END


GO
CREATE PROC vewDeliveryTypes
AS
SELECT *
FROM Delivery


GO									--**UPDATED***
CREATE PROC specifydeliverytype
@orderID INT,
@deliveryID INT

AS
DECLARE @rem int
SELECT @rem = time_duration
FROM Delivery 
WHERE id = @deliveryID
UPDATE Orders
SET delivery_id =@deliveryID , remaining_days = @rem ,time_limit=CURRENT_TIMESTAMP+@rem
WHERE order_no=@orderID


GO
CREATE PROC trackRemainingDays
@orderid INT,
@customername VARCHAR(20),
@days INT OUTPUT
AS
DECLARE @days2 INT
SELECT @days2= DATEDIFF( day, CURRENT_TIMESTAMP ,time_limit)
FROM Orders
WHERE order_no=@orderid AND customer_name = @customername 

UPDATE Orders
SET remaining_days=@days2
WHERE order_no=@orderid 

SET @days = @days2

PRINT @days



--u
GO
CREATE PROC recommmend
@customername varchar(20)
AS 

DECLARE @topCategories TABLE (
category varchar(20))


DECLARE @productwishcount TABLE(
serial_no int,
countwish int )


DECLARE @mostsimilarUsers TABLE(
customer_name varchar(20))

DECLARE @myCart TABLE(
serial_no int
)

DECLARE @6products TABLE(
	serial_no INT 	
)



INSERT INTO @TopCategories (category)
SELECT top 3 category
FROM Product  P INNER JOIN CustomerAddstoCartProduct C ON P.serial_no = C.serial_no  WHERE C.customer_name = @customername
group by category
order by count(*) desc


INSERT INTO @productwishcount (serial_no,countwish)
SELECT serial_no, count(*)
FROM Wishlist_Product
GROUP BY serial_no
ORDER BY count(*) DESC

INSERT INTO @6products (serial_no)
SELECT TOP 3 P.serial_no
FROM Product P INNER JOIN @topCategories T ON P.category = T.category
INNER JOIN @productwishcount W ON W.serial_no = P.serial_no
ORDER BY W.countwish DESC

INSERT INTO @myCart (serial_no)
SELECT serial_no 
FROM CustomerAddstoCartProduct
WHERE customer_name = @customername


INSERT INTO @mostsimilarUsers (customer_name)
SELECT TOP 3 customer_name
FROM CustomerAddstoCartProduct A INNER JOIN @myCart M ON A.serial_no= M.serial_no
WHERE customer_name != @customername
GROUP BY customer_name
ORDER BY COUNT(*) DESC


INSERT INTO @6products (serial_no)
SELECT TOP 3 serial_no
FROM Wishlist_Product W INNER JOIN @mostsimilarUsers M ON M.customer_name= W.username
GROUP BY serial_no
ORDER BY COUNT(*) DESC

SELECT P.* 
FROM (SELECT DISTINCT serial_no FROM @6products) S 
INNER JOIN Product P on s.serial_no=p.serial_no


--Vendor

--a
GO
CREATE PROC postProduct
@vendorUsername varchar(20),
@product_name varchar(20),
@category varchar(20),
@product_description text,
@price decimal(10,2),
@color varchar(20)

AS 
INSERT INTO Product (product_name, category, product_description,price, final_price, color, available,vendor_username)
VALUES(@product_name,@category,@product_description,@price, @price ,@color,1,@vendorUsername)


--b
GO 
CREATE PROC vendorviewProducts
@vendorname varchar(20)
AS
IF ( EXISTS (SELECT username 
			FROM Vendor
			WHERE username = @vendorname))
BEGIN
SELECT *
FROM Product
WHERE vendor_username=@vendorname
END 
ELSE 
BEGIN 
PRINT 'Wrong entry'
END

--c ***UPDATED**

GO
CREATE PROC EditProduct
@vendorname varchar(20),
@serialnumber int,
@product_name varchar(20),
@category varchar(20),
@product_description text,
@price decimal(10,2),
@color varchar(20)

AS 
IF (EXISTS (SELECT *
			FROM Product
			WHERE vendor_username = @vendorname AND serial_no = @serialnumber))
BEGIN
IF (@product_name IS NOT NULL)
BEGIN
update Product
SET product_name= @product_name
WHERE vendor_username=@vendorname AND serial_no=@serialnumber
END
IF (@category IS NOT NULL)
BEGIN
update Product
SET category= @category
WHERE vendor_username=@vendorname AND serial_no=@serialnumber
END
IF (@product_description IS NOT NULL)
BEGIN
update Product
SET product_description= @product_description
WHERE vendor_username=@vendorname AND serial_no=@serialnumber
END
IF (@price IS NOT NULL)
BEGIN
update Product
SET price = @price , final_price = @price
WHERE vendor_username=@vendorname AND serial_no=@serialnumber
END
IF (@color IS NOT NULL)
BEGIN
update Product
SET color = @color
WHERE vendor_username=@vendorname AND serial_no=@serialnumber
END
END
ELSE 
BEGIN 
PRINT 'wrong entries'
END

--d

GO
CREATE PROC deleteProduct
@vendorname varchar(20),
@serialnumber INT
AS
--delete also from CustomerAddstoCartProduct,Todays_Deals_Product,offersOnProduct,Customer_Question_Product,Wishlist_Product
IF (EXISTS (SELECT *
			FROM Product
			WHERE serial_no = @serialnumber AND vendor_username = @vendorname))
BEGIN
DELETE FROM CustomerAddstoCartProduct 
WHERE serial_no = @serialnumber

DELETE FROM Todays_Deals_Product
WHERE serial_no = @serialnumber

DELETE FROM offersOnProduct
WHERE serial_no = @serialnumber

DELETE FROM Customer_Question_Product
WHERE serial_no = @serialnumber

DELETE FROM Wishlist_Product
WHERE serial_no = @serialnumber

DELETE FROM Product
WHERE serial_no = @serialnumber
END
ELSE 
BEGIN 
PRINT 'wrong entries'
END

--e

GO
CREATE PROC viewQuestions
@vendorname varchar(20)
AS
IF( EXISTS (SELECT *
			FROM Vendor
			WHERE username = @vendorname))
BEGIN
SELECT q.*
FROM Customer_Question_Product q
INNER JOIN Product p ON p.serial_no=q.serial_no
WHERE p.vendor_username=@vendorname
END
ELSE 
BEGIN 
PRINT 'wrong vendor name'
END

--f

GO
CREATE PROC  answerQuestions
@vendorname varchar(20), 
@serialno int, 
@customername varchar(20), 
@answer text 
AS
IF (EXISTS (SELECT *
			FROM Customer_Question_Product
			WHERE serial_no = @serialno AND customer_name = @customername))
BEGIN
	IF (EXISTS (SELECT q.*
				FROM Customer_Question_Product q
				INNER JOIN Product p ON p.serial_no=q.serial_no
				WHERE p.vendor_username=@vendorname))
	BEGIN
		UPDATE Customer_Question_Product
		SET answer=@answer
		WHERE serial_no=@serialno AND customer_name=@customername AND 
		@vendorname IN (SELECT vendor_username FROM Product WHERE serial_no=@serialno)
	END
END
ELSE 
BEGIN 
PRINT 'wrong entries'
END

--g

GO
CREATE PROC addOffer
@offeramount int, 
@expiry_date datetime
AS
INSERT INTO offer (offer_amount, expirydate) 
VALUES (@offeramount,@expiry_date)

--

GO
CREATE PROC checkOfferonProduct
@serial int,
@activeoffer BIT OUTPUT
AS
IF (EXISTS (SELECT * 
			FROM offersOnProduct
			WHERE serial_no=@serial))
BEGIN
	IF (EXISTS (SELECT *
				FROM offer O INNER JOIN offersOnProduct OP ON O.offer_id = OP.offer_id
				WHERE O.expirydate > CURRENT_TIMESTAMP))
	BEGIN
	SET @activeoffer =1
	END
	ELSE 
	BEGIN 
	SET @activeoffer =0
	END
END
ELSE 
BEGIN 
SET @activeoffer = 0
END

--

GO 
CREATE PROC checkandremoveExpiredoffer
@offerid int
AS
DECLARE @amount decimal(10,2)
IF EXISTS (SELECT * FROM offer WHERE offer_id=@offerid AND expirydate < CURRENT_TIMESTAMP )
BEGIN
	SELECT @amount = offer_amount
	FROM offer
	WHERE offer_id = @offerid

	UPDATE Product
	SET final_price = final_price + (price * (@amount * 0.01))
	WHERE serial_no IN ( SELECT P.serial_no
						 FROM Product P INNER JOIN offersOnProduct OP  ON P.serial_no = OP.serial_no
						 WHERE OP.offer_id = @offerid)

	DELETE FROM offersOnProduct
	WHERE offer_id=@offerid

	DELETE FROM offer
	WHERE offer_id=@offerid  

END


--UPDATE PRICE , CAN A VENDOR ADD AN OFFER HE DIDNT CREATE TO HIS PRODUCT???????
GO 
CREATE PROC applyOffer
@vendorname varchar(20),
@offerid int,
@serial int
AS
DECLARE @offeramount int
DECLARE @oldprice DECIMAL(10,2)
DECLARE @active BIT
IF EXISTS (SELECT * FROM Product WHERE vendor_username=@vendorname AND serial_no=@serial AND available = 1)
AND EXISTS (SELECT * FROM offer WHERE offer_id=@offerid AND expirydate > CURRENT_TIMESTAMP)
BEGIN
	EXEC checkOfferonProduct @serial , @active OUTPUT
	IF (@active = 0)
	BEGIN
	INSERT INTO offersOnProduct (offer_id , serial_no)
	VALUES (@offerid,@serial)

	SELECT @offeramount=offer_amount
	FROM offer
	WHERE offer_id=@offerid

	SELECT @oldprice = final_price
	FROM Product
	WHERE serial_no=@serial

	UPDATE Product
	SET final_price = price - (price * (@offeramount * 0.01))
	WHERE serial_no = @serial
	END
	ELSE 
	BEGIN
		IF (@active = 1)
		BEGIN
	PRINT 'THE product has an active offer'
	END
	END
END
ELSE 
BEGIN 
PRINT 'wrong entries'
END


--ADMIN

--a)

GO 
CREATE PROC activateVendors
@admin_username varchar(20),
@vendor_username varchar(20)
AS 
IF (EXISTS (SELECT *
			FROM Admins
			WHERE username = @admin_username))
BEGIN
	IF( EXISTS (SELECT *
				FROM Vendor
				WHERE username = @vendor_username))
	BEGIN
	UPDATE Vendor 
	SET activated=1, admin_username = @admin_username
	WHERE username = @vendor_username
	END 
	ELSE 
	BEGIN
	PRINT ' wrong vendor name'
	END
END
ELSE 
BEGIN 
PRINT 'wrong admin name'
END

--b)

GO 
CREATE PROC inviteDeliveryPerson
@delivery_username varchar(20),
@delivery_email varchar(50)
AS
IF (@delivery_username NOT IN( SELECT username 
							   FROM Users))
BEGIN
	INSERT INTO Users(username,email)
	VALUES(@delivery_username,@delivery_email)
	INSERT INTO Delivery_Person (username,is_activated)
	VALUES (@delivery_username,0)
END
ELSE
BEGIN
	Print 'username already taken'
END

--c)

GO
CREATE PROC reviewOrders 
AS
SELECT *
FROM Orders

--d)

GO
CREATE PROC updateOrderStatusInProcess
@order_no int 
AS
IF (EXISTS (SELECT *
			FROM Orders
			WHERE order_no = @order_no))
BEGIN
UPDATE Orders
SET order_status='in process'
WHERE order_no = @order_no
END 
ELSE 
BEGIN 
PRINT ' wrong order number'
END

--e)

GO
CREATE PROC addDelivery
@delivery_type varchar(20),
@time_duration int,
@fees decimal(5,3),
@admin_username varchar(20)
AS
IF ( EXISTS (SELECT *
			FROM Admins
			WHERE username = @admin_username))
BEGIN
INSERT INTO Delivery (d_type,time_duration,fees,username)
VALUES (@delivery_type,@time_duration,@fees,@admin_username)
END
ELSE 
BEGIN 
PRINT ' wrong admin name'
END

--f)

GO 
CREATE PROC assignOrdertoDelivery
@delivery_username varchar(20),
@order_no int,
@admin_username varchar(20)
AS  
IF (EXISTS (SELECT *
			FROM Delivery_Person
			WHERE username = @delivery_username))
BEGIN 
	IF (EXISTS (SELECT *
				FROM Admins
				WHERE username = @admin_username))
	BEGIN
		INSERT INTO Admin_Delivery_Order (delivery_username,order_no,admin_username)
		VALUES(@delivery_username,@order_no,@admin_username)
	END
	ELSE 
	BEGIN 
	PRINT 'wrong admin name'
	END
END
ELSE 
BEGIN 
PRINT 'wrong delivery person name'
END

--g)

GO
CREATE PROC createTodaysDeal
@deal_amount int,
@admin_username varchar(20),
@expiry_date datetime
AS
IF (EXISTS (SELECT *
			FROM Admins
			WHERE username = @admin_username))
BEGIN
INSERT INTO Todays_Deals (deal_amount,expirydate,admin_username)
VALUES (@deal_amount,@expiry_date,@admin_username)
END
ELSE
BEGIN 
PRINT 'wrong admin name'
END


GO
CREATE PROC checkTodaysDealOnProduct
@serial_no INT,
@activeDeal BIT OUTPUT

AS
IF((EXISTS(
	SELECT deal_id
	FROM Todays_Deals_Product
	WHERE serial_no=@serial_no 
	))AND EXISTS (SELECT *
				  FROM Todays_Deals_Product TP INNER JOIN Todays_Deals T ON TP.deal_id = T.deal_id
				  WHERE T.expirydate > CURRENT_TIMESTAMP))
BEGIN
	SET @activeDeal = 1
END
Else
BEGIN
	SET @activeDeal = 0
END


GO
CREATE PROC  addTodaysDealOnProduct
@deal_id int,
@serial_no int 

AS
DECLARE @activeDealExists BIT
DECLARE @amount decimal(10,2)
DECLARE @prevDeal int 

IF (EXISTS (SELECT *
			FROM Todays_Deals
			WHERE deal_id = @deal_id))
BEGIN

EXEC checkTodaysDealOnProduct @serial_no,@activeDealExists OUTPUT
IF(@activeDealExists=1)
BEGIN
	PRINT 'Active deal already exists'
END
ELSE
BEGIN
	IF (EXISTS (SELECT *
				FROM Todays_Deals_Product
				WHERE serial_no = @serial_no))
		BEGIN
		SELECT @prevDeal = deal_id 
		FROM Todays_Deals_Product
		WHERE serial_no = @serial_no

		IF (EXISTS (SELECT *
					FROM Todays_Deals
					WHERE deal_id = @prevDeal AND expirydate < CURRENT_TIMESTAMP))
			BEGIN 
			EXEC removeExpiredDeal @prevDeal 
			END
		END
	ELSE 
	BEGIN
	IF (EXISTS (SELECT *
				FROM Product
				WHERE serial_no = @serial_no AND available = 1))
	BEGIN
		INSERT INTO Todays_Deals_Product (deal_id, serial_no)
		VALUES (@deal_id,@serial_no)

		SELECT @amount = deal_amount 
		FROM Todays_Deals
		WHERE deal_id = @deal_id

		UPDATE Product
		SET final_price = price - (price * (@amount * 0.01)) 
		WHERE serial_no = @serial_no
	END
ELSE 
BEGIN
PRINT ' the product is not available'
END
END
END
END
ELSE 
BEGIN 
PRINT ' there is no deal with this id'
END



GO
CREATE PROC removeExpiredDeal
@deal_id INT
AS
DECLARE @expiry date
DECLARE @amount decimal(10,2)

IF( EXISTS (SELECT *
			FROM Todays_Deals
			WHERE deal_id = @deal_id))
BEGIN

SELECT @expiry = expirydate
FROM Todays_Deals
WHERE deal_id = @deal_id

IF (@expiry < CURRENT_TIMESTAMP)
BEGIN
SELECT @amount = deal_amount
FROM Todays_Deals
WHERE deal_id = @deal_id
UPDATE Product
SET final_price = final_price + (price * (@amount * 0.01))
WHERE serial_no IN ( SELECT serial_no
			FROM Todays_Deals_Product
			WHERE deal_id = @deal_id)

DELETE FROM Todays_Deals_Product
WHERE deal_id=@deal_id

DELETE FROM Todays_Deals
WHERE deal_id=@deal_id 
END
ELSE 
BEGIN
PRINT 'the deal did not expire yet'
END
END
ELSE 
BEGIN 
PRINT 'there is no deal with this id'
END


--h)
GO
CREATE PROC createGiftCard
@code varchar(10),
@expiry_date datetime,
@amount int,
@admin_username varchar(20)
AS
IF ((EXISTS (SELECT *
			FROM Admins
			WHERE username = @admin_username)))
BEGIN
INSERT INTO Giftcard (code, expirydate, amount, username)
VALUES (@code, @expiry_date, @amount, @admin_username)
END
ELSE 
BEGIN 
PRINT 'wrong admin name'
END

--i)

GO
CREATE PROC removeExpiredGiftCard
@code varchar(10)

AS
DECLARE @expiry DATE
DECLARE @points int
SELECT @expiry = expirydate
FROM Giftcard
WHERE code = @code

IF ( @expiry < CURRENT_TIMESTAMP)
BEGIN
SELECT @points = amount
FROM Giftcard
WHERE code = @code

UPDATE Customer
SET points = points - @points
WHERE username IN (SELECT customer_name
					FROM Admin_Customer_Giftcard
					WHERE code = @code )
DELETE FROM Admin_Customer_Giftcard
WHERE code=@code

DELETE FROM Giftcard
WHERE code=@code
END
ELSE 
BEGIN 
PRINT ' the card did not expire yet'
END


GO
CREATE PROC checkGiftCardOnCustomer
@code varchar(10),
@activeGiftCard BIT OUTPUT

AS
DECLARE @expiry DATE
IF (EXISTS (SELECT *
			FROM Giftcard
			WHERE code = @code))
BEGIN
IF(EXISTS(
	SELECT customer_name
	FROM Admin_Customer_Giftcard
	WHERE code=@code
	))
BEGIN
	
	SELECT @expiry = expirydate
	FROM Giftcard
	WHERE code = @code

	IF ( @expiry > CURRENT_TIMESTAMP)
		BEGIN
		SET @activeGiftCard = 1
		END
Else
BEGIN
	SET @activeGiftCard = 0
END
END
ELSE 
BEGIN 
SET @activeGiftCard = 0
END
END
ELSE 
BEGIN 
PRINT 'wrong code '
END


GO
CREATE PROC giveGiftCardtoCustomer
@code varchar(10),
@customer_name varchar(20),
@admin_username varchar(20)

AS
DECLARE @activeOfferExists BIT
DECLARE @start_amount int
DECLARE @expiry DATE

SELECT @start_amount = amount , @expiry = expirydate
FROM Giftcard
WHERE code=@code

EXEC checkGiftCardOnCustomer @code ,@activeOfferExists OUTPUT
IF(@activeOfferExists=1)
BEGIN
	PRINT 'Active giftcard already exists'
END
ELSE
BEGIN
	IF( @expiry > CURRENT_TIMESTAMP)
	BEGIN
	UPDATE Customer
	SET points = points + @start_amount
	WHERE username = @customer_name
	INSERT INTO Admin_Customer_Giftcard (code, customer_name, admin_username , remaining_points)
	VALUES (@code,@customer_name,@admin_username,@start_amount)
    END
	ELSE 
	BEGIN 
	PRINT 'expired card'
	END
END


GO 
CREATE PROC acceptAdminInvitation
@delivery_username varchar(20)
AS 
IF ( EXISTS (SELECT *
			 FROM Delivery_Person
			 WHERE username = @delivery_username))
	BEGIN 
	UPDATE Delivery_Person
	SET is_activated = 1 WHERE username = @delivery_username
	END
ELSE 
BEGIN 
PRINT ' wrong entry '
END


GO 
CREATE PROC deliveryPersonUpdateInfo
@username varchar(20),
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@email varchar(50)
AS 
IF (EXISTS (SELECT *
			FROM Delivery_Person
			WHERE username = @username AND is_activated = 1))
BEGIN
UPDATE Users 
SET Users.email = @email , Users.first_name = @first_name , Users.last_name = @last_name , Users.pass_word = @password 
WHERE Users.username = @username
END 
ELSE 
BEGIN 
PRINT 'wrong username'
END


GO 
CREATE PROC viewmyorders
@deliveryperson varchar(20)
AS 
IF (EXISTS (SELECT *
			FROM Admin_Delivery_Order
			WHERE delivery_username = @deliveryperson ))
BEGIN 
SELECT O.*
FROM Orders O INNER JOIN Admin_Delivery_Order A ON O.order_no = A.order_no
WHERE A.delivery_username = @deliveryperson 
END
ELSE 
BEGIN 
PRINT 'wrong entries'
END


GO
CREATE PROC specifyDeliveryWindow
@delivery_username varchar(20),
@order_no int,
@delivery_window varchar(50)
AS
IF (EXISTS (SELECT *
			FROM Admin_Delivery_Order
			WHERE delivery_username = @delivery_username AND order_no = @order_no))
BEGIN
UPDATE Admin_Delivery_Order
SET delivery_window = @delivery_window
WHERE delivery_username = @delivery_username AND order_no = @order_no
END
ELSE 
BEGIN 
PRINT 'wrong entries'
END


GO 
CREATE PROC updateOrderStatusOutforDelivery
@order_no int
AS 
IF (EXISTS (SELECT *
			FROM Orders
			WHERE order_no = @order_no))
BEGIN 
UPDATE Orders
SET order_status = 'out for delivery'
WHERE order_no = @order_no
END 
ELSE 
BEGIN 
PRINT ' wrong order number'
END 


GO 
CREATE PROC updateOrderStatusDelivered
@order_no int
AS 
IF (EXISTS (SELECT *
			FROM Orders
			WHERE order_no = @order_no))
BEGIN 
UPDATE Orders
SET order_status = 'delivered'
WHERE order_no = @order_no
END 
ELSE 
BEGIN 
PRINT ' wrong order number'
END
-------------------------------------------------------------------------------------------


INSERT INTO Users (username , first_name , last_name , pass_word , email)
VALUES ('hana.aly' , 'hana' , 'aly' , 'pass1' , 'hana.aly@guc.edu.eg')

INSERT INTO Users (username , first_name , last_name , pass_word , email)
VALUES('ammar.yasser' , 'ammar' , 'yasser' , 'pass4' , 'ammar.yasser@guc.edu.eg')

INSERT INTO Users (username , first_name , last_name , pass_word , email)
VALUES('nada.sharaf' , 'nada' , 'sharaf' , 'pass7' , 'nada.sharaf@guc.edu.eg')

INSERT INTO Users (username , first_name , last_name , pass_word , email)
VALUES('hadeel.adel' , 'hadeel' , 'adel' , 'pass13' , 'hadeel.adel@guc.edu.eg')

INSERT INTO Users (username , first_name , last_name , pass_word , email)
VALUES('mohamed.tamer' , 'mohamed' , 'tamer' , 'pass16' , 'mohamed.tamer@guc.edu.eg')

INSERT INTO Admins (username)
VALUES ('hana.aly')

INSERT INTO Admins (username)
VALUES ('nada.sharaf')

INSERT INTO Customer (username , points)
VALUES ('ammar.yasser' , 15)

INSERT INTO Vendor (username , activated , company_name , bank_acc_no , admin_username)
VALUES ('hadeel.adel' , '1' , 'Dello', '47449349234', 'hana.aly')

INSERT INTO Product (product_name , category , product_description , price , final_price , color , available , rate , vendor_username)
VALUES ('Bag' , 'Fashion' , 'backbag' , 100 , 100 , 'yellow' , 1 , 0 , 'hadeel.adel')

INSERT INTO Product (product_name , category , product_description , price , final_price , color , available , rate , vendor_username)
VALUES('Blue pen' , 'stationary' , 'useful pen' , 10 , 10 , 'Blue' , 1 , 0 , 'hadeel.adel')

INSERT INTO Product (product_name , category , product_description , price , final_price , color , available , rate , vendor_username)
VALUES('Blue pen' , 'stationary' , 'useful pen' , 10 , 10 , 'Blue' , 0 , 0 , 'hadeel.adel')

INSERT INTO CustomerAddstoCartProduct (serial_no , customer_name)
VALUES (1  , 'ammar.yasser')

INSERT INTO Delivery_Person (is_activated , username)
VALUES ( 1  , 'mohamed.tamer')

INSERT INTO User_Addresses (uaddress , username)
VALUES ( 'New Cairo' , 'hana.aly')

INSERT INTO User_Addresses (uaddress , username)
VALUES('Heliopolis' , 'hana.aly')

INSERT INTO User_mobile_numbers (username , mobile_number)
VALUES ( 'hana.aly' , '01111111111')

INSERT INTO User_mobile_numbers (username , mobile_number)
VALUES('hana.aly' , '1211555411') 

INSERT INTO Credit_Card (number , expirydate , cvv_code)
VALUES  ('4444-5555-6666-8888' , '2028-10-19' , '232')

INSERT INTO Delivery (d_type , time_duration , fees)
VALUES ('pick-up' , 7 , 10)

INSERT INTO Delivery (d_type , time_duration , fees)
VALUES ('regular' , 14 , 30)

INSERT INTO Delivery (d_type , time_duration , fees)
VALUES ('speedy' , 1 , 50)

INSERT INTO Todays_Deals ( deal_amount , admin_username , expirydate)
VALUES ( 30 , 'hana.aly' , '2019/11/30')

INSERT INTO Todays_Deals ( deal_amount , admin_username , expirydate)
VALUES(40 , 'hana.aly' , '2019/11/18')

INSERT INTO Todays_Deals ( deal_amount , admin_username , expirydate)
VALUES(50, 'hana.aly' , '2019/12/12')

--INSERT INTO Todays_Deals ( deal_amount , admin_username , expirydate)
--VALUES( 10, 'sama.walid', '2019/11/12')

INSERT INTO offer (offer_amount , expirydate)
VALUES ( 50 , '2019/11/30')

INSERT INTO Wishlist (username , uname)
VALUES ('ammar.yasser' , 'fashion')

INSERT INTO Wishlist_Product (username , wish_name, serial_no)
VALUES ('ammar.yasser' , 'fashion' , 2)

INSERT INTO Giftcard ( code , expirydate , amount)
VALUES ('G101' , '2019/11/18', 100)

INSERT INTO Customer_CreditCard (customer_name , cc_number)
VALUES ('ammar.yasser' , '4444-5555-6666-8888')

--customerRegister (username, first_name, last_name, pass_word, email) 
EXEC customerRegister 'ahmed.ashraf' , 'ahmed' , 'ashraf' , 'pass123' , 'ahmed@yahoo.com'

--vendorRegister (username, first_name, last_name, pass_word, email) (username , company_name , bank_acc_no)
EXEC vendorRegister 'eslam.mahmod' , 'eslam' , 'mahmod' , 'pass1234' , 'hopa@gmail.com' , 'Market' , '132132513'

-- userLogin @username varchar(20),  @password varchar(20), @success BIT OUTPUT, @type int OUTPUT
DECLARE @success BIT 
DECLARE @type int
EXEC userLogin 'eslam.mahmod' , 'pass123' ,  @success OUTPUT , @type OUTPUT 
PRINT 'success = ' PRINT @success
PRINT 'type = ' PRINT @type

DECLARE @success BIT 
DECLARE @type int
EXEC userLogin 'eslam.mahmod' , 'pass1234' ,  @success OUTPUT , @type OUTPUT 
PRINT 'success = ' PRINT @success
PRINT 'type = ' PRINT @type

DECLARE @success BIT 
DECLARE @type int
EXEC userLogin 'ahmed.ashraf' , 'pass123' ,  @success OUTPUT , @type OUTPUT 
PRINT 'success = ' PRINT @success
PRINT 'type = ' PRINT @type

DECLARE @success BIT 
DECLARE @type int
EXEC userLogin 'ahmed.ashraf' , 'pass' ,  @success OUTPUT , @type OUTPUT 
PRINT 'success = ' PRINT @success
PRINT 'type = ' PRINT @type

-- addMobile @username varchar(20), @mobile_number varchar(20)
EXEC addMobile 'ahmed.ashraf' , '01111211122'

EXEC addMobile 'ahmed.ashraf' , ' 0124262652'

--addAddress @username varchar(20), @address varchar(100)
EXEC addAddress 'ahmed.ashraf' , 'nasr city'

EXEC showProducts

EXEC showProductsbyPrice

-- searchbyname @text varchar(20)
EXEC searchbyname 'blue'

--AddQuestion @serial int, @customer varchar(20), @Question varchar(50)
EXEC AddQuestion 1 ,'ahmed.ashraf' ,'size?'

--addToCart @customername varchar(20), @serial int
EXEC addToCart 'ahmed.ashraf' , 1

EXEC addToCart 'ahmed.ashraf', 2

EXEC addToCart 'ammar.yasser' , 1

EXEC removefromCart 'ahmed.ashraf' , 2

-- createWishlist @customername varchar(20), @name varchar(20)
EXEC createWishlist  'ahmed.ashraf' ,'fashion'

-- AddtoWishlist @customername varchar(20), @wishlistname varchar(20), @serial int
EXEC AddtoWishlist 'ahmed.ashraf','fashion',1

EXEC AddtoWishlist 'ahmed.ashraf','fashion',2

--removefromWishlist @customername varchar(20), @wishlistname varchar(20),  @serial int
EXEC removefromWishlist 'ahmed.ashraf','fashion',1

--showWishlistProduct @customername varchar(20),  @name varchar(20)
EXEC showWishlistProduct 'ahmed.ashraf','fashion'

EXEC viewMyCart 'ahmed.ashraf'

--calculatepriceOrder @customername varchar(20), @sum decimal(10,2) OUTPUT
DECLARE @sum decimal(10,2)
EXEC calculatepriceOrder 'ahmed.ashraf' , @sum OUTPUT
PRINT @sum

EXEC makeOrder 'ahmed.ashraf'
--EXEC productsinorder 'ahmed.ashraf' , 1

EXEC cancelOrder 6

EXEC returnProduct 1 , 3

--rate @serial_no int, @rate int, @customername varchar(20)
EXEC rate 1 , 3 , 'ahmed.ashraf'
DECLARE @days INT
EXEC trackRemainingDays 2 , 'ahmed.ashraf' , @days OUTPUT


EXEC AddCreditCard '4444-5555-6666-8888' , '2028/10/19' , '232' ,'ahmed.ashraf'

EXEC ChooseCreditCard '4444-5555-6666-8888' , 1


EXEC vewDeliveryTypes

EXEC recommmend 'ahmed.ashraf'

--postProduct@vendorUsername varchar(20),@product_name varchar(20),@category varchar(20),@product_description text, @price decimal(10,2), @color varchar(20)
EXEC postProduct 'eslam.mahmod' , 'pencil' , 'stationary' ,'HB0.7' , 10 , 'red'

EXEC vendorviewProducts 'eslam.mahmod'

EXEC EditProduct 'eslam.mahmod' , 5 , NULL ,NULL , NULL , NULL , 'blue'

EXEC deleteProduct 'eslam.mahmod' , 5

EXEC viewQuestions 'hadeel.adel'

EXEC answerQuestions 'hadeel.adel' , 1 , 'ahmed.ashraf' , '40'

EXEC ShowproductsIbought 'ahmed.ashraf'

EXEC specifydeliverytype 2 , 1

EXEC SpecifyAmount 'ahmed.ashraf' , 2, 40 , NULL

EXEC addOffer 50 , '2019/10/11'

EXEC applyOffer 'hadeel.adel' , 1 , 1

DECLARE @active BIT
EXEC checkOfferonProduct 1 , @active OUTPUT
PRINT @active

EXEC checkandremoveExpiredoffer 3

EXEC activateVendors 'hana.aly' , 'eslam.mahmod' 

EXEC inviteDeliveryPerson 'mohamed.tamer' , 'moha@gmail.com' 

EXEC reviewOrders

EXEC updateOrderStatusInProcess 1

EXEC addDelivery 'pick-up' , 7 , 10 , 'hana.aly'

EXEC assignOrderToDelivery 'mohamed.tamer' , 1 , 'hana.aly'

EXEC createTodaysDeal 30 , 'hana.aly' , '2019/11/30' 

EXEC addTodaysDealOnProduct 4 , 2

DECLARE @active BIT
EXEC checkTodaysDealOnProduct 2, @active OUTPUT
PRINT @active

EXEC removeExpiredDeal 2

EXEC createGiftCard 'G101' , '2019/12/30' , 100 , 'hana.aly'

EXEC createGiftCard 'G102' , '2019/11/17' , 100 , 'hana.aly'

EXEC giveGiftCardtoCustomer 'G101' , 'ahmed.ashraf' , 'hana.aly'

DECLARE @active BIT
EXEC checkGiftCardOnCustomer 'G101' , @active OUTPUT
PRINT @active

EXEC removeExpiredGiftCard 'G102'

EXEC acceptAdminInvitation 'mohamed.tamer'

EXEC deliveryPersonUpdateInfo 'mohamed.tamer', 'mohamed' , 'tamer' , 'pass16' , 'mohamed.tamer@guc.edu.eg' 

EXEC viewmyorders 'mohamed.tamer'

EXEC specifyDeliveryWindow 'mohamed.tamer' , 1 , 'Today between 10 am and 3 pm'

EXEC updateOrderStatusOutforDelivery 1

EXEC updateOrderStatusDelivered 1

EXEC recommmend'ahmed.ashraf'

EXEC rate 1 , 3 , 'ahmed.ashraf'

EXEC ShowproductsIbought 'ahmed.ashraf'

EXEC SpecifyAmount 'ahmed.ashraf' , 1 , 30.00 , NULL

EXEC returnProduct 1 , 1

EXEC cancelOrder 1
