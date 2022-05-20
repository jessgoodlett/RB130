# Write a test that will fail if list and the return value of list.process are different objects.

def test_kind
  assert_match(list, list.process)
end