FactoryGirl.define do
  factory :task do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:description) { |n| "Desc #{n}" }
  end
end
