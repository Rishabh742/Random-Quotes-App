Project Overview
 The "Random Quotes App" is a simple Flutter application designed to display random quotes fetched from an external API. When the user taps the "Fetch Quote" button, the app sends an HTTP GET 
 request to https://api.quotable.io/random using the http package. The response, which is in JSON format, is then parsed to extract the "content" field (the quote), and the UI updates to display this quote. 
 The project demonstrates basic Flutter app structure, asynchronous programming, state management, and API integration.

Project Structure
 The project follows the standard Flutter directory layout:

   (1) android/ and ios/: Auto-generated directories containing platform-specific code.
   (2) lib/main.dart: The primary Dart file containing the app’s code.
   (3) pubspec.yaml: The configuration file that defines the app’s dependencies (including the http package), assets, and metadata.
   (4) README.md: (Optional) Contains project description and instructions on how to run the project.

Detailed Explanation of Main Components
1. pubspec.yaml

  Purpose:
This file lists all dependencies and configurations required for the project. The http package is included as a dependency to facilitate API calls.

  Key Sections:

   (1) Dependencies: Lists Flutter SDK and http: ^0.13.5, which provides functions for making HTTP requests.
   (2) Environment: Specifies the Dart SDK version constraints.
   (3) Flutter: Indicates that the project uses Material Design and allows adding assets if needed (like images).

2. lib/main.dart
This is the heart of the application, and it contains all the code needed to run the app.

   (1) main() Function:
The entry point of the app. It calls runApp(MyApp()), which starts the Flutter application.

   (2) MyApp Widget:
A StatelessWidget that sets up the MaterialApp. It defines:

   (3) Title: The name of the app displayed on the app switcher.

   (4) Theme: Defines a primary color scheme (blue in this case).

   (5) Home: Sets QuoteScreen as the home widget.

   (3) QuoteScreen Widget:
    (a) A StatefulWidget because the displayed quote changes when a new quote is fetched.

    (b) State Variable: quote is a string variable that holds the current quote to display. It is initially set to a default message prompting the user to fetch a quote.

   (4) fetchQuote() Method:

       Purpose:
   This asynchronous method is triggered when the "Fetch Quote" button is pressed.

    How It Works:
       (1) HTTP Request:
         Uses http.get(Uri.parse(url)) to send a GET request to the API endpoint.

       (2) Response Handling:
         (a) If the HTTP status code is 200 (indicating success), it decodes the JSON response using json.decode(response.body) and extracts the value associated with the "content" key.
         (b) It then updates the quote variable using setState, which causes the UI to rebuild and display the new quote.
         (c) If the response status code is not 200, or if any exception occurs during the API call (handled by a try-catch block), the method updates the quote variable with an error message.

    (5) UI Layout in the build Method:
         (a) Scaffold:
         Provides a basic visual layout structure (app bar, body, etc.).
         (b) AppBar:
         Displays the title "Random Quotes".
         (c) Body:
Uses a Center widget combined with Padding for consistent spacing.
   (1) A Column widget is used to vertically arrange:
      (a) A Text widget displaying the current quote. It is centered and styled with a larger font size.
      (b) A SizedBox for spacing.
      (c) An ElevatedButton that, when pressed, calls the fetchQuote() method to update the quote.
