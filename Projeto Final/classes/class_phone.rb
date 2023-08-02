class Phone < Client 
    attr_accessor :number

    def initialize(attributes = {})
        super
        @number = attributes[:number]
        @phone_numbers = []
    end

    def add_phone_number
        @phone_numbers << number
    end

    def display
        puts "Client: #{name}"
        @phone_numbers.each do |number|
            puts "Phone number: #{number}"
        end
    end
end
