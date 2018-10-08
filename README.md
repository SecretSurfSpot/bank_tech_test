# Bank Tech Test

Makers week 10 individual tech test - Banking Application, created with Ruby and RSpec.

## Acceptance Criteria

**Given** a client makes a **deposit** of 1000 on 10-01-2012 <br />
**And** a **deposit** of 2000 on 13-01-2012 <br />
**And** a **withdrawl** of 500 on 14-01-2012 <br />
**When** she **prints** her bank statement <br />
**Then** she would see: <br />

date || credit || debit || balance <br />
14/01/2012 || || 500.00 || 2500.00 <br />
13/01/2012 || 2000.00 || || 3000.00 <br />
10/01/2012 || 1000.00 || || 1000.00 <br />

## Approach

Looking at the above criteria, I initially identified that 4 **methods** will be required, which will fit into 2 (classes):

- **make_deposit** (Transactions)
- **make_withdrawl** (Transactions)
- **transaction_log** (Transactions)
- **print_statement** (Printer)

## make_deposit
Passed a date and an amount, <br />
this method will: <br />
1) Add the amount to the balance <br />
2) Call the transaction_log method, passing: <br />
a) date <br />
b) amount <br />
c) null (nothing in this element unless its a withdrawl) <br />
d) balance

## make_withdrawl
Passed a date and an amount, <br />
this method will: <br />
1) Deduct the amount from the balance
2) Call the transaction_log method, passing: <br />
a) date <br />
b) null (nothing in this element unless its a deposit) <br />
c) amount <br />
d) balance

## transaction_log
Passed a date, amount(from make_deposit), amount(from make_withdrawl), balance <br />
this method will: <br />
1) Add the given transaction to the transaction_log

## print_statement
Passed the transaction_log, <br />
this method will print out each hash within the transaction_log in the format shown in the **Acceptance Criteria** above.
