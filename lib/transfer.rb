require 'pry'

class Transfer 
  # your code here
  attr_reader :sender , :receiver , :status , :amount
  def initialize(sender, receiver, amount )
    @sender= sender
    @amount = amount
    @receiver = receiver
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end
   
  def execute_transaction
    if status != "complete" && @sender.balance > @amount && @sender.valid? && @receiver.valid?
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if status == "complete" && @receiver.balance > @amount && @sender.valid? && @receiver.valid?
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      @status = "reversed"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
 
end

