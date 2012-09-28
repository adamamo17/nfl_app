FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :team do
    team    "CMU Tartans"
    abbrev  "cmu"
    url     "http://www.cmu.edu"
    division "UAA Div III"
  end
end
