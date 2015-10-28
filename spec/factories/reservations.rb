FactoryGirl.define do
  factory :reservation do
    type "Other"
    business_name "MyString"
    confirmation_number "MyString"
    check_in_date "2020-01-01"
    check_out_date "2020-01-02"
    note "MyString"
    trip_id 1
    user_id 1
  end

end
