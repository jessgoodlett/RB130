# Write a minitest assertion that will fail if 'xyz' is not in the array list

def test_include
  assert_equal true, list.include?('xyz')
  assert_includes list, 'xyz'
end