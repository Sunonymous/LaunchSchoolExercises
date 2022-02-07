CREATE TABLE expenses (
  id         serial        PRIMARY KEY,
  amount     decimal(6, 2) NOT NULL CHECK (amount > 0.00),
  memo       text          NOT NULL,
  created_on TIMESTAMP     DEFAULT now()
);
