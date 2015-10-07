require"csv"

def read_file_and_output
  file_old = File.open("input_isbn_file.csv","r")
  file_name = "isbn_output_test.csv"
  file_new = File.open(file_name, "w")
  file_old.each do |line|remove_dashes_and_spaces_from_isbn(line)|
    if @results == true
      file_new.puts line.chomp + ",valid"
    else @results == false
      file_new.puts line.chomp + ",invalid"
          end
    end
  
  file_new.close

end

def remove_dashes_and_spaces_from_isbn(isbn_number)
  if isbn_number.include?"-"
    isbn_number.delete!"-"
  elsif isbn_number.include?" "
      isbn_number.delete!" "
  
  else isbn_number
    end
remove_extra_characters(isbn_number)  
end
 
def remove_extra_characters(isbn_number)
  @isbn_number_array = isbn_number.split ("")
  @isbn_number_array.delete_at(0)
  @isbn_number_array.delete_at(-1)
  @isbn_number_array.delete_at(-1)
  @isbn_number_array=@isbn_number_array.join("")
  verify_length(@isbn_number_array)
end
def verify_length(isbn_number)
@isbn_number_array = isbn_number
  if isbn_number.length == 10
    check_digit_contains_X(@isbn_number_array)
    if only_numeric_characters(@new_isbn_number) == true
      @results = false
    else
      check_digit_10_is_valid(@new_isbn_number)
    end
  elsif isbn_number.length == 13
    if only_numeric_characters(@isbn_number_array)== true
      @results = false
      check_digit_13_is_valid(@isbn_number_array)
    end
  else
    @results = false
  end
  
end
  
def check_digit_contains_X(isbn_number_array)
@isbn_number_array=@isbn_number_array.split ""

  if @isbn_number_array[9] == "x" or @isbn_number_array[9] == "X"
    @isbn_number_array[9] = 10
  end
  
  @new_isbn_number = @isbn_number_array.join("")
 # @isbn_number_array[9] == 10
  only_numeric_characters(isbn_number_array)
end

def only_numeric_characters(isbn_number)

  if isbn_number =~ /\D/
     return true 
  else 
     return false
  end
end





  
def check_digit_10_is_valid(isbn_number_array)
isbn_number_array = isbn_number_array.split ""
array =[]

  @isbn_number_array.each do |value|
  array << value.to_i 
  end
  

sum = 0

  array.each.with_index do |value, index|
  break if index == 9
  sum += value * (index + 1)
  end

check_digit = sum%11

  if check_digit == array[9]
  @results = true
  else
  @results = false
  end
  
check_digit == array[9] 

end

def check_digit_13_is_valid(isbn_number_array)
 isbn_number_array = isbn_number_array.split ""
array_13 =[]
  @isbn_number_array.each do |value|
  array_13 << value.to_i
  end
  sum = 0
  check_digit = 0
  array_13.each_with_index do |value,index|
  
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
  if  array_13[12] == check_digit
    @results = true
  else
    @results = false
  end
    
end


read_file_and_output