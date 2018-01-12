# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |index|
  user_params = {
    :name     => Faker::Name.unique.name, 
    :email    => Faker::Internet.unique.email, 
    :password => "password",
    :token    => SecureRandom.base58(24),
    :age      => Faker::Number.between(18,50).to_i,
    :height   => Faker::Number.between(50,82).to_i,
    :weight   => Faker::Number.between(90,225).to_i
  }

  User.create!(user_params)
end

100.times do |index|
  relationship_params = {
    :user_id => Faker::Number.between(1,49).to_i,
    :friend_id => Faker::Number.between(1,49).to_i
  }

  Relationship.create(relationship_params)
end


100.times do |index|
  achievement_params = {
    :name => Faker::Lorem.word,
    :description => Faker::Lorem.sentence,
    :image_url => "https://iwellnesslife.com/wp-content/uploads/2017/07/goal.jpg"
  }

  Achievement.create!(achievement_params)
end

20.times do |index|
  achievement_record_params = {
    :user_id => Faker::Number.between(1,49).to_i,
    :achievement_id => Faker::Number.between(1,19).to_i
  }

  AchievementRecord.create(achievement_record_params)
end

50.times do |index|
  event_params = {
    :name            => Faker::Lorem.word, 
    :winner          => Faker::Name.unique.name, 
    :status          => "complete",
    :socket          => SecureRandom.base58(24),
    :creator_id      => Faker::Number.between(1,49).to_i,
  }

  event = Event.create!(event_params)

  5.times do |participant|
    ghost_params = {
      :name            => Faker::Name.unique.name, 
      :distance        => Faker::Number.between(0.25,25).to_f, 
      :time            => Faker::Number.between(5,6000).to_f,
      :status          => "complete",
      :calories_burned => Faker::Number.between(0,2000).to_i,
      :user_id         => Faker::Number.between(1,49).to_i,
      :data            => "[0,1,3,4,4,4]",
      :event_id        => event.id
    }
    
    Ghost.create!(ghost_params)
  end
end

100.times do |index|
  achievement_post_params = {
    :title => Faker::Lorem.sentence,
    :description => Faker::Lorem.sentence,
    :postable_id => Faker::Number.between(1,20).to_i,
    :postable_type => "Achievement",
    :user_id => Faker::Number.between(1,49).to_i
  }

  Post.create!(achievement_post_params)

  ghost_post_params = {
    :title => Faker::Lorem.sentence,
    :description => Faker::Lorem.sentence,
    :postable_id => Faker::Number.between(1,100).to_i,
    :postable_type => "Ghost",
    :user_id => Faker::Number.between(1,49).to_i
  }

  Post.create!(ghost_post_params)
end




