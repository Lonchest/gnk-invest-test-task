SELECT CONCAT(c.first_name, ' ', c.last_name, ' ', COALESCE(c.middle_name, '')) AS client_name,
    con.contract_number,
    con.conclusion_date,
    con.contract_status,
    s.stage_name,
    s.start_date,
    s.end_date,
    s.stage_status
FROM Contracts as con
LEFT JOIN Clients as c 
ON c.client_id = con.client_id
LEFT JOIN ContractStages as s 
ON con.contract_id = s.contract_id;