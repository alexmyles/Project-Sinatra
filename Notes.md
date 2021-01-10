## Anime Create
create Anime via form?
list Anime and view other user's Anime

Edit and Delete your own Anime

## User
username
first_name
last_name
password_digest

## Anime
title
description
has many characters
has many episodes

belongs to a user

## Episodes
has many scenes
belongs to a Anime

## Scenes
has many characters
belongs_to episodes

## Character_Scenes
belong to character
belong to scene

## Characters
name
description
belongs_to Anime
has many scenes

## Features
user authentication
characters creation
scene creation for episode
anime creation
episode creation for anime