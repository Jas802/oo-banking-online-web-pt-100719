class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :reciever

  def initialize(sender, reciever, amount)
    @status = "pending"
    @sender = sender
    @reciever = reciever
    @amount = amount
  end

  def valid?
    sender.valid? && reciever.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      reciever.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if valid? && reciever.balance > amount && self.status == "complete"
      reciever.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
