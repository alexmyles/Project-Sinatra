user = User.first

user.anime.create(title: "Bleach", description: "Action")
user.anime.create(title: "One Punch Man", description: "Action, Comedy")
user.anime.create(title: "Black Clover", description: "Action, Comedy")