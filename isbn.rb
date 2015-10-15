def read_file_and_output
  ## Takes in a boolean from valid_isbn fuction and returns text 
  file_old = File.open("input_isbn_file.csv","r")
  file_name = "isbn_output_test.csv"
  file_new = File.open(file_name, "w")
  file_old.each do |line|
  valid_number = valid_isbn?(line)
        
        if valid_number == true
          file_new.puts line.chomp + ",valid"
        else 
          file_new.puts line.chomp + ",invalid"
                end
        end
    
    file_old.close
    file_new.close

end

def valid_isbn?(any_string)
  ## Takes in a string and returns boolean
  no_dashes_or_spaces = remove_dashes_and_spaces_from_isbn(any_string)
  no_dash_split = split_string(no_dashes_or_spaces)
    if no_dash_split.length  == 10
   
  x_equals_10 = check_digit_contains_X(no_dash_split)
  
      if test_for_non_numeric_characters(x_equals_10) == false 
        false
      else
        valid_isbn_10?(x_equals_10) 
      end
  
    elsif no_dash_split.length == 13
     
      if test_for_non_numeric_characters(no_dash_split) == false
        false
      else
        valid_isbn_13?(no_dash_split)
      end
      
      else
        false

    end
 
end


def valid_isbn_10?(no_dashes_or_spaces)
    # Takes in a String and returns a Boolean
array =[]

    no_dashes_or_spaces.each do |value|
    array << value.to_i 
    end
    

sum = 0

    array.each.with_index do |value, index|
    break if index == 9
    sum += value * (index + 1)
    end

check_digit = sum % 11

    if check_digit == array[9]
      true
    else
      false
    end
    
end

def valid_isbn_13?(no_dashes_or_spaces)
# Takes in a String and returns a Boolean
  array =[]
 
   no_dashes_or_spaces.each do |value|
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
       true
     else
       false
     end
        
 end

def split_string(any_string)
  ## Takes in a string and returns array of strings
  any_string.split("")
end


def remove_dashes_and_spaces_from_isbn(any_string)
    ## Takes in String and returns String without disallowed characters
    disallowed_characters = [ " ", "-", "\n", "\""]
    
    disallowed_characters.each do | c|
      any_string.delete! c if any_string.include? c
    end 
     
     any_string
end


def verify_length(any_string)
  ## Takes in String and returns Boolean
  any_string.length == 10 || any_string.length == 13
end

def check_digit_contains_X(array)
  # Takes in a String and returns a String "X" = "10"
  if array[9] == "x"|| array[9] == "X"
  array[9] = "10"
  end
     
  array
end

def test_for_non_numeric_characters(no_dash_split)
  # takes an array of strings and returns boolean
   only_digits = no_dash_split.join
  
  if  only_digits =~ /\D/      #match any character that is not a digit
    #return
      false
  else
    #return
      true
  end 

end




read_file_and_output
