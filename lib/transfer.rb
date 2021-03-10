require "pry"

class Transfer
  # your code here

  attr_accessor :status 
  attr_reader :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver =receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    # binding.pry
    sender.valid? && receiver.valid?
    
  end

  def execute_transaction
    if valid? && sender.balance > self.amount && self.status == "pending"
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
   else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
   end
  end

  def reverse_transfer
    if valid? && receiver.balance > self.amount && self.status == "complete"
      receiver.balance -= self.amount
      sender.balance += self.amount
      self.status = "reversed"
   else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
   end
  end



end
