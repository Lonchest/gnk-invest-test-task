--������� �������� (��������� ������ ����������� ��� ������� ����)
CREATE TABLE Clients (
client_id INT IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
middle_name VARCHAR(100)
);

--������� ��������� (��������� ������ ����������� ��� ������� ����)
CREATE TABLE Contracts (
contract_id INT IDENTITY(1,1) PRIMARY KEY,
client_id INT,
contract_number VARCHAR(100) NOT NULL,
conclusion_date DATE,
contract_status VARCHAR(50) NOT NULL,
FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);
--������ ������ ��� �������� ������ ����������, ����������� � ����������� �������
CREATE INDEX idx_client_id ON Contracts(client_id);

--������� ������ ��������� (��������� ������ ����������� ��� ������� ����)
CREATE TABLE ContractStages (
stage_id INT IDENTITY(1,1) PRIMARY KEY,
contract_id INT,
stage_name VARCHAR(100) NOT NULL,
start_date DATE,
end_date DATE,
stage_status VARCHAR(50) NOT NULL,
FOREIGN KEY (contract_id) REFERENCES Contracts(contract_id)
);
--������ ������ ��� �������� ������ ���� ������ ����������� ���������
CREATE INDEX idx_contract_id ON ContractStages(contract_id);