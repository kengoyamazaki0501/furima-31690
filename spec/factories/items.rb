FactoryBot.define do
  factory :item do
    product_name             { '出品するもの' }
    explanation              { '出品する物の説明' }
    price                    { 1980 }
    category_id              { 2 }
    condition_id             { 2 }
    burden_id                { 2 }
    country_id               { 2 }
    delivery_day_id { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
