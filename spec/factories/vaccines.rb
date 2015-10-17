FactoryGirl.define do
  factory :vaccine do
    name "Vaccine Name"
    details "MyString details"
    administration_method "Oral, injection, etc."
    date_given "2015-01-01"
    expiration_date "2050-01-01"
    user_id 1
  end

end
