# GhostRider - Backend
Backend for the Ghost Rider Application
Written in Ruby on Rails

## Tickets (TODO)
1. ~~GHOST-2: Add searching and sorting functionality to ghost API~~
2. ~~USER-1: Create Achievements API~~
3. ~~USER-2: Integrate social features~~
4. ~~AUTH-2: Shift authentication to more secure format and force users to access stuff based on token, i.e. they can only access their own achievemnts, etc.~~
5. ~~AUTH-3: Add email verification~~
6. AUTH-4: Integrate facebook authentication
7. AUTH-5: Add API to manage people add to event

# API

uri: 199.168.74.67:3000/api/v1/

## Users

### Auth related routes

#### Authenticate


type: POST

url: /users/authenticate

required params: email, password 

optional params: none



#### Register

type: POST

url: /users/register

required params: name, email, password, age, weight, height 

optional params: none



#### Verify Email


type: POST

url: /users/:id/verify_email

required params: id (user's id) , verification_token

### Social Routes

#### Feed


type: GET

url: /users/:id/feed

required params: id (user's id) , token (authentication token)

optional params: none



#### Friends


type: GET

url: /users/:id/friends

required params: id (user's id) , token (authentication token)

optional params: none



#### Followers


type: GET

url: /users/:id/followers

required params: id (user's id) , token (authentication token)

optional params: none



#### Add Friend


type: POST

url: /users/:id/add_friend

required params: id (user's id), friend_id, token (authentication token)

optional params: none



#### Remove Friend


type: POST

url: /users/:id/remove_friend

required params: id (user's id), friend_id, token (authentication token)

optional params: none



#### Like a post


type: POST

url: /users/:id/like_post

required params: id (user's id), post_id, token (authentication token)

optional params: none



#### Unlike a post

type: POST

url: /users/:id/unlike_post

required params: id (user's id), post_id, token (authentication token)

optional params: none



#### Get all posts for a user

type: GET

url: /users/:id/posts

required params: id (user's id), token (authentication token), 

optional params: none



#### Create a post

type: POST

url: /users/:id/posts

required params: id (user's id), token (authentication token), title, description, image_url, postable_id (id of achievement/ghost/event post is tied to), :postable_type (the type for the 
preivous id, i.e. achievement or ghost or event)

optional params: none



#### Get all achievements for a user

type: GET

url: /users/:id/achievements

required params: id (user's id), token (authentication token) 

optional params: none



#### Create an achievement for a user

type: POST

url: /users/:id/achievements

required params: id (user's id), token (authentication token), achievement_id (id of the achievement type being given)

optional params: none



## Achievements

#### Get a list of all types of achievements


type: GET

url: /achievements

required params: none

optional params: none



## Ghosts

#### Get/Search all ghosts and filter by params


type: GET

url: /ghosts

required params: token (authentication token) 

optional params: id, name, distance, data, status, time, calories_burned, user_id, event_id



#### Fuzzy Text Search Ghosts


type: GET

url: /ghosts/search

required params: query, order ( i.e. would you like to order by date, name distance, etc.), dir (Ascending or descending), token (authentication token) 

optional params: none



#### Create a Ghost


type: POST

url: /ghosts

required params: token (authentication token), name, distance, data, status, time, calories_burned, user_id

optional params: event_id



#### Update a Ghost


type: PATCH or PUT

url: /ghosts/:id

required params: id (ghost_id), token (authentication token) 

optional params: name, distance, data, status, time, calories_burned, user_id, event_id



#### Destroy a Ghost


type: DELETE

url: /ghosts/:id

required params: id (ghost_id), token (authentication token) 

optional params:none



## Events

#### Get/Search all events and filter by params


type: GET

url: /events

required params: token (authentication token) 

optional params: id, name, socket, winner, status, creator_id



#### Fuzzy Text Search Events


type: GET

url: /events/search

required params: query, order ( i.e. would you like to order by date, name distance, etc.), dir (Ascending or descending), token (authentication token) 

optional params: none



#### Create an Event

type: POST

url: /events

required params: token (authentication token), name, socket, winner, status, creator_id

optional params: none



#### Update an Event


type: PATCH or PUT

url: /events/:id

required params: id (event_id), token (authentication token) 

optional params: name, socket, winner, status, creator_id



#### Destroy an Event


type: DELETE

url: /events/:id

required params: id (event_id), token (authentication token) 

optional params:none



#### Start an Event


type: POST

url: /events/:id/start_event

required params: id (event_id), token (authentication token)

optional params: none


      
#### End an Event


type: POST

url: /events/:id/end_event

required params: id (event_id), token (authentication token)

optional params: none



#### Add a Participant to an Event


type: POST

url: /events/:id/add_participant

required params: id (event_id), user_id, token (authentication token)

optional params: none



#### Add a Participant from an Event


type: POST

url: /events/:id/remove_participant

required params: id (event_id), user_id, token (authentication token)

optional params: none




