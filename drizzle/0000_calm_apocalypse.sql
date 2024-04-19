CREATE TABLE IF NOT EXISTS `customers` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`company_name` text NOT NULL,
	`contact_name` text NOT NULL,
	`contact_title` text NOT NULL,
	`address` text NOT NULL,
	`city` text NOT NULL,
	`postal_code` text,
	`region` text,
	`country` text NOT NULL,
	`phone` text NOT NULL,
	`fax` text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `order_details` (
	`unit_price` real NOT NULL,
	`quantity` integer NOT NULL,
	`discount` real NOT NULL,
	`order_id` integer NOT NULL,
	`product_id` integer NOT NULL,
	FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `employees` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`last_name` text NOT NULL,
	`first_name` text,
	`title` text NOT NULL,
	`title_of_courtesy` text NOT NULL,
	`address` text NOT NULL,
	`city` text NOT NULL,
	`postal_code` text NOT NULL,
	`country` text NOT NULL,
	`home_phone` text NOT NULL,
	`extension` integer NOT NULL,
	`notes` text NOT NULL,
	`recipient_id` integer,
	FOREIGN KEY (`recipient_id`) REFERENCES `employees`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `orders` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`ship_via` integer NOT NULL,
	`freight` real NOT NULL,
	`ship_name` text NOT NULL,
	`ship_city` text NOT NULL,
	`ship_region` text,
	`ship_postal_code` text,
	`ship_country` text NOT NULL,
	`customer_id` integer NOT NULL,
	`employee_id` integer NOT NULL,
	FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`employee_id`) REFERENCES `employees`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `products` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text NOT NULL,
	`qt_per_unit` text NOT NULL,
	`unit_price` real NOT NULL,
	`units_in_stock` integer NOT NULL,
	`units_on_order` integer NOT NULL,
	`reorder_level` integer NOT NULL,
	`discontinued` integer NOT NULL,
	`supplier_id` integer NOT NULL,
	FOREIGN KEY (`supplier_id`) REFERENCES `suppliers`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `suppliers` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`company_name` text NOT NULL,
	`contact_name` text NOT NULL,
	`contact_title` text NOT NULL,
	`address` text NOT NULL,
	`city` text NOT NULL,
	`region` text,
	`postal_code` text NOT NULL,
	`country` text NOT NULL,
	`phone` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX `order_id_idx` ON `order_details` (`order_id`);--> statement-breakpoint
CREATE INDEX `product_id_idx` ON `order_details` (`product_id`);--> statement-breakpoint
CREATE INDEX `recepient_idx` ON `employees` (`recipient_id`);--> statement-breakpoint
CREATE INDEX `supplier_idx` ON `products` (`supplier_id`);