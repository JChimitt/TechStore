-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2022 at 03:33 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_tech_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `addressID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `line1` varchar(60) NOT NULL,
  `line2` varchar(60) DEFAULT NULL,
  `city` varchar(40) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`addressID`, `customerID`, `line1`, `line2`, `city`, `state`, `zipCode`, `phone`, `disabled`) VALUES
(1, 1, '100 East Ridgewood Ave.', '', 'Paramus', 'NJ', '07652', '201-653-4472', 0),
(2, 1, '21 Rosewood Rd.', '', 'Woodcliff Lake', 'NJ', '07677', '201-653-4472', 0),
(3, 2, '16285 Wendell St.', '', 'Omaha', 'NE', '68135', '402-896-2576', 0),
(4, 2, '16285 Wendell St.', '', 'Omaha', 'NE', '68135', '402-896-2576', 0),
(5, 3, '19270 NW Cornell Rd.', '', 'Beaverton', 'OR', '97006', '503-654-1291', 0),
(6, 3, '19270 NW Cornell Rd.', '', 'Beaverton', 'OR', '97006', '503-654-1291', 0);

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE `administrators` (
  `adminID` int(11) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`adminID`, `emailAddress`, `password`, `firstName`, `lastName`) VALUES
(1, 'admin@techshop.com', 'admin', 'Admin', 'User'),
(2, 'jake@techshop.com', 'jake123', 'Jake', 'Chimitt');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryID`, `categoryName`) VALUES
(1, 'Computers'),
(2, 'Phones'),
(3, 'Consoles');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `uname` varchar(16) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstName` varchar(60) NOT NULL,
  `lastName` varchar(60) NOT NULL,
  `shipAddressID` int(11) DEFAULT NULL,
  `billingAddressID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerID`, `userID`, `uname`, `emailAddress`, `password`, `firstName`, `lastName`, `shipAddressID`, `billingAddressID`) VALUES
(4, 20, 'jchimitt', 'jchimitt@gmail.com', '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `itemID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `itemPrice` decimal(10,2) NOT NULL,
  `discountAmount` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`itemID`, `orderID`, `productID`, `itemPrice`, `discountAmount`, `quantity`) VALUES
(1, 1, 2, '399.00', '39.90', 1),
(2, 2, 4, '699.00', '69.90', 1),
(3, 3, 3, '499.00', '49.90', 1),
(4, 3, 6, '549.99', '0.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `orderDate` datetime NOT NULL,
  `shipAmount` decimal(10,2) NOT NULL,
  `taxAmount` decimal(10,2) NOT NULL,
  `shipDate` datetime DEFAULT NULL,
  `shipAddressID` int(11) NOT NULL,
  `cardType` int(11) NOT NULL,
  `cardNumber` char(16) NOT NULL,
  `cardExpires` char(7) NOT NULL,
  `billingAddressID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `customerID`, `username`, `orderDate`, `shipAmount`, `taxAmount`, `shipDate`, `shipAddressID`, `cardType`, `cardNumber`, `cardExpires`, `billingAddressID`) VALUES
(1, 1, '', '2017-05-30 09:40:28', '5.00', '32.32', '2017-06-01 09:43:13', 1, 2, '4111111111111111', '04/2022', 2),
(2, 2, '', '2017-06-01 11:23:20', '5.00', '0.00', NULL, 3, 2, '4111111111111111', '08/2021', 4),
(3, 1, '', '2017-06-03 09:44:58', '10.00', '89.92', NULL, 1, 2, '4111111111111111', '04/2022', 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `productCode` varchar(10) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `listPrice` decimal(10,2) NOT NULL,
  `discountPercent` decimal(10,2) NOT NULL DEFAULT 0.00,
  `dateAdded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `categoryID`, `productCode`, `productName`, `description`, `listPrice`, `discountPercent`, `dateAdded`) VALUES
(1, 1, 'Acer', 'Acer Predator Triton 300 SE', 'The Acer Predator Triton 300 SE is a mid level gaming laptop.', '1399.99', '15.00', '2021-10-31 09:32:40'),
(2, 1, 'MSI', 'MSI Katana GF66', 'The MSI Katana GF66 is a more entry level gaming laptop.', '999.99', '15.00', '2021-12-30 16:33:13'),
(3, 1, 'Razer', 'Razer Blade 15 Advanced Model', 'This Razer laptop is a high end gaming laptop.', '2199.99', '25.00', '2022-02-16 11:04:31'),
(4, 2, 'Apple', 'Apple iPhone 13', 'The Apple iPhone 13 is the main model of Apple\'s current phone line.', '829.00', '12.00', '2021-06-16 11:12:59'),
(5, 2, 'Samsung', 'Samsung Galaxy S22 Plus', 'The Samsung Galaxy S22 Plus is the base model of their most recent line of phones.', '800.00', '12.00', '2022-07-20 13:58:35'),
(6, 2, 'Google', 'Google Pixel 6 Pro', 'This phone is the base model for Google\'s most recent line of phones.', '899.00', '12.00', '2021-07-21 14:12:41'),
(7, 3, 'Microsoft', 'Microsoft - Xbox Series X', 'This is the Microsoft - Xbox Series X with 1TB of memory. This is the black colored model.', '499.99', '15.00', '2021-06-01 11:29:35'),
(8, 3, 'Sony', 'Sony - Playstation 5 Console', 'This is the base model of Sony\'s playstation consoles.', '499.99', '15.00', '2021-07-01 14:18:33'),
(9, 3, 'NinJoy', 'Nintendo Switch 32GB Console', 'This is the dockable Nintendo Switch 32GB Console with Joycons.', '299.99', '15.00', '2021-07-01 12:46:40'),
(10, 3, 'NinLite', 'Nintendo - Switch 32GB Lite', 'This is the handheld Nintendo Switch console with no Joycons.', '199.99', '15.00', '2021-07-01 13:14:15'),
(16, 2, 'TEST', 'TESTER', '', '192.99', '0.00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`addressID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerID`),
  ADD UNIQUE KEY `emailAddress` (`emailAddress`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`),
  ADD UNIQUE KEY `productCode` (`productCode`),
  ADD KEY `categoryID` (`categoryID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `addressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `administrators`
--
ALTER TABLE `administrators`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
