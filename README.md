#Grocery List for your iOS Device

It is an iPhone app that allows users to create a grocery list and save it.

##How is it made?

This app uses Core Data to store its data. Core Data is an object graph and persistence framework provided by Apple in the Mac OS X and iOS operating systems. The app uses a schema called a managed object model — an instance of NSManagedObjectModel. When you start a new project in Xcode and open the template selection dialog, select the Use Core Data checkbox. A source file for the Core Data model is created as part of the template. That source file will have the extension .xcdatamodeld. Select that file in the navigator area to display the Core Data model editor. Then you create an entiry and assign attributes to it. 

In the grocery list, we have image, name, note and quantity as attributes. This can be found in the file with the grocery_images_cd.xcdatamodeld file. Then two UIControllers were create: one for adding and editing information, and the other a table view controller to show the data.

##How to use it?

Just download the app on your phone and start using it.
