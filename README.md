# iOS Photo Viewer App

This is a simple iOS app that displays a list of photos retrieved from a public API. Users can click on a photo to view it in full screen mode, and there is an ad placeholder after every 5 photos. Additionally, the app can work in offline mode by saving up to 20 items in an array.

## Features

- Displays a list of photos retrieved from the public API
- Handles API paging to display more photos
- Displays author name and image for each photo
- Inserts an ad placeholder after every 5 photos
- Displays the most dominant color of the selected photo as the background in the details screen
- Works in offline mode by saving up to 20 items in an array

## API

The app uses the following API to retrieve photos:

https://picsum.photos/v2/list?page={page}&limit={limit}


## Requirements

- iOS 15.0+
- Xcode 13+
- Swift 5.4+

## Installation

1. Clone the repository: `git clone https://github.com/<username>/<repository>.git`
2. Open the project in Xcode: `cd <repository> && open iOSPhotoViewer.xcodeproj`
3. Build and run the app on a simulator or device

## Usage

1. Launch the app
2. Scroll through the list of photos
3. Click on a photo to view it in full screen mode
4. To view more photos, scroll to the bottom of the list and the app will load more photos automatically
5. In offline mode, the app will display the saved items from the array

## Credits

This app was developed by <Your Name> as part of a coding challenge.

## License

This app is licensed under the MIT License. See the LICENSE file for more information.
