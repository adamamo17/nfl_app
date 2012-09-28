FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :coach do
      coach true
    end
  end

  factory :team do
    team    "CMU Tartans"
    abbrev  "cmu"
    url     "http://www.cmu.edu"
    division "UAA Div III"
  end
end
