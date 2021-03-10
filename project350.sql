-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2021 at 09:11 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project350`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `buyer_id` varchar(15) NOT NULL,
  `buyer_name` text NOT NULL,
  `buyer_contact` int(11) NOT NULL,
  `buyer_address` text NOT NULL,
  `buyer_email` varchar(30) DEFAULT NULL,
  `buyer_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `buyer_id` varchar(15) NOT NULL,
  `product_id` varchar(15) NOT NULL,
  `vendor_id` varchar(15) NOT NULL,
  `date_order` date NOT NULL,
  `date_deliver` date DEFAULT NULL,
  `pcs` tinyint(4) NOT NULL,
  `comment` text DEFAULT NULL,
  `shipping_status` varchar(25) NOT NULL DEFAULT 'Pending',
  `rating` tinyint(1) DEFAULT NULL,
  `review` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` varchar(15) NOT NULL,
  `product_name` text NOT NULL,
  `manufacturer` text DEFAULT NULL,
  `product_details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `p_v`
--

CREATE TABLE `p_v` (
  `product_id` varchar(15) NOT NULL,
  `vendor_id` varchar(15) NOT NULL,
  `pcs_available` mediumint(9) NOT NULL,
  `price` mediumint(9) NOT NULL,
  `prod_condition` tinytext NOT NULL,
  `warranty` float NOT NULL,
  `prod_type` text NOT NULL,
  `picture` int(1) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `discount` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendor_id` varchar(15) NOT NULL,
  `vendor_name` text NOT NULL,
  `showroom_address` text NOT NULL,
  `contact_no` int(11) NOT NULL,
  `vendor_email` varchar(30) NOT NULL,
  `vendor_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD KEY `fk_o_product_id` (`product_id`),
  ADD KEY `fk_o_buyer_id` (`buyer_id`),
  ADD KEY `fk_o_vendor_id` (`vendor_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `p_v`
--
ALTER TABLE `p_v`
  ADD KEY `fk_product_id` (`product_id`),
  ADD KEY `fk_vendor_id` (`vendor_id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendor_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_o_buyer_id` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_o_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_o_vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `p_v`
--
ALTER TABLE `p_v`
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
