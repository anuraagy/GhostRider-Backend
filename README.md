# GhostRider - Backend
Backend for the Ghost Rider Application
Written in NodeJS and Socket.io

## TODO
1. Build an authentication server with JWT(JSON Web Tokens)
2. Setup Socket.io rooms
3. Build API for creating/updating/editing/deleting ghosts

## Tentative Routes

* Controllers and Actions
    * API
        * Users
            * Create
                * /api/users/create
            * Get
                * /api/users/get
            * Search
                * /api/users/search
            * Authenticate
                * /api/users/authenticate
            * Update
                * /api/users/update
            * Delete
                * /api/user/delete
        * Ghosts
            * Create
                * /api/ghosts/create
            * Get
                * /api/ghosts/get
            * Search
                * /api/ghosts/search
            * Update
                * /api/ghosts/update
            * Delete
                * /api/ghosts/delete
        * Events
            * Create
                * /api/events/create
            * Get
                * /api/events/get
            * Search
                * /api/events/search
            * Add Participant
                * /api/events/add_participant
            * Remove Participant
                * /api/events/remove_participant
            * Start Event
                * /api/events/start
            * End Event
                * /api/events/end
            * Participant is ready
                * /api/events/queue_participant
            * Update
                * /api/events/update
            * Delete
                * /api/events/delete
