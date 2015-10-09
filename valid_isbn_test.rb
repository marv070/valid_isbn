require_relative"isbn.rb"
require"minitest/autorun"
 
class Isbn_verify<Minitest::Test  

def test_for_valid_amount_of_digits
  assert_equal(true,verify_length("1234567890"))
  assert_equal(false,verify_length( "134689763"))
  assert_equal(true,verify_length("0321146530987"))
end


def test_removes_dashes_from_isbn
  assert_equal("0321146530",remove_dashes_and_spaces_from_isbn("0-321-14653-0"))
  assert_equal("1234567890123",remove_dashes_and_spaces_from_isbn("12-345-678-9-0123"))
  end


def test_to_remove_spaces
    assert_equal("1234567890", remove_dashes_and_spaces_from_isbn("123 4567 890"))
    assert_equal("1237362781", remove_dashes_and_spaces_from_isbn("123 7362 781"))
end 

def test_with_spaces_and_hyphens
    assert_equal("1234567890", remove_dashes_and_spaces_from_isbn("1 2-3-4-5678-9 0"))
end

def test_input_string_is_a_valid_isbn_for_10_degit
  assert_equal(false,valid_isbn?("0471958698"))
  assert_equal(true,valid_isbn?("0 4 7-1958697"))
  assert_equal(true,valid_isbn?("0471958697"))
  assert_equal(false,valid_isbn?("1471958697"))

end

def test_for_check_digit_10_being_valid_with_more_test
  assert_equal(true, valid_isbn?("0306406152"))
  assert_equal(false, valid_isbn?("1246789099"))
  assert_equal(true, valid_isbn?("0321146530"))
end



def test_for_check_digit_containing_X_in_ISBN
    assert_equal(true, check_digit_contains_X("877195869x"))
    assert_equal(false, check_digit_contains_X("1234555781"))
    assert_equal(false, check_digit_contains_X("877195x869"))
end
 
def test_for_non_numeric_characters_in_isbn
  assert_equal(false,test_for_non_numeric_characters("jjjjjjjjjj"))
  assert_equal(true,test_for_non_numeric_characters("1234567890120"))
  assert_equal(false,test_for_non_numeric_characters("abd123def1230"))
  assert_equal(false, test_for_non_numeric_characters("47804700590@"))
  assert_equal(true,test_for_non_numeric_characters("1234567890"))
end

def test_for_thirteen_character_math
  assert_equal(true, valid_isbn?("9780156027328"))
  assert_equal(false, valid_isbn?("9780470009029"))
  assert_equal(false, valid_isbn?("1345678911112"))
  assert_equal(true, valid_isbn?("9780470059029"))
  end 




# def test_for_check_digit_10
#   assert_equal(true, valid_isbn?("0306406152"))
#   assert_equal(false, valid_isbn?("1246789099"))
#   assert_equal(true, valid_isbn?("0321146530"))
# end



# def test_for_X_in_ISBN
#    assert_equal([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], check_digit_contains_X([1,2,3,4,5,6,7,8,9,"x"]))
#    assert_equal([1, 2, 3, 4, 5, 5, 5, 7, 8, 1], check_digit_contains_X([1,2,3,4,5,5,5,7,8,1]))
# end

# def test_for_only_numeric_characters
#   assert_equal(false, only_numeric_characters(["1","2","3","4","5","6","7","8","9","0"]))
#   assert_equal(false, only_numeric_characters(["1","2","3","4","5","6","7","8","9","10"]))
#   assert_equal(false, only_numeric_characters(["1","2"]))
#   assert_equal(true, only_numeric_characters(["a","b","d","1","2","3","d","e","f","1","2","3","0"]))
# end
  
# def test_for_check_digit_10
#   assert_equal(true, check_digit_10_is_valid(["0","3","0","6","4","0","6","1","5","2"]))
#   assert_equal(false, check_digit_10_is_valid([1,2,4,6,7,8,9,0,9,9]))
#   assert_equal(true, check_digit_10_is_valid([0,3,2,1,1,4,6,5,3,0]))
# end
  

#  def test_for_thirteen_character_math
#     assert_equal(true, check_digit_13_is_valid([9,7,8,0,1,5,6,0,2,7,3,2,8]))
#     assert_equal(false, check_digit_13_is_valid([9,7,8,0,4,7,0,0,0,9,0,2,9]))
#     assert_equal(false, check_digit_13_is_valid([1,3,4,5,6,7,8,9,1,1,1,1,2]))
#     assert_equal(true, check_digit_13_is_valid([9,7,8,0,4,7,0,0,5,9,0,2,9]))
#   end 
  
  
  
  
  
end
