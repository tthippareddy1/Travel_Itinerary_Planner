# travelitineraryplanner

travelitineraryplanner is a travel companion app designed to simplify trip planning and foster connections between like-minded travelers. The app provides tools for discovering nearby attractions, creating or joining trips, and managing trip details with real-time currency conversion.

## Objective

travelitineraryplanner aims to enhance the travel experience by:
- Simplifying the discovery of nearby attractions based on the user's location.
- Enabling hassle-free trip planning with start/end location selection and trip cost management.
- Fostering connections between travelers through trip-sharing features.
- Offering real-time currency conversion to make trip planning seamless across borders.

## Key Features

### Login Screen
- Provides secure access with **Sign In**, **Sign Up**, and **Forgot Password** options.

### Discover Screen
- Prompts for location access to display:
  - Nearby tourist spots.
  - Other popular attractions.

### Tourist Spot Details
- Displays detailed information about selected tourist spots to help users plan better.

### Trip Management
- **Create a Trip**:
  - Select start and end locations using Google Maps API.
  - Add trip details like date, name, and round trip cost in USD.
- **Join a Trip**:
  - Browse available trips and view their details.
  - Convert trip costs into chosen currencies using the CurrencyLayer API.

## APIs and Integrations

- **Google Maps API**: Enables interactive map features for selecting locations.
- **CurrencyLayer API**: Converts trip costs into multiple currencies.
- **Firebase**:
  - Authentication for secure user profiles.
  - Firestore for storing trips and user data.

## Demo Flow

1. Launch the app → Navigate to the **Login/Sign-Up Screen**.
2. Grant location access → Explore nearby tourist spots on the **Discover Screen**.
3. Select a tourist spot → View detailed information.
4. Create or join a trip:
   - **Create a Trip**: Input details such as start and end locations, trip date, and cost.
   - **Join a Trip**: Browse available trips and use real-time currency conversion for trip costs.

## Testing Plan

### Functional Testing
- Validate all features like login, trip creation, and currency conversion.

### User Interface Testing
- Ensure the UI is visually appealing and responsive across devices.

### Integration Testing
- Test interactions between APIs and Firebase for smooth data flow.

### Performance Testing
- Assess app performance under high user loads and varying network conditions.

### Regression Testing
- Ensure all features work as intended after updates or bug fixes.

## Getting Started

This project is built using Flutter. To get started with development, refer to these resources:
- [Flutter Documentation](https://docs.flutter.dev/)
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

## Demo Presentation Video:
- [https://youtu.be/kSFviVu4m4U](https://youtu.be/kSFviVu4m4U)

## Powerpoint Presentation Link:
- https://docs.google.com/presentation/d/1YKuCQk7LhZIVRXdiE7_aMvM8gcu9NSBZ/edit?usp=sharing&ouid=107825724437374462255&rtpof=true&sd=true

## Installation

1. Clone this repository:
   ```bash
   https://github.com/tthippareddy1/Travel_Itinerary_Planner
