class BankAccount
attr_accessor :balance, :status
attr_reader :name

def initialize(name)
  @name = name
  @balance = 1000
  @status = "open"
end

def deposit(dep_amount)
  self.balance += dep_amount
end

def display_balance
  "Your balance is $#{balance}."
end

def close_account
  self.status = "closed"
end

def valid?
  balance > 0 && status == "open"
end

end
