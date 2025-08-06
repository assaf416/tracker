# README

Dalore Tracker is a collection of solutions for mobile fleets , taxi drivers , emergency units , assets management
Tracker is a PWA for web and mobile users in Hebrew , English and Russian support using bootrap 5.3.2 based ui and rails as the server 

Tracker Units 

 We Provide veraiarty of propraitary mobile gps trackable units:
    * 45$ gps + 4GModem in a kit with enclousre
    * 95$ watch with gps + 4GModem in a kit with enclousre
    * 195$ industry standard mobile units with Android or KaiOS  with gps + 4GModem in a kit with enclousre

All our Mobile units are programmable via RESTFUL api or PWA APPS The include features like
    * Device Status
    * Text messages
    * Geofence and revese geofence
    * Users commands 

Map Server
    * we are using local server of opemstreetmap and leaflets for the rendering part
    * we provide Search API for locations
    * we generate routes based on our local server database

our apps supports mobile devices using PWA technology without fussing with app store!!

We Provide Application templates for industry specific solutions such as:
    * Taxi Operation , with dispatcher and driver pages where driver is mobile phone this app can run a taxi stations
    * Delivery Company, Delivery Tracking app with GPS Support and views for mobile and web for the Dispatcher , the driver or the delivery. generate historic and reports 
    * Assets Management, Track Expensive Assets out side for e.g. Trackors and any farm equipment up to cranes.. we support video files of the mobile units and a calendar page for future location of each device. 
    * School Buss



Main rails models 
    * devices - our registered devices
    * drivers - Driver list for fleets and taxi app
    * passengers - users that are registered to a ride as passengers
    * messages - where drivers and user can chat
    * rides - where drivers plan and drive from the ride source to destinations , used for app like taxi and delivery 
    * tickets - Tasks with starts and end time, status , driver or user owning the ticket used for delivery solution 
    * Activities - we track the devices, drivers, rides , tickets into a managable log with api and filtering
    * Videos - historic archive of all the security camera send  stored in YOUTUBE..
    Activity include
        - location (lat,long)
        - last_location_time
        - headings
        - speed
        - level [INFO | WARNING| ERROR | LOCATION | ]
        - kind - what kind of device we have [ :mobile_unit | :watch | :phone]
        - battary status
        - app settings
        - os [ Android | Web | KaiOs |iphone | tablets]
        - version - current version of embedded os and apps


    Drivers are the Fleet members, they al have a name and image - or avatar and has user and password for the apps
    Driver has many Tickets
    Driver has many Videos
    Driver has many Activities
    Driver has one device which is his mobile phone
    Driver has many rides where he picks ups Passengers or devlier goods emergency Ambulance ride etc.


    Device is one of our mobile units with ssid , barcode , model , version and settings
    Device has many Activities when sending Location , and Status back to the server every x seconds.. 


    Ticket are the trackable tasks for driver and rides. it used for delivery apps to update packae devliery status. tickets include estimated and actual time for completion so you can be alerted on late tasks and miss deliveries

    Messages can be either text , audio or video they belongs to driver messages area used for a chat page


Target markets are
  - Schools and public students transportaion where we provide a Full Solution for web and mobile solution with The Drivers , the Passengers all can share the bus locations when it picks up the student or passenger. we provide late notifications and two way messaging with audio and video support. we use web notifications to send updates about each ride

  - Emergency Markets
    where we have a war room console of Emergency forces Locations, Tickets and Video. Dispatchers can open tickets to drivers with the location of the accident. the driver can comunicate over chat with video and audio support


  - Assets management Companies
    our assets management app allow you to track you assets including vide images if there is camera support
    we support RESFUL API to integrate with CRM line Dynamic 386
    
    # tracker
