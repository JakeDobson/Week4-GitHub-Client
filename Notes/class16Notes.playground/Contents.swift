
import UIKit




                        ////// CLASS 16 \\\\\\
                        ////// 10/31/16 \\\\\\





/*
 #NOTES:
 
 
 *** OAuth ***
 
 - workflow
    -- user shows intent by attempting an action from the consumer app to the service provider
    -- the app redirects the user to the service provider for authentication
    -- the user givers permisson to the service provider for all the actions the consumer should be able to do on their behalf
    -- the service provider returns the user to the consumer app, with a request token
    --consumer sends request token, together w/ its secret key to the service provider in exchange for an authentication token
    -- user perorms actions and we pass the authentication token w/ each call to prove who they are
 
 - callback URL
    -- entry point of your app
    -- service provider performs http redirect to get the user back to the consumer app
    -- callbackURL will have the authorization code appended to it. up to your app to parse this out and use it
 
 *** HTTP & Client Server Model ***
 
 - HTTP Request/Response
    -- very similar
    -- "English-oriented" and human readable
    -- both start with initial line
    ** request line --> GET request
        ->post -- create new data(creating a tweet)
        ->delete -- delete a resource(deleting a tweet)
        ->put -- updating preexisting record(editing a tweet)
    ** response --> status line
        ->response code
 
 * request *
    - reqest line has 3 parts and are separated by spaces
        -- first part is method
        -- second part
        -- third part version of HTTP being used
 
 * response *
    - status line has 2 parts and are separated by spaces
        -- first part
        -- second part
        -- third part is english-readable message (Not Found)
 
 - header lines
    -- one line per header
    -- take form of Header key : value
    
 - message body
    -- after the header lines
    -- where the data or files are placed in a POST
 
 ---> Domain: physical server where your website is hosted
 ---> UniformResourceIndentifier(URI): the identifier which maps to files on your server(directory on server)
 ---> Query String: Part of a GET request to easily pass in values to customise the output
 
 * Web API's *
 
 - Aplication Web Interface
 - a way for parts of software to interface with other software
 - Web API's 
 
 * REST API's *
 
 - stateless --> required state to handle the request is all contained within the request itself.
 - doesn't need to know anything about our app
 - server does not need to leep track of communication histories
 
 -> cacheable -- responses must defines themselves as cacheable or not
 -> client-server client and server concersn are spearated
 -> layered system - client doesn't know(or care) if they are connected to the main server or a load balancing server
 -> code on Demeand(optional) - server can temporarily extend or customize functionality of a client by transferring logic to them
 
 * URL Session *
 
 - highly synchronous
 - two ways of interactiong with RESTful services...w/ completion handlers or delegation
 - http requests are consisered "tasks"
 - 3 types of tasks
    -- data
    -- upload
    -- download
 
 -> setup
    - initialized w/ URLSessionConfiguration
        -- Default - disk-based
        -- Ephemeral - not disk-based, everything in memory only
        -- Background - default, except separate process handles all data structures
    - configurations have many properties for customization
        -- EX: set max number of connections per host, timeout intervals, cell access or wifi only, and http header fields
    - also has a sharedSession singleton avaiable to use based on a default session
 
 
 
 
 
 */
