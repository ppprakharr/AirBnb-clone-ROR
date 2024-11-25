20.times do
  Property.create!({
  name: Faker::Lorem.unique.sentence(word_count: 2),
  headline: Faker::Lorem.unique.paragraph(sentence_count: 10),
  description: Faker::Lorem.unique.sentence(word_count: 6),
  price: Money.from_amount((50..100).to_a.sample, 'USD'),
  address_1: Faker::Address.street_address,
  address_2: Faker::Address.street_name,
  city: Faker::Address.city,
  state: Faker::Address.state,
  country: Faker::Address.country })
end
