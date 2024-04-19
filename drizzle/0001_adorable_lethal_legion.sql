CREATE TABLE IF NOT EXISTS `shippers` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`company_name` text,
	`phone` text
);
--> statement-breakpoint
ALTER TABLE orders ADD `shipped_date` text;--> statement-breakpoint
CREATE INDEX `company_name_idx` ON `shippers` (`company_name`);