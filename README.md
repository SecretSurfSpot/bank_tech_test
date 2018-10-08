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
10/01/2012 || 3000.00 || || 1000.00 <br />

## Approach

Looking at the above criteria, I initially identified that 3 **methods** will be required, which will fit into 2 (classes):

 - **make_deposit** (Transactions)
 - **make_withdrawl** (Transactions)
 - **print_statement** (Printer)

 ## make_deposit
 Passed a date and an amount, <br />
 this method will add this transaction to an array of transactions

 ## make_withdrawl
 Passed a date and an amount, <br />
 this method will add (need to ensure the amount is passed as a negative decimal number) this transaction to an array of transactions

 ## print_statement
 Passed an array of transactions, <br />
 this method will print out the contents of the array of transactions in the format shown in the **Acceptance Criteria** above.
