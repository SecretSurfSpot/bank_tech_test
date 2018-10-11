# Bank Tech Test

Makers week 10 individual tech test - Banking Application, created with Ruby and RSpec, using TDD and OO.

## Requirements

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

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

## The Application (bank_tech_test)

The project can be found here:
https://github.com/SecretSurfSpot/bank_tech_test

### Installation
- Perquisites: Ruby 2.5.1 installed on your machine
- Clone the repo to your local machine
- Run `bundle install`

### Testing
To test the application:
- Open Terminal (or a similar command line interface)
- Run `rspec` from the project root

### Use
To use the application, open a Ruby REPL from the project root and type the following commands:
- `require './lib/transactions'`
- `transaction = Transactions.new` *creates a new Transaction object*
- `transaction.make_deposit("08/10/2018", 1000)` *deposits £1000, dated 08/10/2018*
- `transaction.make_deposit("10/10/2018", 2000)` *deposits £2000, dated 20/10/2018*
- `transaction.make_withdrawal("11/10/2018", 1000)` *withdraws £1000, dated 11/10/2018*
- `transaction.display_statement` *prints a bank statement, as per the format shown in the Acceptance Criteria section*

The above commands result in the output shown in the screenshot below:

![REPL screenshot](https://github.com/SecretSurfSpot/bank_tech_test/blob/master/images/Screen%20Shot%202018-10-11%20at%2012.52.24.png)

## Domain Model

The model below illustrates the high-level structure of the application.

Two classes:

1. **Transactions:** Takes inputs for both deposit and withdrawal amounts, keeps track of the balance and also maintains the transaction log
2. **Printer:** Takes the transaction log as in input (from the Transactions class), formats it, then prints output in basic bank statement format

```
    User
╔════════════╗  
║            ║ Interacts with application
║  Terminal  ║ via REPL, e.g. IRB     
║            ║
╚════════════╝
       |
       |
       |                                   
╔════════════╗     
║            ║ public methods:  make_deposit, make_withdrawal, transaction_log &
║Transactions║                  display_statement
║  (class)   ║ private methods: verify_numeric, verify_positive &            
╚════════════╝                  verify_sufficient_funds    
       |
       |
       V                             
╔════════════╗
║            ║ public methods:  print_statement
║   Printer  ║                  
║  (class)   ║ private methods: format_statement, add_header & decimalize_number
╚════════════╝            

```
