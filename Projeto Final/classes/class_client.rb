class Client 

 attr_accessor :name, :document, :address, :phones

 @@client_data = []

 def initialize(attributes = {})
    @name = attributes[:name]
    @document = attributes[:document]
    @address = attributes[:address]
    @phones = attributes[:phones]
    @@client_data << self 
 end

 def register_client     
    puts "Name: #{name}" if name
    puts "Document: #{document}" if document
    puts "Address: #{address}" if address
    puts "Phone(s): #{phones}" if name
 end

 def delete_account
    @@client_data.delete(self)
    puts "Client #{name} has been deleted."
  end

  def self.all_clients
    @@client_data
  end
end