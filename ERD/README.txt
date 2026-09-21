Table users {
  user_id int [pk, increment]
  role_id int [not null]
  name varchar(100) [not null]
  email varchar(100) [unique, not null]
  password varchar(255) [not null]
  phone varchar(20)
  avatar varchar(255)
  bio text
  created_at timestamp [not null, default: `now()`]
  update_at timestamp [not null, default: `now()`]
}

Table organizers {
  organizer_id int [pk, increment]
  user_id int [not null]
  organization_name varchar(100) [not null]
  description text
}

Table roles {
  role_id int [pk, increment] 
  role_name varchar(50) [not null]
}

Table event_categories {
  category_id int [pk, increment]
  category_name varchar(100) [not null]
}

Table events {
  event_id int [pk, increment]
  organizer_id int [not null]
  category_id int [not null]
  title varchar(150) [not null]
  description text 
  event_date date [not null]
  event_time time [not null]
  location varchar(150) [not null]
  address varchar(150) [not null]
  capacity int [not null]
  speakers varchar(150) [not null]
  image varchar(255) 
  status varchar(50) [not null]
  created_at timestamp [not null, default: `now()`]
}

Table event_members {
  event_member_id int [pk, increment]
  event_id int [not null]
  user_id int [not null]
  status varchar(20) [not null, default: 'registered']
  joined_at timestamp [default: `now()`] 
}

Table community_categories {
  category_id int [pk, increment]
  category_name varchar(100) [not null]
}

Table communities {
  community_id int [pk, increment]
  creator_id int [not null]
  category_id int [not null]
  name varchar(100) [not null]
  description text 
  location varchar(150) [not null]
  image varchar(255)
}

Table community_members {
  member_id int [pk, increment]
  user_id int [not null]
  community_id int [not null]
  role varchar(50) [not null, default: 'member']
  status varchar(20) [not null, default: 'active']
}

Table reviews {
  review_id int [pk, increment]
  user_id int [not null]
  event_id int [not null]
  message text [not null]
  rating int [not null]
  created_at timestamp [not null, default: `now()`]
}

Table notifications {
  notification_id int [pk, increment]
  user_id int [not null]
  title varchar(150) [not null]
  message text [not null]
  is_read boolean [not null, default: false] 
  created_at timestamp [not null, default: `now()`]
  updated_at timestamp [not null, default: `now()`]
}

Table testimonials {
  testimonial_id int [pk, increment]
  user_id int [not null]
  message text [not null]
  rating int
  created_at timestamp [not null, default: `now()`]
}

Table saved_events {
  saved_event_id int [pk, increment]
  user_id int [not null]
  event_id int [not null]
  ccreated_at timestamp [not null, default: `now()`]
}

Table event_discussions {
  discussion_id int [pk, increment]
  event_id int [not null]
  user_id int [not null]
  message text [not null]
  created_at timestamp [not null, default: `now()`]
}

Table community_discussions {
  discussion_id int [pk, increment]
  community_id int [not null]
  user_id int [not null]
  message text [not null]
  created_at timestamp [not null, default: `now()`]
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
Ref: users.user_id < testimonials.user_id
Ref: users.user_id < saved_events.user_id
Ref: events.event_id < saved_events.event_id
Ref: events.event_id < event_discussions.event_id
Ref: users.user_id < event_discussions.user_id
Ref: communities.community_id < community_discussions.community_id
Ref: users.user_id < community_discussions.user_id