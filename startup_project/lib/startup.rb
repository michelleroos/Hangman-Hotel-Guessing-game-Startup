require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name, @funding, @salaries = name, funding, salaries
        @employees = []
        # salaries = { "account manager"=>100}
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(other_startup)
        self.funding > other_startup.funding
    end

    def hire(name, title)
        if valid_title?(title)
            @employees << Employee.new(name, title)
        else  
            raise 'not a valid title!'
        end
    end

    def size
        @employees.size
    end

    def pay_employee(employee)
        if @funding >= @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else  
            raise 'not enough funding :('
        end
    end

    def payday
        @employees.each { |employee| pay_employee(employee) }
    end

    def average_salary

    end

    

end
