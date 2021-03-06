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
    assert_equal("1237362781", remove_dashes_and_spaces_from_isbn("1237362781"))
  
  end 

  def test_with_spaces_and_hyphens
    assert_equal("1234567890", remove_dashes_and_spaces_from_isbn("1 2-3-4-5678-9 0"))
  end
  
  def test_to_split_string
    assert_equal(["1","2","3","4","5","6","7","8"],split_string("12345678"))
 
  end

  def test_for_check_digit_containing_X_in_ISBN
    assert_equal("87719586910", check_digit_contains_X("877195869x"))
    assert_equal("1234555781", check_digit_contains_X("1234555781"))
    assert_equal("87719586910", check_digit_contains_X("877195869X")) # upcase X
  end
 

  def test_for_non_numeric_characters_in_isbn
    assert_equal(false,test_for_non_numeric_characters(["j","j","j","j","j","j","j","j","j","j","j"]))
    assert_equal(true,test_for_non_numeric_characters(["1","2","3","4","5","6","7","8","9","0","1","2","0"]))
    assert_equal(false,test_for_non_numeric_characters(["a","b","d","1","2","3","d","e","f","1","2","3","0"]))
    assert_equal(false, test_for_non_numeric_characters(["4","7","8","0","4","7","0","0","5","9","0","@"]))
    assert_equal(true,test_for_non_numeric_characters(["1","2","3","4","5","6","7","8","9","0"]))
    assert_equal(false, test_for_non_numeric_characters(["8","7","7","1","9","5","x","8","6","9"]))  # X in the middle returns false/invalid
  end

########### all remaining test are testing through main function


  def test_input_string_is_a_valid_isbn_for_10_degit
    assert_equal(false,valid_isbn?("0471958698"))
    assert_equal(true,valid_isbn?("0 4 7-1958697"))
    assert_equal(true,valid_isbn?("0471958697"))
    assert_equal(false,valid_isbn?("1471958697"))

  end


  def test_for_check_digit_10_being_valid
    assert_equal(true, valid_isbn?("0306406152"))
    assert_equal(false, valid_isbn?("1246789099"))
    assert_equal(true, valid_isbn?("0321146530"))
  end

  def test_for_valid_10_digit_isbn_with_x_for_check_digit
    assert_equal(false,valid_isbn?("0312341613x"))
    assert_equal(true,valid_isbn?("87 71958 69X"))      
    assert_equal(true,valid_isbn?("0-8044-2957-X")) 
    assert_equal(true,valid_isbn?("0-9752298-0-X"))
  end


  def test_for_valid_thirteen_digit_isbn
    assert_equal(true, valid_isbn?("9780156027328"))
    assert_equal(false, valid_isbn?("9780470009029"))
    assert_equal(false, valid_isbn?("1345678911112"))           
    assert_equal(true, valid_isbn?("9 78 0470-059-029"))
    assert_equal(true, valid_isbn?("978-0-13-149505-0"))
    assert_equal(true, valid_isbn?("978-3-16-148410-0"))
    assert_equal(true, valid_isbn?("978-0-306-40615-7"))
    assert_equal(false, valid_isbn?("9 78 0470%059-029"))
  
    assert_equal(true, valid_isbn?("877195869x"))    

  end 
  
end
