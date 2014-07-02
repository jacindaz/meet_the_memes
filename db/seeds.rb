User.delete_all
Meme.delete_all
Review.delete_all
Vote.delete_all

users = [
  { email: 'judas@seeder.com',
    password: 'password123',
    password_confirmation: 'password123',
    username: 'betrayer' },
  { email: 'peter@seeder.com',
    password: 'password123',
    password_confirmation: 'password123',
    username: 'simonwhoiscalledpeter' },
  { email: 'andrew@seeder.com',
    password: 'password123',
    password_confirmation: 'password123',
    username: 'petersbro' },
  { email: 'james@seeder.com',
    password: 'password123',
    password_confirmation: 'password123',
    username: 'firstsonofz'},
  { email: 'john@seeder.com',
    password: 'password123',
    password_confirmation: 'password123',
    username: 'saviorsnumber1' },
  { email: 'philip@seeder.com',
    password: 'password123',
    password_confirmation: 'password123',
    username: 'plainsaint' },
  { email: 'bartholomew@seeder.com',
    password: 'password123',
    password_confirmation: 'password123',
    username: 'somecallmenatedogg' },
  { email: 'thomas@seeder.com',
    password: 'password123',
    password_confirmation: 'password123',
    username: 'didymus' },
  { email: 'mathew@seeder.com',
    password: 'password123',
    password_confirmation: 'password123',
    username: 'taxman' },
  { email: 'james2@seeder.com',
    password: 'password123',
    password_confirmation: 'password123',
    username: 'sonofalphaeus' },
  { email: 'thaddaeus@seeder.com',
    password: 'password123',
    password_confirmation: 'password123',
    username: 'jesusbro' },
  { email: 'simon2@seeder.com',
    password: 'password123',
    password_confirmation: 'password123',
    username: 'zealot' },
]

memes = [
  { name: 'Soon Cat',
    url: 'http://www.memecenter.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/6-soon-cat-in-the-toilet.jpg")),
    description: 'Cat in toilet.  Plotting.'},
  { name: 'Doge Sunrise',
    url: 'http://www.google.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/awakedoge.jpg")),
    description: 'Such sunrise. Much doge.'},
  { name: 'Buttercat',
    url: 'http://www.memecenter.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/butterbuttcat.jpg")),
    description: 'Tasty butt.'},
  { name: 'Captain Dogerica',
    url: 'http://www.memecenter.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/captain_dogerica.jpg")),
    description: 'So wow. Very shield.'},
  { name: 'Ribbons!',
    url: 'http://www.google.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/caturday_cat_meme.jpg")),
    description: 'ERMAHGOD!!!'},
  { name: 'Space Doge',
    url: 'http://www.memecenter.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/doge-doge-in-space.jpg")),
    description: 'So star. Much galaxy.'},
  { name: 'Dogeana',
    url: 'http://www.google.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/dogeana.jpg")),
    description: 'Very wow.  Very potassium.'},
  { name: 'Fatcat',
    url: 'http://www.catsinsinks.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/fatcat.jpg")),
    description: 'Reow.'},
  { name: 'Dumb cat',
    url: 'http://www.catsinsinks.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/dumbcat.jpg")),
    description: 'I has teh meme.'},
  { name: 'Catguin',
    url: 'http://www.google.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/funny-adopted-cat-penguin.jpg")),
    description: 'That sneaking suspicion.'},
  { name: 'Greece',
    url: 'http://www.memecenter.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/greecedoge.jpg")),
    description: 'Featuring Olvia Newton Doge'},
  { name: 'Hipsters',
    url: 'http://www.google.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/hipstermeme.jpg")),
    description: 'Ahead of the times.'},
  { name: 'Impin ain\'t easy.',
    url: 'http://www.memecenter.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/impin-aint-easy-tryion-meme.jpg"))},
  { name: 'Jamaican Bacon',
    url: 'http://www.google.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/jamaicanbacon.jpg")),
    description: 'Ello love.'},
  { name: 'Lost Doge',
    url: 'http://www.google.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/lost_doge.jpg")),
    description: 'So scare, such trubble.'},
  { name: 'A new breed',
    url: 'http://www.memecenter.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/newbreedcat.jpg")),
    description: 'Now with levitation.'},
  { name: 'Soon (horse)',
    url: 'http://www.memecenter.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/soon.jpg")),
    description: 'Very soon.'},
  { name: 'Waste of water',
    url: 'http://www.google.com',
    picture: File.open(File.join("#{Rails.root}/db/seeds/watertowater.jpg")),
    description: 'Ice Cube.'},
]

reviews = [
  { title: 'This meme totally rules!',
    body: 'I laughed so hard at this one for like 10 solid minutes! HAHAHAHAHAHA HAHAH HAHA!',
    rating: rand(1..5) },
  { title: 'This meme is pretty funny.',
    body: 'I had a chuckle at this one, but wasn\'t thoroughly impressed I suppose.',
    rating: rand(1..5) },
  { title: 'Meh. Don\'t care for it. Whatev.',
    body: 'The title pretty much says it all. Lackluster meme here. Generic. Umimpressed.',
    rating: rand(1..5) },
  { title: 'Terrible! Who cares about this stuff anyway?!',
    body: 'What are all you loser nerds doing on here. Get off the internet and go outside! This site is totally pointless and you are all wasting your lives away reviewing pictures on the INTERNET. GET A LIFE NERDS!',
    rating: rand(1..5) },
  { title: 'Man oh Man Oh Man oh Man',
    body: 'If this isn\'t the best meme on the internet then I don\'t want to have an account on here any longer! BEST BEST BEST!!!',
    rating: rand(1..5) },
  { title: 'Never seen this one before, hm.',
    body: 'I am incredibly well versed in memeology and I\'ve never seen this one before, I am calling it a hoax!',
    rating: rand(1..5) },
  { title: 'Your mom has better memes than this',
    body: 'Troooooooollllllolollloll lolll loooollllloo oolll ollll ooooolllololl. Rick astley. Etc.',
    rating: rand(1..5) },
  { title: 'h8ers gun h8. lebron 4 king',
    body: 'u all dun no nuttin bout bball my mom sed i can be king of ny just lyk da newzyz guy but im takin over miami with lebron yo',
    rating: rand(1..5) },
]

users.each do |user|
  User.create(user)
end

memes.each do |meme|
  meme[:user_id] = User.all.sample.id
  current_meme = Meme.create(meme)
  reviews.sample(rand(0..8)).each do |review|
    review_submitter = current_meme.user
    while review_submitter == current_meme.user
      review_submitter = User.all.sample
    end
    review[:user_id] = review_submitter.id
    review[:meme_id] = current_meme.id
    current_review = Review.create(review)
    rand(2..10).times do
      vote_submitter = review_submitter
      while vote_submitter == review_submitter
        vote_submitter = User.all.sample
      end
      Vote.create(value: [-1, 1].sample, user_id: vote_submitter.id, review_id: current_review.id)
    end

  end
end
# Rails' form_for helper automatically multi-part encodes uploads. Rake commands like db:seed do not.
# Must use File.open('this/is/the/filepath') to get around this.

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Meme.create(url: "http://cdn.memegenerator.net/instances/500x/43562936.jpg",
            name: "I tried TDD once",
            description: "Cat doesn't like test driven development!"
            )
