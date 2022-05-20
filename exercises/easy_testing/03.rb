# Write a minitest assertion that will fail if value is not nil

def test_nil
  assert_equal(nil, value)
  assert_equal nil, value
  assert_nil value
end