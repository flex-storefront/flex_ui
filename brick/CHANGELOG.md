# Changelog

All notable changes to the Flex Widgets Mason brick will be documented in this file.

## [1.1.0] - 2024-06-17

### Upgrades
- Upgraded Flutter to **3.27.0**.
- Updated dependency libraries to their latest compatible versions.

### Features
- Added extension for the deprecated `OnOpacity` call.

### Improvements
- Added a golden widget test for the `FlexBanner` component.
- Cleaned up unused imports for better code quality and maintainability.
- Updated FlexTextTheme _light/dark_. Text themes now use a color mapped to .onSurface have a base text theme with font family set to `Roboto`


## [1.0.0] - 2024-12-05

### Initial Release 🎉

#### Added Components

- **FlexAppBar**: Custom application bar widget
- **FlexBanner**: Banner display component
- **FlexButton**: Customizable button component
- **FlexCards**: Collection of card layout components
- **FlexCarousel**: Slideshow/carousel component
- **FlexGallery**: Specialized image gallery for product detail pages
- **FlexImage**: Advanced image component with:
  - Loading state placeholder
  - Error state handling
  - Built-in image caching
- **FlexQuantitySelector**: Quantity input component
- **FlexSearch**: Search bar component

#### Theme System

- **Theme Extensions**
  - Quick access properties for common theme values
  - Simplified theme data retrieval

- **Design Tokens**
  - Standardized color system
  - Consistent spacing and sizing scales

- **Complete Theme Presets**
  - Light theme configuration
  - Dark theme configuration
  - Customized sub-themes for:
    - Checkbox
    - Chips
    - ElevatedButton
    - IconButton
    - OutlinedButton
    - TextField
    - Text
