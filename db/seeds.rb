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


user = User.create!({
  email: 'tester@gmail.com',
  password: '123456'
})

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
