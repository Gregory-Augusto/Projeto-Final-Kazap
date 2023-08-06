# Bank Management System

This is a simple Bank Management System implemented in Ruby. The system allows users to register clients, create accounts, manage account details, view account information, perform transfers (PIX and TED), and conduct transactions (deposits and withdrawals).

## Requirements

- Ruby (version 2.5 or above)
- Sequel gem (to interact with the SQLite database)

## Usage

Upon running the application, you will be presented with a menu to perform various banking operations:

1. **Register**: Register a new client with their name, document, address, and phone number(s).

2. **Create Account**: Create an account for a registered client.

3. **Manage Account**: Update or delete client account details.

4. **View Accounts**: View a list of all registered accounts.

5. **Make Transfer**: Perform a money transfer between two accounts (PIX and TED).

6. **Perform Transaction**: Deposit or withdraw money from an account.

7. **Exit**: Exit the application.


## Note

This program was created for educational purposes only and should not be used in any serious system. Such use could pose significant risks to users.

## About the Data Bank

For the creation of the database, I developed a relational model to have a foundation to follow. As I progressed with the project, I realized that I didn't strictly adhere to everything in my relational model, but it still helped me a lot. In total, I created ten tables, which were implemented through migrations. The tables were: clients, accounts, phones, transfers, pixes, teds, transactions, deposits, withdraws, and overdrafts.

## Final Considerations

I would like to make some observations to conclude:

The project was extremely challenging, to the point that I couldn't get the code to work. I encountered many problems throughout its creation, often getting lost about what to do.

The code, even though it doesn't work, was made possible thanks to the materials provided in PDF, the codes shared by the teachers, and the use of Chat GPT.

I believe that my biggest obstacle was in using the database, and I also struggled a lot with the linkage between the files.

Some points requested, like the transaction statement and making the code exportable, I couldn't do. Since I honestly had no idea how to do it, I didn't think it was fair to use some ready-made code, like from Chat GPT, for example.

Regardless of everything, I really enjoyed working on this project. Even though I had to consult materials, codes, and Chat GPT itself, I feel that it was very good for me to attempt to create this system. The errors and difficulties I encountered while trying to build it make me want to learn more, so that someday, who knows, I can complete this project without any difficulty.

I want to thank everyone who was present at Kazap Academy. Regardless of my grade on this project, the month of study we had was very enjoyable and fun, and I'm sure it will help me improve as a programmer.



