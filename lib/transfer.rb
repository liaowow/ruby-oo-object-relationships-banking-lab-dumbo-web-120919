class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  # sender = BankAccount.new(@sender)
  # receiver = BankAccount.new(@receiver) 

  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = transfer_amount
  end

  def valid? 
    return true if @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && @sender.balance > @amount && @status == "pending"
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete" 
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end 
    
    #each transfer can only happen once 

  end

  def reverse_transfer
    if @status == "complete"
    @receiver.balance -= @amount
    @sender.balance += @amount
    @status = "reversed"
    end
  end

end
