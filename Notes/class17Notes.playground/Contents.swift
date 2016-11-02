
import UIKit


                        ////// CLASS 17 \\\\\\
                        ////// 11/01/15 \\\\\\



/*
 #NOTES:
 
 *** App Delegate/Root View Controller ***
 
 - UIApplication Delegate Protocol
    -- defines methods called by the singleton UIApplication object in response to important event in the lifetime of your app(going from foreground to background, receiving local notification, etc)
    -- root object of your app
    -- contains apps startup code
    -- responds to changes
 
    ** didFinishLaunchingWithOptions **
        - called after your app has finished initialization process, but before the user sees anything
        - great spot to change root view controller based on preferences or saved data
        - great place to check for required info(token, for example), if present load main view controller
 
    ** UIWindow **
        - class that manages and coordinates the views an app displays on the device screen
        - subclass of UIView
        - 2 main jobs
            -- provide area for dsiplaying other views
            -- distribute events to the views
        - windows have z-axis(dictates which windows are closest to the user), alertView always has highest "z-window"
        - only one window at a time is allowed to receive events(key window)
        * working w/ UIWindow
            - most apps don't need code to work with
            - motsly used for interaction when there is a need to change the root view controller of app
            - use rootViewController property to initiate...
 
 
 *** UISearchBar ***
        --> text field based control
 
 - provides a text field for text input, a search button, bookmark button, and cancel button
 - relies on its delegate to perform searches when one of its buttons is pressed
 
 * UISearchBarDelegate *
    - access the user input and different functionality
    - conform to the delegate protocol to implement methods for handling user input(extension)
    - no required methods
    - primary methods:
        -> seacrhBar(_:textDidChange:)
        -> searchBarSearcButtonClicked(_:)
    - grab text with searchBar.text
 
 

 */