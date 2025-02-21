# MyAir: Air Quality Monitoring Application

## Contributors
- Ismaele Villa 
- Francesco Pastori

## Introduction
MyAir is a mobile application designed to monitor air quality, providing users with real-time data on air pollution across the globe. The app is particularly aimed at individuals who are concerned about pollution and their health. It allows users to track the air quality in cities they have visited, view live air quality data from around the world, and stay updated with the latest news on pollution.

## Features
- **Overall AQI Data:** Visualize an overall score based on the average AQI of cities visited over time, including data on PM2.5, PM10, SO2, CO, O3, and NO2.
- **Saved Locations:** Save favorite locations to easily access real-time air quality values.
- **Interactive Pollution Map:** A Google Map widget displaying AQI data using a color-coded system to indicate pollution levels.
- **User’s Diary:** A calendar-style view to add and track AQI values of cities visited each day.
- **News:** Real-time news about pollution and health, available in multiple languages.
- **AI Chatbot:** An in-app chatbot to answer pollution-related questions, using OpenAI's ChatGPT-3.5 API.
- **Notification Reminder:** Daily notifications to remind users to log their AQI data.

## Architectural Design
### Overview
MyAir is a Flutter application developed for Android and Tablet devices. It uses Firebase for user authentication and data storage, and retrieves air quality data from the Google Air Quality API.

### Data Management
The application uses Cloud Firestore to store user data, including favorite cities, visited cities, and related AQI data.

### Data Structure
The database consists of three main tables:
- Users: General user information.
- UsersDiary: Visited cities and related AQI values for each date.
- FavoriteCities: Track user’s saved locations.

### Architectural Style and Patterns
MyAir employs a two-tier architecture where backend logic is implemented mainly on the client side, with Firebase providing cloud storage. The application makes API calls to Google to retrieve air quality data and displays it to the user in real-time.

## Widgets
MyAir is built using several widgets, including:
- **Main Screens and Navigation:** Accessible via a bottom navigation bar, featuring Profile, Map, Home, News, and Diary screens.
- **Chatbot:** Uses OpenAI’s ChatGPT-3.5 for AI-driven interaction with users.
- **Place Picker:** Helps users select locations for AQI data.
- **Maps and Marker:** Custom GoogleMap widget with pollution heatmap tiles and markers.

## Notifications
The app uses Flutter Local Notifications to remind users to log their AQI data daily, scheduled for the evening to coincide with a likely free moment for the user.

## Dependencies
Key plugins used in the application:
- Cloud Firestore
- Flutter Google Places
- Google Maps Flutter
- Google Air Quality API
- News API
- OpenAI API
- Flutter Local Notifications

## User Interface
Designed using the FlutterFlow platform for both light and dark modes. The UI includes authentication pages, a profile page, settings, contact us, help and support, a pollution map, homepage, diary, news page, and chatbot page.


## App Testing
### Unit Testing
Most methods involve API calls or screen layout organization, making unit testing inappropriate.

### Widget Testing
Mocked versions of key widgets were developed to eliminate Firestore queries and API calls, replacing them with static values for testing.

### Integration Testing
Simulates user behavior within the app, covering main functionalities including authentication, navigation, and interaction with key features.

### Coverage
Integration tests covered all main functionalities of the app, including all navigation bar pages and authentication pages.

## Effort Spent and Contribution
| Student          | Database Design | App Documentation | Implementation | Presentation |
|------------------|-----------------|-------------------|----------------|--------------|
| Francesco Pastori| 2h              | 36h               | 100h           | 10h          |
| Ismaele Villa    | 2h              | 36h               | 100h           | 2h           |


## WARNING
the code of the application is temporarily private due to privacy issues
