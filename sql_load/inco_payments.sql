CREATE TABLE payment_terms (
    PayTerms        VARCHAR(10)     NOT NULL,
    Own_explanation VARCHAR(255),
    CONSTRAINT pk_payment_terms PRIMARY KEY (PayTerms)
);

CREATE TABLE incoterms (
    IncoTerms   VARCHAR(10)     NOT NULL,
    Description VARCHAR(255),
    CONSTRAINT pk_incoterms PRIMARY KEY (IncoTerms)
);


COPY payment_terms
FROM 'C:\Users\laszl\Desktop\Projects\Historical analytics\csv_files\payment_terms.csv'
DELIMITER ';' CSV HEADER;

COPY incoterms
FROM 'C:\Users\laszl\Desktop\Projects\Historical analytics\csv_files\incoterms.csv'
DELIMITER ';' CSV HEADER;
