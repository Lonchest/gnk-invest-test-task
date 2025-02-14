--“аблица клиентов (добавлены только необходимые дл€ задани€ пол€)
CREATE TABLE Clients (
client_id INT IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
middle_name VARCHAR(100)
);

--“аблица договоров (добавлены только необходимые дл€ задани€ пол€)
CREATE TABLE Contracts (
contract_id INT IDENTITY(1,1) PRIMARY KEY,
client_id INT,
contract_number VARCHAR(100) NOT NULL,
conclusion_date DATE,
contract_status VARCHAR(50) NOT NULL,
FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);
--—оздан индекс дл€ быстрого поиска контрактов, относ€щихс€ к конкретному клиенту
CREATE INDEX idx_client_id ON Contracts(client_id);

--“аблица этапов договоров (добавлены только необходимые дл€ задани€ пол€)
CREATE TABLE ContractStages (
stage_id INT IDENTITY(1,1) PRIMARY KEY,
contract_id INT,
stage_name VARCHAR(100) NOT NULL,
start_date DATE,
end_date DATE,
stage_status VARCHAR(50) NOT NULL,
FOREIGN KEY (contract_id) REFERENCES Contracts(contract_id)
);
--—оздан индекс дл€ быстрого поиска всех стадий конкртеного контракта
CREATE INDEX idx_contract_id ON ContractStages(contract_id);