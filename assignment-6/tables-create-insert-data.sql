-- 1. customer table create 

CREATE TABLE `customers` (
    `customer_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `location` VARCHAR(50) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  
);

-- insert data into customers table 

INSERT INTO
    customers (
        customer_id,
        name,
        email,
        location,
        created_at,
        updated_at
    )
VALUES (
        NULL,
        'John Doe',
        'johndoe@email.com',
        'New York',
        NOW(),
        NOW()
    ), (
        NULL,
        'jane Doe',
        'janedoe@email.com',
        'canada',
        NOW(),
        NOW()
    ), (
        NULL,
        'smith Doe',
        'smithdoe@email.com',
        'america',
        NOW(),
        NOW()
    ), (
        NULL,
        'jini Doe',
        'jinidoe@email.com',
        'London',
        NOW(),
        NOW()
    ), (
        NULL,
        'juyel Doe',
        'juyeldoe@email.com',
        'soudi',
        NOW(),
        NOW()
    )


-- 2. categories table create 

CREATE TABLE `categories` (
    `category_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
);

-- insert data into categories table 

INSERT INTO categories (category_id, name, created_at, updated_at)
VALUES
(1, 'Category 1', NOW(), NOW()),
(2, 'Category 2', NOW(), NOW()),
(3, 'Category 3', NOW(), NOW()),
(4, 'Category 4', NOW(), NOW()),
(5, 'Category 5', NOW(), NOW());


-- 3. products table create 
CREATE TABLE `products` (
    `product_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cust_id` BIGINT(20) UNSIGNED NOT NULL,
    `name` VARCHAR(50)  NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `price` VARCHAR(50) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
    Foreign Key (`cust_id`) REFERENCES `customers`(`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- insert data into products table 
INSERT INTO products (product_id, cust_id, name, description, price, created_at, updated_at)
VALUES
(1, 1, 'shirt', 'Description for Product 1', 19.99, NOW(), NOW()),
(2, 2, 'pant', 'Description for Product 2', 29.99, NOW(), NOW()),
(3, 3, 't-shirt', 'Description for Product 3', 39.99, NOW(), NOW());


-- 4. order table create 

CREATE TABLE `orders` (
    `order_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cust_id` BIGINT(20) UNSIGNED NOT NULL,
    `total_amount` VARCHAR(50) NOT NULL,
    `order_date` VARCHAR(50) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
    FOREIGN KEY(`cust_id`) REFERENCES `customers`(`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- insert data into orders table 

INSERT INTO
    orders(
        order_id,
        cust_id,
        total_amount,
        order_date,
        created_at,
        updated_at
    )
VALUES (
        NULL,
        1,
        300.00,
        15-6-2023,
        NOW(),
        NOW()
    ),VALUES (
        NULL,
        2,
        300.00,
        15-6-2023,
        NOW(),
        NOW()
    ),VALUES (
        NULL,
        3,
        300.00,
        15-6-2023,
        NOW(),
        NOW()
    ),VALUES (
        NULL,
        4,
        300.00,
        15-6-2023,
        NOW(),
        NOW()
    ),VALUES (
        NULL,
        5,
        300.00,
        15-6-2023,
        NOW(),
        NOW()
    );


-- 5. order_items table create 
CREATE TABLE `orders_items` (
    `order_item_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_id` BIGINT(20) UNSIGNED NOT NULL,
    `product_id` BIGINT(20) UNSIGNED NOT NULL,
    `quantity` VARCHAR(50) NOT NULL,
    `unit_price` VARCHAR(50) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
    FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

insert data into order_items table 
INSERT INTO orders_items (order_item_id, order_id, product_id, quantity, unit_price, created_at, updated_at)
VALUES
(1, 1, 1, 5, 19.99, '2023-11-06 10:00:00', '2023-11-06 10:00:00'),
(2, 2, 2, 3, 29.99, '2023-11-06 10:15:00', '2023-11-06 10:15:00'),
(3, 3, 3, 2, 39.99, '2023-11-06 10:30:00', '2023-11-06 10:30:00'),
(4, 4, 4, 4, 19.99, '2023-11-06 10:45:00', '2023-11-06 10:45:00'),
(5, 5, 5, 1, 49.99, '2023-11-06 11:00:00', '2023-11-06 11:00:00');


