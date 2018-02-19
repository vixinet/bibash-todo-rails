FactoryBot.define do
  factory :label do
    label "Bug"
    color "#ff0000"

    factory :label_with_projects do
      transient do
        list_count 5
      end

      after(:create) do |label, evaluator|
        create_list(:project, evaluator.list_count, labels: [label])
      end
    end
  end
end
