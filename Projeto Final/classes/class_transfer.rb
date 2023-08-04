require_relative 'modules/module_pix'
require_relative 'modules/module_ted'

class Transfer
    def self.transfer_money(sender_account, receiver_account, amount, method)
      case method
      when :pix
        Pix.transfer_money(sender_account, receiver_account, amount)
      when :ted
        Ted.transfer_money(sender_account, receiver_account, amount)
      else
        puts "Invalid transfer method."
      end
    end
end
  


