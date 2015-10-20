FactoryGirl.define do
  factory :contact do
    name "MyString"
    phone_number "8015554444"
    email "myemail@email.com"
    note_field "MyNotes"
    ice false 
    user_id 1
    # trip_id 1
  end
end
