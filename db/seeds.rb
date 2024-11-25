20.times do
  Property.create!({
  name: Faker::Lorem.unique.sentence(word_count: 2),
  headline: Faker::Lorem.unique.paragraph(sentence_count: 10),
  description: Faker::Lorem.unique.sentence(word_count: 6),
  address_1: Faker::Address.street_address,
  address_2: Faker::Address.street_name,
  city: Faker::Address.city,
  state: Faker::Address.state,
  country: Faker::Address.country })
end
