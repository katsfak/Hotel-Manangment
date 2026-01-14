# 🏨 Hotel Management System

A comprehensive hotel management system built with Java and SQL for managing room reservations, user accounts, payments, and hotel operations.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Database Structure](#database-structure)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Database Schema](#database-schema)
- [Default Credentials](#default-credentials)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

This Hotel Management System is a desktop application designed to streamline hotel operations, including room bookings, customer management, payment processing, and room availability tracking. The system provides an intuitive interface for both administrators and customers to manage hotel reservations efficiently.

**Ελληνικά:** Αυτό το σύστημα διαχείρισης ξενοδοχείου είναι μια εφαρμογή υπολογιστή σχεδιασμένη για την απλοποίηση των λειτουργιών του ξενοδοχείου, συμπεριλαμβανομένων των κρατήσεων δωματίων, της διαχείρισης πελατών, της επεξεργασίας πληρωμών και της παρακολούθησης διαθεσιμότητας δωματίων.

## ✨ Features

### 🔐 User Management
- **Dual User Roles**: Administrator and Customer accounts
- **Secure Authentication**: Username and password-based login system
- **User Profiles**: Complete user information including name, email, phone, address, gender, nationality, and birthday
- **Customer Registration**: New customers can create their own accounts

### 🛏️ Room Management
- **Multiple Room Types**: 
  - Single rooms (Μονόκλινο)
  - Double rooms (Δίκλινο)
  - Family rooms (Οικογενειακό δωμάτιο)
  - Suites (Σουΐτα)
- **Room Capacity Tracking**: Monitor the number of guests each room can accommodate
- **Dynamic Pricing**: Different price points per night for each room type
- **Real-time Availability**:  Automatic room availability updates
- **Floor Management**: Organize rooms by floor number

### 📅 Reservation System
- **Easy Booking**: Create reservations with check-in and check-out dates
- **Room Assignment**: Link reservations to specific room numbers
- **User Tracking**: Associate reservations with customer accounts
- **Automated Availability Updates**: Daily event to update room availability

### 💳 Payment Processing
- **Multiple Payment Methods**: Support for various payment options
- **Secure Card Storage**: Store payment card information
- **Reservation Linking**: Link payments directly to reservations
- **Payment History**: Track all transactions

### 👨‍💼 Administrative Features
- **Complete Dashboard**: Overview of all hotel operations
- **Room Management**: Add, edit, and remove rooms
- **Reservation Oversight**: View and manage all customer reservations
- **User Management**:  Manage customer and staff accounts
- **Payment Tracking**: Monitor all financial transactions

## 🗄️ Database Structure

The system uses a MySQL database with four main tables:

### Tables Overview

1. **Users** - Stores customer and administrator information
2. **Rooms** - Contains room details, types, and availability
3. **Reservations** - Manages booking information
4. **Payments** - Tracks payment transactions

### Entity Relationships

```
Users (1) ──────< (N) Reservations
Rooms (1) ──────< (N) Reservations
Reservations (1) ──────< (N) Payments
```

## 💻 Technologies Used

| Technology | Purpose |
|------------|---------|
| **Java** | Core application logic and GUI |
| **Apache NetBeans** | Integrated Development Environment |
| **MySQL / MariaDB** | Database management system |
| **phpMyAdmin** | Database administration |
| **JDBC** | Java Database Connectivity |
| **Swing** | Java GUI framework |

## 🚀 Installation

### Prerequisites

Before installing the Hotel Management System, ensure you have: 

- **Java Development Kit (JDK)** 8 or higher
- **Apache NetBeans IDE** (recommended for development)
- **MySQL Server** or **MariaDB** 10.4.28 or higher
- **phpMyAdmin** (optional, for easier database management)

### Step-by-Step Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/katsfak/Hotel-Manangment.git
   cd Hotel-Manangment
   ```

2. **Extract the Application**
   ```bash
   unzip hotel.zip
   ```

3. **Set Up the Database**
   
   a. Start your MySQL/MariaDB server
   
   b. Open phpMyAdmin or MySQL command line
   
   c.  Create a new database: 
   ```sql
   CREATE DATABASE hotel;
   ```
   
   d. Import the database schema:
   ```bash
   mysql -u your_username -p hotel < hotel. sql
   ```
   
   Or use phpMyAdmin to import the `hotel. sql` file through the web interface.

4. **Configure Database Connection**
   
   Open the project in Apache NetBeans and locate the database connection configuration file.  Update the following parameters:
   
   ```java
   String url = "jdbc:mysql://localhost:3306/hotel";
   String username = "your_mysql_username";
   String password = "your_mysql_password";
   ```

5. **Build and Run**
   
   - Open the project in Apache NetBeans
   - Clean and build the project (Shift + F11)
   - Run the application (F6)

## ⚙️ Configuration

### Database Connection

The application connects to MySQL using JDBC. Default configuration: 

- **Host**: localhost
- **Port**: 3306
- **Database Name**: hotel
- **Character Set**: utf8mb4

### Time Zone Settings

The database is configured to use the `+00:00` timezone. Adjust if needed in the `hotel.sql` file:

```sql
SET time_zone = "+00:00";
```

### Automated Tasks

The system includes a scheduled event that runs daily to update room availability: 

```sql
CREATE EVENT `update_room_availability` 
ON SCHEDULE EVERY 1 DAY 
DO UPDATE rooms SET Availability = true WHERE ... 
```

## 📖 Usage

### For Administrators

1. **Login** with admin credentials
2. **Dashboard**: View overview of hotel operations
3. **Manage Rooms**: 
   - Add new rooms with type, capacity, price, and floor
   - Update room information
   - Set room availability
4. **View Reservations**: Monitor all customer bookings
5. **Manage Users**: View and manage customer accounts
6. **Process Payments**: Handle payment transactions

### For Customers

1. **Register** for a new account or **Login** with existing credentials
2. **Browse Rooms**: View available rooms with details and pricing
3. **Make Reservations**: 
   - Select check-in and check-out dates
   - Choose room type
   - Confirm booking
4. **Make Payments**: Complete payment for reservations
5. **View History**: Check your past and upcoming reservations

## 🗺️ Database Schema

### Users Table
```sql
- ID (Primary Key, Auto Increment)
- NAME (VARCHAR 100)
- EMAIL (VARCHAR 100)
- PHONE (VARCHAR 100)
- ADDRESS (VARCHAR 100)
- USERNAME (VARCHAR 100)
- PASSWORD (VARCHAR 100)
- CATEGORY (VARCHAR 100) -- ADMIN or CUSTOMER
- GENDER (VARCHAR 100)
- NATIONALITY (VARCHAR 100)
- BIRTHDAY (DATE)
```

### Rooms Table
```sql
- RoomNumber (Primary Key, VARCHAR 100)
- RoomType (VARCHAR 100)
- Capacity (INT)
- PricePerNight (DECIMAL 10,2)
- Availability (TINYINT 1) -- 0: Not Available, 1: Available
- FloorNumber (INT)
```

### Reservations Table
```sql
- ReservationID (Primary Key, Auto Increment)
- UserID (Foreign Key -> Users.ID)
- RoomNumber (Foreign Key -> Rooms. RoomNumber)
- CheckInDate (DATE)
- CheckOutDate (DATE)
```

### Payments Table
```sql
- PaymentID (Primary Key, Auto Increment)
- ReservationID (Foreign Key -> Reservations.ReservationID)
- PaymentMethod (VARCHAR 100)
- CardNumber (VARCHAR 100)
```

## 🔑 Default Credentials

The system comes with pre-configured accounts for testing:

### Administrator Account
- **Username**: `admin`
- **Password**: `admin`
- **Email**:  Adminhotel@gmail.com

### Test Customer Account
- **Username**: `testuser`
- **Password**: `12345`
- **Email**: testuser@email.com
- **Name**: test
- **Phone**: 6984374255
- **Address**:  Χρυσοστόμου 50
- **Gender**:  Αρσενικό (Male)
- **Nationality**: Ελληνική (Greek)
- **Birthday**: 1998-05-14

> ⚠️ **Security Warning**: Change these default credentials in a production environment!

## 🎨 Sample Rooms

The database includes sample rooms for testing:

| Room Number | Type | Capacity | Price/Night | Floor |
|-------------|------|----------|-------------|-------|
| 103 | Δίκλινο (Double) | 2 | €200.00 | 2 |
| 104 | Μονόκλινο (Single) | 1 | €100.00 | 1 |
| 106 | Μονόκλινο (Single) | 1 | €12.00 | 310 |
| 107 | Οικογενειακό (Family) | 4 | €300.00 | 3 |
| 108 | Σουΐτα (Suite) | 8 | €400.00 | 4 |

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'Add some AmazingFeature'`)
4. **Push** to the branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

## 📄 License

This project is available for educational and personal use. Please contact the repository owner for commercial use permissions.

## 👤 Author

**katsfak**
- GitHub: [@katsfak](https://github.com/katsfak)
