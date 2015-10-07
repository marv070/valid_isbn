require"csv"

def read_file_and_output
    file_old = File.open("input_isbn_file.csv","r")
    file_name = "isbn_output_test.csv"
    file_new = File.open(file_name, "w")
    file_old.each do |line|remove_dashes_and_spaces_from_isbn(line)|
        if @output == true
          file_new.puts line.chomp + ",valid"
        else @output == false
          file_new.puts line.chomp + ",invalid"
                    end
        end
    
    file_new.close

end

def remove_dashes_and_spaces_from_isbn(isbn_number)
    if isbn_number.include? "-"
      isbn_number.delete! '-'
    elsif isbn_number.include?" "
     isbn_number.delete! ' ' 
    
    else 
      isbn_number
   end
remove_extra_characters(isbn_number)    
end

def remove_extra_characters(isbn_number)
    isbn_number_array = isbn_number.split ("")
    isbn_number_array.delete_at(0)
    isbn_number_array.delete_at(-1)
    isbn_number_array.delete_at(-1)
    # isbn_number_array=isbn_number_array.join("")
     verify_length(isbn_number_array)
end
def verify_length(isbn_number)
    @isbn_arr = isbn_number 
    
    if
     @isbn_arr.length == 10
      check_digit_contains_X(@isbn_arr)              
      if only_numeric_characters(@new_isbn_number) == true
        @output = false
      else
        check_digit_10_is_valid(@new_isbn_number)
      end
    elsif 
      @isbn_arr.length == 13 #changed to @isbn_arr
      if only_numeric_characters(@isbn_arr) == true 
        @output = false
       else
        check_digit_13_is_valid(@isbn_arr)#changed 
      end
    else
      @output = false
    end
 
end
    
def check_digit_contains_X(isbn_arr)#changed isbn_number_array
#isbn_number_array=isbn_number_array.split ""

    if isbn_arr[9] == "x" or isbn_arr[9] == "X"
      isbn_arr[9] = 10 && isbn_arr [9] = true
      false
    end
 @new_isbn_number = isbn_arr              

end

def only_numeric_characters(isbn_number)#(isbn_number)
    book_num = isbn_number.join("")
    if book_num =~ /\D/
       return true 
    else 
       return false
    end
end

def check_digit_10_is_valid(isbn_arr)#(isbn_number_array)
#isbn_number_array = isbn_number_array.split("")

array =[]

    isbn_arr.each do |value|
    array << value.to_i 
    end
    

sum = 0

    array.each.with_index do |value, index|
    break if index == 9
    sum += value * (index + 1)
    end

check_digit = sum%11

    if check_digit == array[9]
    @output = true
    else
    @output = false
    end
    
end

def check_digit_13_is_valid(isbn_arr)
#isbn_number_array = isbn_number_array.split ""
array =[]
 
  isbn_arr.each do |value|
  array << value.to_i
  end
 
sum = 0
check_digit = 0
 
  array.each_with_index do |value,index|
    break if index == 12
        if index  %2 == 0
          sum += value * 1
         else
          sum += value * 3
        end    
end        
      sum = sum %10
  check_digit=(10-sum)
    
    if check_digit == 10
       check_digit = 0
    end
    
    if array[12] == check_digit
      @output = true
    else
      @output = false
    end
        
end


read_file_and_output