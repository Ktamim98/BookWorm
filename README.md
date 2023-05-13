# BookWorm
Bookworm is an iOS application that helps users keep track of their reading list. With Bookworm, users can add new books to their reading list, rate them, and write reviews. Users can also delete books they no longer want to track.The application is built using SwiftUI and CoreData frameworks.
## Features
The application includes the following features:

- Add new books to the reading list
- Rate books on a scale of 1 to 5 stars
- Write reviews for books
- Delete books from the reading list
- View book details, including title, author, genre, rating, and review
- Display a book's rating with either stars or emojis
- Sort books in the reading list by title or author.
- Display the book rating in red if it is less than 2 stars.
Dismiss the book details view using the @Environment(.dismiss) property.

## Technologies Used
- SwiftUI
- CoreData Framework
- NSPersistentContainer
- @Environment(.managedObjectContext)
- @FetchRequest(sortDescriptors: [ ])
- @Environment(.dismiss) property to dismiss the book details view
- RatingView


### Core Data Model
 The app uses a Core Data model named "BookWorm" with a single entity called "Book". The entity has the following attributes:
 
- id (UUID)
- title (String)
- author (String)
- genre (String)
- rating (Int16)
- review (String)
- 
#### Data Controller
- The app uses a data controller to manage the Core Data stack. The data controller creates an NSPersistentContainer and loads the persistent stores.

#### Fetch Request
- The app uses a fetch request to fetch the books from Core Data. The fetch request uses sort descriptors to sort the books by title or author.

#### RatingView
- The app uses a custom view called RatingView to allow users to rate books using a star rating system. The view takes a Binding<Int> parameter that represents the rating value. The view also has optional parameters for customizing the appearance of the star images, such as the on and off images, colors, and maximum rating value.

The view is also accessible and supports dynamic type.
  
## Acknowledgements
Bookworm was created as part of the 100 Days of SwiftUI course by Paul Hudson. The course provides an in-depth introduction to SwiftUI and includes several hands-on projects.
