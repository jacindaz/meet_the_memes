pictures = Dir.entries("#{Rails.root}/db/seeds")

pictures.each_with_index do |pic, i|
  if pic[-3..-1] == 'jpg' || pic[-3..-1] == 'png'
    meme = Meme.create(
      name: "This is a name for meme ##{i - 1}!",
      url: 'http://www.google.com',
      description: 'So wow. Such meme. Many English. Very doge. Much tube-shaped animal.',
      picture: File.open(File.join("#{Rails.root}/db/seeds/#{pic}")),
      user_id: 11
      )
    Review.create(
      rating: rand(1..5),
      title: "This isn't not the title! So wow. #{i}",
      body: "OMG teh meme!  First! Other internet idiosyncrasies! Much doge. Such doge.",
      user_id: 1,
      meme_id: meme.id
      )
    Review.create(
      rating: rand(1..5),
      title: "This isn't not the title! So wow. #{i + 1}",
      body: "OMG teh meme!  First! Other internet idiosyncrasies! Much doge. Such doge.",
      user_id: 3,
      meme_id: meme.id
      )
    Review.create(
      rating: rand(1..5),
      title: "This isn't not the title! So wow. #{i + 2}",
      body: "OMG teh meme!  First! Other internet idiosyncrasies! Much doge. Such doge.",
      user_id: 4,
      meme_id: meme.id
      )
    Review.create(
      rating: rand(1..5),
      title: "This isn't not the title! So wow. #{i + 3}",
      body: "OMG teh meme!  First! Other internet idiosyncrasies! Much doge. Such doge.",
      user_id: 5,
      meme_id: meme.id
      )
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
