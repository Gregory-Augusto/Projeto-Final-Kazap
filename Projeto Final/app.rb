require 'sequel'

DB = Sequel.sqlite('db/bank.db')

require './modules/module_deposit'
require './modules/module_pix'
require './modules/module_ted'
require './modules/module_withdraw'

require './classes/class_client'
require './classes/class_phone'
require './classes/class_account'
require './classes/class_transaction'
require './classes/class_transfer'

require './models/client'
require './models/phone'
require './models/account'
require './models/transfer'
require './models/pix'
require './models/ted'
require './models/transaction'
require './models/deposit'
require './models/withdraw'
require './models/overdraft'

    def register_client
        print 'Enter name: '
        name = gets.chomp
    
        print 'Enter document: '
        document = gets.chomp
    
        print 'Enter address: '
        address = gets.chomp
    
        print 'Enter phone(s) (comma-separated): '
        phones = gets.chomp.split(',')
    
        client = Client.new(name: name, document: document, address: address)
        client.save
        
        print 'Enter phone(s) number(s): '
        phones = gets.chomp 

        phones.each do |number|
            phone = Phone.new(number: number)
            client.add_phone(phone)
        end
        
        puts "Client #{client.name} registered successfully!"
        client
    end

    def create_account(client)
        account = Account.new(client: client, balance: 0)
        account.save
        puts "Account created for #{client.name}."
    end

    def update_account
        print 'Enter the account number to update: '
        account_id = gets.chomp.to_i
    
        account = Account.where(account_id: account_id).first
        if account.nil?
            puts 'Account not found. Please enter a valid account number.'
            return
        else
            print 'Enter a new name: '
            new_account_name = gets.chomp
            account.client.name = new_account_name
            account.save
            puts 'Account Updated!'
        end
    end

    def delete_account
        print 'Enter the account id to delete: '
        account_id = gets.chomp.to_i
    
        account = Account.where(account_id: account_id).first
        if account.nil?
            puts 'Account not found. Please enter a valid account number.'
        else
            account.delete
            puts 'Account deleted!'
        end
    end

    def show_all_accounts
        puts '---'
        puts 'List of all accounts:'
        accounts = Account.all
    
        if accounts.empty?
            puts 'No accounts found.'
            return
        else
            accounts.each do |account|
                puts "Account Number: #{account.account.id}"
                puts "Client Name: #{account.client.name}"
                puts "Balance: #{account.balance}"
                puts '---'
            end
        end
    end

    def pix_transfer 
        puts '---'
        puts 'List of all accounts:'
        accounts = Account.all
    
        if accounts.empty?
            puts 'No accounts found.'
            return
        else
            accounts.each do |account|
                puts "Account Number: #{account.account.id}"
                puts "Client Name: #{account.client.name}"
                puts "Balance: #{account.balance}"
                puts '---'
            end
        end

        puts 'Insert the Account number that is going to do the transfer: '
        sender_account_number = gets.chomp.to_i
        puts 'Insert the Account number that is going to receive the transfer: '
        receiver_account_number = gets.chomp.to_i
        puts 'Insert the transfer amount: '
        transfer_amount = gets.chomp.to_f

        sender_account = accounts.find { |account| account.account.id == sender_account_number }
        receiver_account = accounts.find { |account| account.account.id == receiver_account_number }
    
        if sender_account.nil? || receiver_account.nil?
            puts 'Invalid account number. Please make sure both sender and receiver accounts exist.'
        elsif transfer_amount > sender_account.balance
            puts 'Insufficient balance in the sender account. Transfer cannot be completed.'
        else
            sender_account.balance -= transfer_amount
            receiver_account.balance += transfer_amount
            puts 'Transfer completed successfully.'
        end
        puts '---'
    end

    def ted_transfer
        puts '---'
        puts 'List of all accounts:'
        accounts = Account.all
    
        if accounts.empty?
            puts 'No accounts found.'
            return
        end
    
        accounts.each do |account|
            puts "Account Number: #{account.account.id}"
            puts "Client Name: #{account.client.name}"
            puts "Balance: #{account.balance}"
            puts '---'
        end
    
        puts 'Insert the Account number that is going to do the transfer: '
        sender_account_number = gets.chomp.to_i
        puts 'Insert the Account number that is going to receive the transfer: '
        receiver_account_number = gets.chomp.to_i
        puts 'Insert the transfer amount: '
        transfer_amount = gets.chomp.to_f
    
        sender_account = accounts.find { |account| account.account.id == sender_account_number }
        receiver_account = accounts.find { |account| account.account.id == receiver_account_number }
    
        if sender_account.nil? || receiver_account.nil?
            puts 'Invalid account number. Please make sure both sender and receiver accounts exist.'
        elsif transfer_amount > sender_account.balance
            puts 'Insufficient balance in the sender account. Transfer cannot be completed.'
        else
            if sender_account_number == receiver_account_number
                fee = 0
            else
                fee = (transfer_amount * 0.01).round(2)
            end
    
            total_amount = transfer_amount + fee
    
            if sender_account.balance < total_amount
                puts 'Insufficient balance to cover the transfer amount and fee. Transfer cannot be completed.'
            else
                sender_account.balance -= total_amount
                receiver_account.balance += transfer_amount
                puts "Transfer completed successfully. Transfer amount: #{transfer_amount}. Fee: #{fee}."
            end
            puts '---'
        end
    end
    
    def deposit
        puts '---'
        puts 'List of all accounts:'
        accounts = Account.all
      
        if accounts.empty?
          puts 'No accounts found.'
          return
        end
      
        accounts.each do |account|
          puts "Account Number: #{account.account.id}"
          puts "Client Name: #{account.client.name}"
          puts "Balance: #{account.balance}"
          puts "Overdraft Limit: $100" 
        end
      
        print 'Insert the Account number where you want to make the deposit: '
        account_number = gets.chomp.to_i
        print 'Insert the deposit amount: '
        deposit_amount = gets.chomp.to_f
      
        account = accounts.find { |account| account.account.id == account_number }
      
        if account.nil?
          puts 'Invalid account number. Please make sure the account exists.'
        else
          remaining_deposit = deposit_amount
          if account.balance < 0
            if account.balance.abs >= 100
              puts 'Account has exceeded the overdraft limit. Deposit cannot be completed.'
              return
            else
              remaining_deposit -= account.balance.abs
              account.balance = 0
            end
          end
      
          if remaining_deposit > 0
            Deposit.add_funds_to_account(account, remaining_deposit)
            puts 'Deposit completed!'
          else
            puts 'No funds left to deposit after covering the negative balance.'
          end
        end
        puts '---'
    end
      
    def withdraw
        puts '---'
        puts 'List of all accounts:'
        accounts = Account.all
      
        if accounts.empty?
          puts 'No accounts found.'
          return
        end
      
        accounts.each do |account|
          puts "Account Number: #{account.account.id}"
          puts "Client Name: #{account.client.name}"
          puts "Balance: #{account.balance}"
          puts "Overdraft Limit: $100"
          puts '---'
        end
      
        print 'Insert the Account number from where you want to make the withdrawal: '
        account_number = gets.chomp.to_i
        print 'Insert the withdrawal amount: '
        withdrawal_amount = gets.chomp.to_f
      
        account = accounts.find { |account| account.account.id == account_number }
      
        if account.nil?
          puts 'Invalid account number. Please make sure the account exists.'
        else
          if withdrawal_amount <= 0
            puts 'Invalid withdrawal amount. Please enter a positive value.'
          elsif account.balance >= withdrawal_amount
            Withdraw.withdraw_money(account, withdrawal_amount)
          else
            puts 'Insufficient money to withdraw. Do you want to use an overdraft? (yes/y)'
            overdraft_choice = gets.chomp.downcase
            remaining_withdrawal = withdrawal_amount - account.balance
      
            if overdraft_choice == 'yes' || overdraft_choice == 'y'
              if remaining_withdrawal.abs <= 100
                Withdraw.apply_overdraft(account, remaining_withdrawal)
                puts 'Withdrawal completed!'
              else
                puts 'Your debit is higher than $100. You cannot pay even using an overdraft.'
              end
            else
              puts 'Withdrawal canceled.'
              return
            end
          end
        end
        puts '---'
    end
      
loop do 
    puts "Hello, Welcome!"
    puts '---'
    puts '1. Register.'
    puts '2. Create Account.'
    puts '3. Manage Account'
    puts '4. View Accounts.'
    puts '5. Make Transfer.'
    puts '6. Perform Transaction.'
    puts '7. Exit.'    
    puts '---'

    print 'Choose one of the options above:'
    choice = gets.chomp.to_i 
    
    case choice 
    when 1
        puts '---'
        register_client
        puts '---'
   
    when 2
        puts '---'
        create_account
        puts '---'
    when 3
        loop do 
            puts '---'
            puts 'Options:'
            puts '1. Update Account.'
            puts '2. Delete Account.'
            puts '3. Exit.'
            puts '---'
            print 'Which option do you want: '
            account_option = gets.chomp.to_i

            case account_option
            when 1 
                puts '---'
                update_account
                puts '---'
            when 2
                puts '---'
                delete_account
                puts '---'
            when 3
                puts "You'll return to the main menu"
                break 
            else
                puts 'Invalid option. Please, insert a valid option!'
            end
        end
    when 4
        puts '---'
        show_all_accounts
        puts '---'
    when 5
        loop do 
            puts '---'
            puts 'Transfer options:'
            puts '1. PIX.'
            puts '2. TED.'
            puts '3. Exit.'
            puts '---'
           
            puts 'Choose an option: '
            transfer_option = gets.chomp.to_i

            case transfer_option
            when 1
                puts '---'
                pix_transfer
                puts '---'
            when 2
                puts '---'
                ted_transfer
                puts '---'
            when 3
                puts "You'll return to the main menu"
                break
            else
                puts 'Invalid option. Insert a valid option!'
            end
        end
    when 6 
        loop do
            puts '---'
            puts 'Transaction Options: '
            puts '1. Deposit.'
            puts '2. Withdraw.'
            puts '3. Exit.'
            puts '---'
           
            print 'Select one from the options above: '
            transaction_option = gets.chomp.to_i 

            case transaction_option
            when 1
                puts '---'
                deposit 
                puts '---'
            when 2
                puts '---'
                withdraw
                puts '---'
            when 3
                puts "You'll return to the main menu"
                break
            else
                puts 'Invalid option. Insert a valid option.'
                break
            end
        end
    when 7 
        puts 'Goodbye!'
        break
    else
        puts 'Invalid Option. Please, select a valid option!'
    end
end
