USE FlipFitDB;
/* 12:17:35	CREATE TABLE Users(     user_id varchar(255) PRIMARY KEY,     user_name varchar(255),     user_password varchar(255),    
 user_email varchar(255),     role_details varchar(255),     FOREIGN KEY (role_details) references Roles(role_details) )
 Error Code: 1822. Failed to add the foreign key constraint. Missing index for constraint 'users_ibfk_1' in the referenced table 'Roles'	0.0014 sec
*/
SELECT * FROM Bookings;


                     
CREATE TABLE 
Roles(role_id INT AUTO_INCREMENT PRIMARY KEY, 
Role_type varchar(255) UNIQUE, role_details varchar(255));


ALTER TABLE Bookings MODIFY booking_id INT;
ALTER TABLE Bookings 
MODIFY COLUMN booking_id INT AUTO_INCREMENT;

CREATE TABLE Users(
    user_id varchar(255) PRIMARY KEY,
    user_name varchar(255),
    user_password varchar(255),
    user_email varchar(255),
    Role_type varchar(255) 
 
);
ALTER TABLE Users MODIFY user_id INT AUTO_INCREMENT;
/*
create table Center(center_id varchar(255) PRIMARY KEY,owner_id varchar(255),area varchar(255),city varchar(255), pincode varchar(255),center_status varchar(255),FOREIGN KEY(owner_id) references GymOwner(owner_id));
create table SlotDetails(slot_id varchar(255) PRIMARY KEY, center_id varchar(255), start_time TIME,end_time TIME, total_number_of_seats INT,FOREIGN KEY(center_id) references Center(center_id));
create table GymOwner(owner_id varchar(255) PRIMARY KEY, owner_name varchar(255),phone_number varchar(255), gst_number varchar(255), gym_owner_status varchar(255));
create table SlotStatus(slot_status_id varchar(255) PRIMARY KEY, slot_id varchar(255),days varchar(255), no_of_booked_seats);
create table AdminTable(admin_id INT AUTO_INCREMENT PRIMARY KEY, id INT, name varchar(255),email varchar(255), phone varchar(255),password varchar(255),FOREIGN KEY(id) REFERENCES TO Users(user_id));
create table Customer(customer_id INT AUTO_INCREMENT PRIMARY KEY, id INT, name varchar(255),email varchar(255), phone varchar(255),password varchar(255),FOREIGN KEY(id) REFERENCES TO Users(user_id));
create table Bookings(booking_id INT AUTO_INCREMENT PRIMARY KEY, customer_id INT, timestamp TIME,booking_status varchar(255), days INT,FOREIGN KEY(customer_id) REFERENCES TO Users(customer_id));

*/

DROP TABLE Center,Slot,GymOwner,SlotStatus;



ALTER TABLE Users
ADD CONSTRAINT myconstaint
FOREIGN KEY(Role_type) 
REFERENCES ROLES(Role_type);


SELECT * FROM Customer;

SELECT * FROM GymOwner;

ALTER TABLE GymOwner
 ADD pan_number varchar(255);
 
ALTER TABLE GymOwner 
ADD aadhar_number varchar(255);



CREATE TABLE Payment(payment_id INT PRIMARY KEY AUTO_INCREMENT,booking_id INT,FOREIGN KEY(booking_id) REFERENCES Bookings(booking_id));

ALTER TABLE Payment MODIFY COLUMN payment_id BIGINT AUTO_INCREMENT;

CREATE TABLE GymOwner(owner_id INT PRIMARY KEY AUTO_INCREMENT, id INT, owner_name varchar(255),phone_number varchar(255), gst_number varchar(255), gym_owner_status varchar(255),FOREIGN KEY(id) REFERENCES Users(user_id));


CREATE TABLE Slot(slot_id INT PRIMARY KEY AUTO_INCREMENT, center_id INT, start_time TIME, total_number_of_seats INT,FOREIGN KEY(center_id) references Center(center_id));

CREATE TABLE Center(center_id INT PRIMARY KEY AUTO_INCREMENT,owner_id INT,area varchar(255),city varchar(255), pincode varchar(255),center_status varchar(255),FOREIGN KEY(owner_id) references GymOwner(owner_id));

CREATE TABLE SlotStatus(slot_status_id INT AUTO_INCREMENT PRIMARY KEY, slot_id INT,days varchar(255), no_of_booked_seats INT,FOREIGN KEY(slot_id) REFERENCES Slot(slot_id));

DROP TABLE AdminTable,Customer,Bookings,Payment;


create table AdminTable(admin_id INT PRIMARY KEY AUTO_INCREMENT, id INT, admin_name varchar(255),email varchar(255), phone varchar(255),customer_password varchar(255),FOREIGN KEY(id) REFERENCES  Users(user_id));
create table Customer(customer_id INT AUTO_INCREMENT PRIMARY KEY, id INT, customer_name varchar(255),email varchar(255), phone varchar(255),customer_password varchar(255),FOREIGN KEY(id) REFERENCES Users(user_id));
create table Bookings(booking_id INT AUTO_INCREMENT PRIMARY KEY, customer_id INT, timestamp TIME,booking_status varchar(255), days INT,FOREIGN KEY(customer_id) REFERENCES  Customer(customer_id));


ALTER TABLE AdminTable ADD COLUMN role_type varchar(255),
ADD FOREIGN KEY(Role_type) REFERENCES Roles(Role_type);


ALTER TABLE Customer ADD COLUMN role_type varchar(255),
ADD FOREIGN KEY(Role_type) REFERENCES Roles(Role_type);


ALTER TABLE GymOwner ADD COLUMN role_type varchar(255),
ADD FOREIGN KEY(Role_type) REFERENCES Roles(Role_type);

