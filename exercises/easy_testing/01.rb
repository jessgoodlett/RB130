# Write a minitest assertion that will fail if the value.odd? is not true.

def test_odd
  assert(value.odd?, 'value is not odd')
  assert_equal(true, value.odd?)
  # can also be written:
  assert value.odd?, 'value is not odd'
  assert_equal true, value.odd?
end