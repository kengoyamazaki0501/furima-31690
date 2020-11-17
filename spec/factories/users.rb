FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    email                 { Faker::Internet.email }
    password              { 'a1a1a1a1' }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '太朗' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1989-05-01' }
  end
end
