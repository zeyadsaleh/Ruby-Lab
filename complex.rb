class Complex_num
    attr_accessor:real
    attr_accessor:img
    @@bulk_add_count = 0
    @@bulk_multiply_count = 0
    @@adding_count = 0
    @@multiply_count = 0
    def initialize(real_num, img_num)
        @real = real_num
        @img = img_num
    end

    def +(obj) 
        @@adding_count += 1
        real = self.real + obj.real
        imaginary = self.img + obj.img
        Complex_num.new(real,imaginary)
    end

    def *(obj) 
        @@multiply_count += 1
        real = (self.real * obj.real) - (self.img * obj.img)
        imaginary = (self.real * obj.img) + (self.img * obj.real)
        Complex_num.new(real,imaginary)
    end

    def self.bulk_add(arr)
        @@bulk_add_count += 1
        bulkAddedCn = Complex_num.new(0,0)
        arr.each { |obj|
            bulkAddedCn = bulkAddedCn + obj
        }
        bulkAddedCn
    end

    def self.bulk_multiply(arr)
        @@bulk_multiply_count += 1
        bulkMultipliedCn = arr.first
        arr.drop(1).each {|obj| 
            bulkMultipliedCn =  bulkMultipliedCn * obj 
        }
        bulkMultipliedCn 
    end

    def self.get_stats​()
        return puts "you used +: #{@@adding_count} times, and *: #{@@multiply_count} times\nyou used bulk_add: #{@@bulk_add_count} times, and bulk_multiply: #{@@bulk_multiply_count} times"
    end

    def print_obj()
        return puts "Your Object is: #{self.real} + #{self.img}i"
    end
    

end


complex1 = Complex_num.new(1,2)
complex2 =  Complex_num.new(2,3) 
# complex3 = complex1 + complex2
complex4 = complex1 * complex2
complex4.print_obj()
complex3 = Complex_num.bulk_multiply([complex1,complex2])
complex3.print_obj()
