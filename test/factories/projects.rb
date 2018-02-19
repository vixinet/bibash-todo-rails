FactoryBot.define do
  factory :project do
    name "Bibash Todo Lists"

    factory :project_with_todos do
      transient do
        list_count 3
      end

      after(:create) do |project, evaluator|
        create_list(:todo, evaluator.list_count, project: project)
      end
    end

    factory :project_with_milestones do
      transient do
        list_count 3
      end

      after(:create) do |project, evaluator|
        create_list(:milestone, evaluator.list_count, project: project)
      end
    end

    factory :project_with_labels do
      transient do
        list_count 5
      end

      after(:create) do |project, evaluator|
        create_list(:label, evaluator.list_count, projects: [project])
      end
    end
  end
end
