# Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

def test_hire
  assert_raises(NoExperienceError) { employee.hire }
end