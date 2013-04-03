FactoryGirl.define do
  factory :article do
    title 'fish who lie'
    author 'Dr. Theodore Mortensen'
    link 'http://underwaterdoc.com/fish_who_lie.html'
  end

  factory :user do
    email "MyString"
    password "MyString"
    password_confirmation "MyString"
  end


end
