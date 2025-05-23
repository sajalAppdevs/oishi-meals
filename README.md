# Oishi Meals

Oishi Meals is a Flutter application that helps users discover and manage meal recipes. The app provides a user-friendly interface to browse different meal categories, view detailed recipes, and manage favorite meals.

## Features

- **Meal Categories**: Browse meals organized by categories
- **Detailed Recipes**: View comprehensive recipe information including:
  - Ingredients list
  - Step-by-step cooking instructions
  - Preparation time
  - Complexity level
  - Affordability rating
- **Dietary Preferences**: Filter meals based on:
  - Gluten-free
  - Lactose-free
  - Vegan
  - Vegetarian
- **Favorites**: Save and manage your favorite meals
- **User-friendly Navigation**: Bottom navigation bar for easy access to categories and favorites

## Screenshots

<div style="display: flex; flex-wrap: wrap; gap: 10px;">
    <img src="screenshots/screenshot-1.png" width="200" alt="Categories Screen">
    <img src="screenshots/screenshot-2.png" width="200" alt="Meal Details Screen">
    <img src="screenshots/screenshot-3.png" width="200" alt="Favorites Screen">
</div>

## Technical Details

### Architecture

The app follows a clean architecture pattern with the following structure:

```
lib/
├── models/         # Data models
├── screens/        # UI screens
├── widgets/        # Reusable UI components
└── utils/          # Utility classes and constants
```

### Dependencies

- Flutter SDK: >=2.16.0 <3.0.0
- cupertino_icons: ^1.0.2

## Getting Started

1. **Prerequisites**
   - Flutter SDK
   - Android Studio / VS Code
   - Android Emulator / iOS Simulator

2. **Installation**
   ```bash
   # Clone the repository
   git clone [repository-url]

   # Navigate to project directory
   cd oishi-meals

   # Install dependencies
   flutter pub get

   # Run the app
   flutter run
   ```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.