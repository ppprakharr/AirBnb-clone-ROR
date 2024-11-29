user = User.create!({
  email: 'tester@gmail.com',
  password: '123456'
})

6.times do |i|
  property=Property.create!({
  name: Faker::Lorem.unique.sentence(word_count: 2),
  headline: Faker::Lorem.unique.paragraph(sentence_count: 30),
  description: Faker::Lorem.unique.sentence(word_count: 5),
  price: Money.from_amount((50..100).to_a.sample, 'USD'),
  address_1: Faker::Address.street_address,
  address_2: Faker::Address.street_name,
  city: Faker::Address.city,
  state: Faker::Address.state,
  country: Faker::Address.country,
  guest_count: (2..14).to_a.sample,
  bedroom_count: (1..7).to_a.sample,
  bed_count: (1..5).to_a.sample,
  bathroom_count: (1..3).to_a.sample
 })

  property.images.attach(io: File.open("db/images/property_#{i+1}.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_7.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_8.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_9.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_10.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_11.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_12.png"), filename: property.name)


  ((5..10).to_a.sample).times do
    Review.create!({
      content: Faker::Lorem.unique.paragraph(sentence_count: 10),
      cleanliness_rating: (1..5).to_a.sample,
      accuracy_rating: (1..5).to_a.sample,
      checkin_rating: (1..5).to_a.sample,
      communication_rating: (1..5).to_a.sample,
      location_rating: (1..5).to_a.sample,
      value_rating: (1..5).to_a.sample,
      property: property,
      user: user
    })
  end
end
