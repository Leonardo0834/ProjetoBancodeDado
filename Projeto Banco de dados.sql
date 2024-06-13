CREATE TABLE Cliente (
    ID_Cliente SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereço VARCHAR(150),
    Telefone VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Conta (
    ID_Conta SERIAL PRIMARY KEY,
    Tipo VARCHAR(50) NOT NULL,
    Saldo NUMERIC(15, 2) NOT NULL,
    ID_Cliente INT NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Transação (
    ID_Transação SERIAL PRIMARY KEY,
    Data TIMESTAMP NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    Valor NUMERIC(15, 2) NOT NULL,
    ID_Conta INT NOT NULL,
    FOREIGN KEY (ID_Conta) REFERENCES Conta(ID_Conta)
);

CREATE TABLE Empréstimo (
    ID_Empréstimo SERIAL PRIMARY KEY,
    Valor NUMERIC(15, 2) NOT NULL,
    Data_Início DATE NOT NULL,
    Data_Término DATE NOT NULL,
    Taxa_Juros NUMERIC(5, 2) NOT NULL,
    ID_Cliente INT NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

SELECT * FROM Cliente;

UPDATE Cliente
SET Nome = 'Novo Nome', Endereço = 'Novo Endereço', Telefone = 'Novo Telefone', Email = 'Novo Email'
WHERE ID_Cliente = 1;

DELETE FROM Cliente WHERE ID_Cliente = 1;

SELECT * FROM Conta;

UPDATE Conta
SET Tipo = 'Novo Tipo', Saldo = 0.00
WHERE ID_Conta = 1;

DELETE FROM Conta WHERE ID_Conta = 1;

SELECT * FROM Transação;

UPDATE Transação
SET Data = CURRENT_TIMESTAMP, Tipo = 'Novo Tipo', Valor = 0.00
WHERE ID_Transação = 1;

DELETE FROM Transação WHERE ID_Transação = 1;

SELECT * FROM Empréstimo;

UPDATE Empréstimo
SET Valor = 0.00, Data_Início = '2024-01-01', Data_Término = '2025-01-01', Taxa_Juros = 0.00
WHERE ID_Empréstimo = 1;

DELETE FROM Empréstimo WHERE ID_Empréstimo = 1;
