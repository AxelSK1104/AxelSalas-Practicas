DROP DATABASE IF EXISTS MiTiendita;
CREATE DATABASE MiTiendita;
USE MiTiendita;

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    producto VARCHAR(50) NOT NULL,
    precio FLOAT NOT NULL,
    cantidad INT NOT NULL
);

INSERT INTO productos (producto, precio, cantidad) VALUES
('Arroz', 28, 15),
('Frijol', 35, 10),
('Azucar', 30, 12),
('Aceite', 45, 8),
('Sal', 12, 20),
('Jabon', 18, 25),
('Papel Higienico', 65, 10),
('Atun', 22, 18),
('Galletas', 15, 30),
('Cafe', 75, 5);