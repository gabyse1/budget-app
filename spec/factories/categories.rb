FactoryBot.define do
  factory :category do
    name { 'food category' }
    user

    trait :with_icon do
      after :build do |category|
        file_name = 'me-about-to-penguin.jpeg'
        file_path = Rails.root.join('spec/fixtures/files', file_name)
        category.icon.attach(io: File.open(file_path), filename: file_name, content_type: 'image/jpeg')
      end
    end
  end
end

# category.icon.attach(
#   io: File.open(Rails.root.join('spec/fixtures/files', 'me-about-to-penguin.jpeg')),
#   filename: 'me-about-to-penguin.jpeg',
#   content_type: 'image/jpeg'
# )
