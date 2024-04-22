# CSS-545-HW2

Document that contains:
(5 Points) Various approaches to storage management on your platform of choice
(5 Points) Pros AND cons of each approach for your project


Document on Cross-Platform Storage Management Approaches in Flutter:


I have chosen Flutter to develop the project. Flutter supports several data storage options, suitable for different types of applications and data needs. My application is cross-platform and works across the iOS, macOS and Android platforms. Accordingly, here are the approaches for cross-platform storage management in Flutter:
Local Storage Options.

1.	Shared Preferences
●	Description: This plugin wraps platform-specific persistent storage for simple data (key-value pairs). It is ideal for saving user preferences or settings.
●	Pros: Easy to implement; automatically abstracts platform differences; synchronizes data across app instances.
●	Cons: Limited to simple data types; not suited for storing large amounts of data or complex objects.
2.	SQLite (via the sqflite package)
●	Description: A robust option for structured data storage that creates a local database on the device.
●	Pros: Supports complex data models and queries; works consistently across all target platforms.
●	Cons: Requires more setup and maintenance; database schema migrations need careful handling as your app evolves.
3.	Hive
●	Description: A lightweight, NoSQL database written in pure Dart, making it a good fit for Flutter applications.
●	Pros: Fast performance; does not require bridge to native code hence faster on all platforms; simple to use with a flexible schema.
●	Cons: Not as widely used or tested in large-scale production as SQLite; might have limitations in highly complex data operations.
Remote Storage Options
1.	Firebase Firestore
●	Description: A cloud-hosted NoSQL database that syncs across all users in real-time.
●	Pros: Seamless integration with Flutter; provides offline data access and synchronization; robust security features.
●	Cons: Depends on network availability for initial data fetching and updates; costs can scale up with increased usage.
2.	Cloud Storage Solutions (e.g., Firebase Storage, AWS S3)
●	Description: For storing files like images, videos, and large datasets.
●	Pros: Offloads heavy data handling from devices; scalable storage capacity; robust data management and security.
●	Cons: Requires robust internet connection for uploads and downloads; implementation complexity; potential latency in data access.
Document : HW2Assignment (https://github.com/shristiUW/CSS-545-HW2/blob/main/HW2Assignment.docx)

App that demonstrates:
(5 Points) Store AND Load a media item locally (e.g. music, video, image)


App loads image from Asset folder and also loads image from gallery

<img width="380" alt="image" src="https://github.com/shristiUW/CSS-545-HW2/assets/148150150/037a4fb4-c9cf-4921-b2ff-97a0f60beb14">


Load image from gallery:

<img width="380" alt="image" src="https://github.com/shristiUW/CSS-545-HW2/assets/148150150/f7ebfa14-5ac2-48ec-86c2-9720cec3e606">


Save image to gallery(status is shown below):

<img width="380" alt="image" src="https://github.com/shristiUW/CSS-545-HW2/assets/148150150/a16eba69-88fe-4e21-bb3f-3e2645745ecb">


Load image from asset library:

<img width="380" alt="image" src="https://github.com/shristiUW/CSS-545-HW2/assets/148150150/de55d831-6599-4bb8-a06b-7b6111d5ae89">


Save asset image to gallery:

<img width="380" alt="image" src="https://github.com/shristiUW/CSS-545-HW2/assets/148150150/ca9b351c-42bb-49f9-821c-b9ccb43ce38e">


Both images saved in gallery:

<img width="380" alt="image" src="https://github.com/shristiUW/CSS-545-HW2/assets/148150150/a3c37b5a-8d00-40eb-a756-16d5168df15d">



(5 Points) Store AND Load user settings locally:
For showing this, I am entering my name in text box.. it will automatically show in label as "Hello UserName"


<img width="380" alt="image" src="https://github.com/shristiUW/CSS-545-HW2/assets/148150150/59d02ac8-5f5b-443f-a9ce-13e5c11db5be">


When we close the app and run again the flutter run, the name will be fetched from user preference setting(SharedPreferences: key value pair)

<img width="380" alt="image" src="https://github.com/shristiUW/CSS-545-HW2/assets/148150150/6db69973-d0fe-401d-864b-c30c1490fa30">

