require_relative '12_bankaccount'
RSpec.describe BankAccount do
    before do
        @account = BankAccount.new
    end
  it 'should have a method for retrieving the checking account balance' do
    @account.deposit_checking(100)
    expect(@account.check_checking).to include('Checking Amount: $100')
  end
  it 'should have a method for retrieving the saving account balance' do
    @account.deposit_saving(100)
    expect(@account.check_saving).to include('Saving Amount: $100')
  end
  it 'should have a method for retrieving the total account balance' do
    @account.deposit_checking(100)
    @account.deposit_saving(100)
    expect(@account.check_total).to include('Total Amount: $200')
  end
  it 'should have a method that allows the user to withdraw cash' do
    expect(@account.withdraw_checking(100)).to include('Error: Insufficient funds available on checking. Could not withdraw $100')
    expect(@account.withdraw_saving(100)).to include('Error: Insufficient funds available on saving. Could not withdraw $100')
    @account.deposit_checking(100)
    @account.deposit_saving(100)
    expect(@account.withdraw_checking(100)).to include('Checking Withdraw: $100')
    expect(@account.withdraw_saving(100)).to include('Saving Withdraw: $100')
  end
  it 'should raise an error when the user tries to print out how many bank accounts there are' do
    expect { puts @account.num_of_accounts }.to raise_error(NoMethodError)
  end
  it 'should raise an error when the user tries to set the interest rate' do
    expect { @account.interest=1 }.to raise_error(NoMethodError)
  end
  it 'should raise an error when the user tries to set any attribute' do
    expect { @account.account_number=1 }.to raise_error(NoMethodError)
    expect { @account.checking_amount=1 }.to raise_error(NoMethodError)
    expect { @account.saving_amount=1 }.to raise_error(NoMethodError)
  end
end

# #90617046 Checking Deposit: $100
# .#90170090 Saving Deposit: $100
# .#7119596 Checking Deposit: $100
# #7119596 Saving Deposit: $100
# .#19490441 Checking Deposit: $100
# #19490441 Saving Deposit: $100
# ....

# Finished in 0.00556 seconds (files took 0.08754 seconds to load)
# 7 examples, 0 failures