require 'open-uri'
headline = <<-HEADLINE
<div>
<section class="font-medium">BREAKFAST INCLUDED<br />SeaBatical is a new beachfront property located on Hejamady beach in Karnataka. Located equidistant from Udupi and Mangalore. Guests can take long walks on the beach and experience the mesmerizing sunset on Hejamady beach.<br />The beach stay comprises of a 1 BHK on the ground floor, 2 Studio apartments on the first floor and a Roof Top Heaven with separate entrances for each space.<br />Each of the units are fully private and do not have any shared space within the units.</section>
</div>
<div>
<section>
<div>
<h2 class="font-medium mt-3" tabindex="-1">The space</h2>
</div>
<span>This Studio apartment has the below:<br />50" LED TV with Netflix subscription and sound bar connected via Bluetooth.<br />1 Sea view bathroom.<br />Kitchen with refrigerator, Microwave, Kettle with tea,coffee and milk, purified drinking water, 3 burner hob and utensils.<br />2 movable work desks with chairs.<br />1 large Sea view balcony with 2 chairs and a table in each.<br />The Queen size bed can accommodate 2 Adults, the third guest will be provided a floor mattress 6 inch thick.</span></section>
</div>
<div>
<section>
<div>
<h2 class="font-medium mt-3" tabindex="-1">Guest access</h2>
</div>
<span>The property has a small garden where guests can sit and enjoy the view, the beach is just across the street.</span></section>
</div>
<div>
<section>
<div>
<h2 class="font-medium mt-3" tabindex="-1">Other things to note</h2>
</div>
<span>Early Check in and Late Check out both are subject to availability and cannot be confirmed in advance, however we can provide place to wait in our waiting room if they arrive early or want to stay late after check out, we have an external washroom on the ground floor which can be used to freshen up.<br /><br />Food Arrangements: South Indian Breakfast is included, local authentic home made seafood meals can be arranged upon request for lunch and dinner, we have also tied up with a couple of restaurants nearby who deliver to the location, for those who do not deliver our caretakers can help pick up food parcels.<br /><br />We follow strict cleaning guidelines, hence check in will be at 1 PM and checkout will be at 11 AM. Extra charges apply for late check out.<br />Cleaning will be provided on alternate days, does not include washing of kitchen utensils.</span></section>
</div>#{'  '}
HEADLINE

# amenity1=Amenity.create!(name: 'Kitchen')
# amenity1.icon.attach(io: File.open("app/assets/images/amenity_icons/kitchen.svg"), filename: amenity1.name)

# amenity2=Amenity.create!(name: 'WiFi')
# amenity2.icon.attach(io: File.open("app/assets/images/amenity_icons/wifi.svg"), filename: amenity2.name)

# amenity3=Amenity.create!(name: 'Private Pool')
# amenity3.icon.attach(io: File.open("app/assets/images/amenity_icons/pool.svg"), filename: amenity3.name)

# amenity4=Amenity.create!(name: 'Essentials', description: 'Towels, bed sheets, soap and toilet paper')
# amenity4.icon.attach(io: File.open("app/assets/images/amenity_icons/essentials.svg"), filename: amenity4.name)

amenity_data=[
  { name: 'Air conditioning', icon: "air_conditioning.svg" },
  { name: 'Balcony', icon: "balcony.svg" },
  { name: 'Bed linen', icon: "bed_linen.svg" },
  { name: 'Board games', icon: "board_games.svg" },
  { name: 'Carbon monoxide alarm', icon: "carbon_monoxide_alarm.svg" },
  { name: 'Coffee maker', icon: "coffee_maker.svg" },
  { name: 'Cooker', icon: "cooker.svg" },
  { name: 'Cooking basics', icon: "cooking_basics.svg", description: 'Pots and pans, oil, salt and pepper' },
  { name: 'Cot', icon: "cot.svg" },
  { name: 'Dedicated workspace', icon: "dedicated_workspace.svg" },
  { name: 'Dining table', icon: "dining_table.svg" },
  { name: 'Dishes and cutlery', icon: "dishes_and_cutlery.svg", description: 'Bowls, chopsticks, plates, cups, etc.' },
  { name: 'Dishwasher', icon: "dishwasher.svg" },
  { name: 'Dryer', icon: "dryer.svg" },
  { name: 'Esssentials', icon: "essentials.svg", description: 'Towels, bed sheets, soap and toilet paper' },
  { name: 'Fire extinguisher', icon: "fire_extinguisher.svg" },
  { name: 'First aid kit', icon: "first_aid_kit.svg" },
  { name: 'Free parking', icon: "free_parking.svg" },
  { name: 'fridge', icon: "fridge.svg" },
  { name: 'Garden', icon: "garden.svg", description: 'An open space on the property usually covered in grass' },
  { name: 'Hair dryer', icon: "hair_dryer.svg" },
  { name: 'Hangers', icon: "hangers.svg" },
  { name: 'Heating', icon: "heating.svg" },
  { name: 'Hot tub', icon: "hot_tub.svg" },
  { name: 'Hot water', icon: "hot_water.svg" },
  { name: 'Iron', icon: "iron.svg" },
  { name: 'Kitchen', icon: "kitchen.svg", description: 'Space where guests can cook their own meals' },
  { name: 'Lockbox', icon: "lockbox.svg" },
  { name: 'Microwave', icon: "microwave.svg" },
  { name: 'Mountain view', icon: "mountain_view.svg" },
  { name: 'Oven', icon: "oven.svg" },
  { name: 'Pool table', icon: "pool_table.svg" },
  { name: 'Private entrance', icon: "private_entrance.svg", description: 'Separate street or building entrance' },
  { name: 'Private pool', icon: "private_pool.svg" },
  { name: 'Shampoo', icon: "shampoo.svg" },
  { name: 'Smoke alarm', icon: "smoke_alarm.svg" },
  { name: 'TV', icon: "tv.svg" },
  { name: 'Washing machine', icon: "washing_machine.svg" },
  { name: 'Wifi', icon: "wifi.svg" }
]

amenity_data.each do |data|
  amenity = Amenity.create!(name: data[:name], description: data[:description], icon: data[:icon])
end

pictures=[]
20.times do
  pictures << URI.parse(Faker::LoremFlickr.image).open
end


user = User.create!({
  email: 'tester@gmail.com',
  password: '123456' })

  user.profile.update!(
    name: Faker::Lorem.unique.sentence(word_count: 2),
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country_code: Faker::Address.country_code
  )
user.profile.picture.attach(io: pictures[0], filename: user.profile.name)

19.times do |i|
  dummy_user = User.create!({
  email: "tester#{i+3}@gmail.com",
  password: '123456'
})

  dummy_user.profile.update!(
    name: Faker::Lorem.unique.sentence(word_count: 2),
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country_code: Faker::Address.country_code
  )
dummy_user.profile.picture.attach(io: pictures[i+1], filename: dummy_user.profile.name)
end

6.times do |i|
  property=Property.create!({
  name: Faker::Lorem.unique.sentence(word_count: 2),
  headline: headline,
  description: Faker::Lorem.unique.sentence(word_count: 5),
  price: Money.from_amount((50..100).to_a.sample, 'USD'),
  address_1: Faker::Address.street_address,
  address_2: Faker::Address.street_name,
  city: Faker::Address.city,
  state: Faker::Address.state,
  country_code: Faker::Address.country_code,
  guest_count: (2..14).to_a.sample,
  bedroom_count: (1..7).to_a.sample,
  bed_count: (1..5).to_a.sample,
  bathroom_count: (1..3).to_a.sample,
  user_id: User.all.sample.id
 })

  property.images.attach(io: File.open("db/images/property_#{i+1}.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_7.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_8.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_9.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_10.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_11.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_12.png"), filename: property.name)

  amenity_set = Set.new
  ((10..(amenity_data.length()-1)).to_a.sample).times do
    amenity = Amenity.all.sample
    unless amenity_set.include?(amenity.id)
    property.amenities << amenity
    amenity_set << amenity.id
    end
end


  # ((5..10).to_a.sample).times do
  #   Review.create!({
  #     content: Faker::Lorem.unique.paragraph(sentence_count: 10),
  #     cleanliness_rating: (1..5).to_a.sample,
  #     accuracy_rating: (1..5).to_a.sample,
  #     checkin_rating: (1..5).to_a.sample,
  #     communication_rating: (1..5).to_a.sample,
  #     location_rating: (1..5).to_a.sample,
  #     value_rating: (1..5).to_a.sample,
  #     property: property,
  #     user: User.all.sample
  #   })
  # end
end
