Table roles {
  role_id int [pk, increment]
  role_name varchar(50)
}

Table users {
  user_id int [pk, increment]
  role_id int
  name varchar(100)
  email varchar(100) [unique]
  password varchar(255)
  phone varchar(20)
  avatar varchar(255)
  bio text
  created_at datetime
}


Table organizers {
  organizer_id int [pk, increment]
  user_id int
  organization_name varchar(100)
  description text
}


Table event_categories {
  category_id int [pk, increment]
  category_name varchar(100)
}


Table events {
  event_id int [pk, increment]
  organizer_id int
  category_id int
  title varchar(150)
  description text
  event_date date
  event_time time
  location varchar(150)
  capacity int
  image varchar(255)
  status varchar(50)
  created_at datetime
}


Table event_members {
  event_member_id int [pk, increment]
  event_id int
  user_id int
  status varchar(20)
  joined_at datetime
}


Table community_categories {
  category_id int [pk, increment]
  category_name varchar(100)
}


Table communities {
  community_id int [pk, increment]
  creator_id int
  category_id int
  name varchar(100)
  description text
  location varchar(150)
  image varchar(255)
}


Table community_members {
  member_id int [pk, increment]
  community_id int
  user_id int
  role varchar(50)
  status varchar(20)
}


Table reviews {
  review_id int [pk, increment]
  user_id int
  event_id int
  message text
  rating int
  created_at datetime
}


Table notifications {
  notification_id int [pk, increment]
  user_id int
  title varchar(150)
  message text
  is_read boolean
  created_at datetime
}


Ref: roles.role_id < users.role_id

Ref: users.user_id - organizers.user_id

Ref: organizers.organizer_id < events.organizer_id

Ref: event_categories.category_id < events.category_id

Ref: events.event_id < event_members.event_id

Ref: users.user_id < event_members.user_id

Ref: users.user_id < notifications.user_id

Ref: users.user_id < reviews.user_id

Ref: events.event_id < reviews.event_id

Ref: users.user_id < communities.creator_id

Ref: community_categories.category_id < communities.category_id

Ref: communities.community_id < community_members.community_id

Ref: users.user_id < community_members.user_id