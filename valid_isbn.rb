def isbn_checker(book_number)
   no_spaces_book_number= remove_spaces_from_isbn(book_number)
   no_dashes_or_spaces_book_number= remove_dashes_from_isbn(no_spaces_book_number) 
  if length_verifier(no_dashes_or_spaces_book_number)==true
    isbn_array=book_number_array(no_dashes_or_spaces_book_number)
  check_digit_valid_10(isbn_array)
  else
    false
  end
end
 
 
def length_verifier(book_number)
  if book_number.length==10
    true
  elsif book_number.length==13
    true
  else
    false
  end
end
  
 def book_number_array(book_number)
  book_number_array=book_number.split(//,)
end

def remove_dashes_from_isbn(book_number_array)
  if book_number_array.include?"-"
    no_dashes_isbn = book_number_array.delete!"-"
  else
    book_number_array
  end
book_number_array
end

def remove_spaces_from_isbn(book_number_array)
  if book_number_array.include?" "
      book_number_array.delete!" "
  end
    book_number_array
end
  

def check_digit_contains_X(isbn)
isbn_number = isbn.split ""

  if isbn_number[9] == "x" or isbn_number[9] == "X"
  isbn_number[9] = 10
  end
  
isbn_number[9] == 10

end

  






