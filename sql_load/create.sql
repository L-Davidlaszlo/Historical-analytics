CREATE TABLE payment_terms (
    PayTerms            VARCHAR(10)     NOT NULL,
    Own_explanation     VARCHAR(255),
    CONSTRAINT pk_payment_terms PRIMARY KEY (PayTerms)
);

CREATE TABLE incoterms (
    IncoTerms           VARCHAR(10)     NOT NULL,
    Description         VARCHAR(255),
    CONSTRAINT pk_incoterms PRIMARY KEY (IncoTerms)
);

CREATE TABLE all_suppliers (
    Centrally_imposed_purchasing_block  VARCHAR(50),
    Purchasing_block_at_purchasing      VARCHAR(50),
    Central_Deletion_Flag               VARCHAR(50),
    DelF                                VARCHAR(50),
    Central_posting_block               VARCHAR(50),
    B                                   VARCHAR(50),
    Indus                               VARCHAR(10),
    Vendor_code                         VARCHAR(50)     NOT NULL,
    Grp                                 VARCHAR(20),
    Language                            VARCHAR(5),
    DUNS_Nummer                         VARCHAR(20),
    Tax_Number_1                        VARCHAR(30),
    Tax_Number                          VARCHAR(30),
    VAT_Registration_No                 VARCHAR(30),
    Name_1                              VARCHAR(100),
    SearchTerm                          VARCHAR(50),
    Street                              VARCHAR(100),
    House_No                            VARCHAR(10),
    PostalCode                          VARCHAR(20),
    City                                VARCHAR(50),
    PO_Box                              VARCHAR(20),
    Postl_code                          VARCHAR(20),
    Cty                                 VARCHAR(5),
    Telephone_1                         VARCHAR(30),
    Fax_Number                          VARCHAR(30),
    Email_Address                       VARCHAR(100),
    PayT                                VARCHAR(10),
    IncoT                               VARCHAR(10),
    Inco_2                              VARCHAR(100),
    PGr                                 VARCHAR(10),
    Ctr                                 VARCHAR(10),
    Crcy                                VARCHAR(5),
    Created_on                          DATE,
    In_dir                              VARCHAR(30),
    Act                                 VARCHAR(30),
    CONSTRAINT pk_all_suppliers         PRIMARY KEY (Vendor_code),
    CONSTRAINT fk_all_sup_payment       FOREIGN KEY (PayT)
        REFERENCES payment_terms (PayTerms),
    CONSTRAINT fk_all_sup_incoterms     FOREIGN KEY (IncoT)
        REFERENCES incoterms (IncoTerms)
);

CREATE TABLE orders (
    Purchase_Order                      VARCHAR(20)     NOT NULL,
    Purchase_Requisition                VARCHAR(20)     NOT NULL,
    Item_of_Requisition                 VARCHAR(10)     NOT NULL,
    Material                            VARCHAR(50),
    Short_Text                          VARCHAR(255),
    Quantity_Requested                  NUMERIC(10,2),
    Unit_of_Measure                     VARCHAR(10),
    Purchasing_Group                    VARCHAR(10),
    Requisitioner                       VARCHAR(50),
    Desired_Vendor                      VARCHAR(20),
    Purch_Organization                  VARCHAR(10),
    Requisition_Date                    DATE,
    Release_Date                        DATE,
    Purchase_Order_Date                 DATE,
    Delivery_Date                       VARCHAR(20),
    PR_Processing_State                 VARCHAR(5),
    Release_Indicator                   VARCHAR(5),
    Processing_Status                   VARCHAR(5),
    Vendor                              VARCHAR(20),
    Total_Value                         NUMERIC(18,2),
    Currency                            VARCHAR(5),
    Document_Type                       VARCHAR(10),
    Release_Strategy                    VARCHAR(10),
    Created_by                          VARCHAR(20),
    Quantity_Ordered                    DECIMAL(15,3),
    Release_Group                       VARCHAR(10),
    Vendor_Name                         VARCHAR(100),
    Plant                               VARCHAR(10),
    GR_Processing_Time                  INT,
    Fixed_Vendor                        VARCHAR(20),
    Invoice_Receipt                     VARCHAR(5),
    GR_Non_Valuated                     VARCHAR(5),
    Goods_Receipt                       VARCHAR(5),
    Planned_Deliv_Time                  INT,
    Deliv_Date_From_To                  DATE,
    Creation_Indicator                  VARCHAR(5),
    Material_Group                      VARCHAR(10),
    Deliv_Date_Category                 VARCHAR(5),
    Changed_on                          DATE,
    CONSTRAINT pk_orders                PRIMARY KEY (Purchase_Order, Purchase_Requisition, Item_of_Requisition),
    CONSTRAINT fk_orders_all_suppliers  FOREIGN KEY (Fixed_Vendor)
        REFERENCES all_suppliers (Vendor_code)
);


COPY payment_terms
FROM 'C:\Users\laszl\Desktop\Projects\Historical analytics\csv_files\payment_terms.csv'
DELIMITER ';' CSV HEADER;

COPY incoterms
FROM 'C:\Users\laszl\Desktop\Projects\Historical analytics\csv_files\incoterms.csv'
DELIMITER ';' CSV HEADER;

COPY all_suppliers
FROM 'C:\Users\laszl\Desktop\Projects\Historical analytics\csv_files\all_suppliers.csv'
DELIMITER ';' CSV HEADER;

COPY orders
FROM 'C:\Users\laszl\Desktop\Projects\Historical analytics\csv_files\orders.csv'
DELIMITER ';' CSV HEADER;


drop  TABLE orders;
DROP TABLE all_suppliers;
DROP TABLE payment_terms;
DROP TABLE incoterms;

ALTER TABLE orders
DROP CONSTRAINT fk_orders_all_suppliers;

ALTER TABLE orders
ADD CONSTRAINT fk_orders_all_suppliers
    FOREIGN KEY (Fixed_Vendor)
    REFERENCES all_suppliers (Vendor_code)
    NOT VALID;

ALTER TABLE orders
VALIDATE CONSTRAINT fk_orders_all_suppliers;


