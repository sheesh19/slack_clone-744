
User.create!(email: 'user@user.com', password: 'password', nickname: 'sheesh19')
User.create!(email: 'seb@lewagon.org', password: 'password', nickname: 'ssaunier')

puts "Created #{User.count} user(s)"

Chatroom.create!(name: 'general')

puts "Done!"
