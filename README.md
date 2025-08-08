# FLEX UI

A beautiful collection of eCommerce widgets for Flutter developers. Build stunning storefronts faster.

## Overview

FLEX UI is **NOT** a component library - it's better. It's a carefully crafted collection of eCommerce widgets and utilities that you can copy and paste directly into your Flutter applications.

### Why Not a Component Library?

We deliberately chose not to make this a traditional component library because:

1. **No Dependencies** - You don't install it as a package dependency
2. **Full Control** - The code is yours to customize and modify
3. **Cherry Pick** - Take only what you need, leave what you don't
4. **Learn & Build** - Use this as a reference to build your own component libraries

Think of FLEX UI as your personal UI cookbook - grab the recipes you like and make them your own.

## Installation

You can install FLEX UI manually by copying the `lib` folder into your project, or by using the FLEX CLI.

## Project Structure

### For Consumers

When you add FLEX UI to your app, you'll get the following structure:

```
lib/
├── theme/                         # Theme Configuration
│   ├── brand_theme_extension.dart # Brand colors beyond Material Design
│   └── design_tokens.dart         # Design tokens for colors and values
│
├── utils/                         # Utilities
│   ├── context_extensions.dart    # Quick access to theme data from context
│   └── snackbar_extensions.dart   # Branded snackbar extensions
│
├── widgets/                       # FLEX UI Components
│   ├── app_bar/                   # Flex App Bar
│   ├── carousel/                  # Carousel display widget
│   └── etc/                       # Other components
│
└── main.dart                      # Widgetbook explorer app
```

### For Contributors

```
flex_ui/
├── app/              # Core UI library and Widgetbook
│   └── lib/          # Widget implementations
│
└── playground/       # Flutter Web documentation app
    ├── lib/          # Auto-route implementation
    └── web/          # Web-specific assets
```

### `/app` Directory

The `/app` directory contains the core UI library and a Widgetbook implementation. This is where you'll find:
- All widget and utility implementations
- Widget examples and documentation
- A runnable Widgetbook application for exploring components

To explore the widgets in Widgetbook, run:
```bash
make widgetbook
```

### `/playground` Directory

The `/playground` directory hosts a Flutter Web application built with `auto_route`. This application serves two primary purposes:
1. Provides widget previews via iFrames for the FLEX Documentation website
2. Offers live code examples for developers

To compile and deploy the playground:
```bash
make compile_and_deploy
```

## How It Works

### 1. Design Tokens (`/theme`)
The foundation of your design system:
```dart
// design_tokens.dart
class FlexColors {
  static const Color brandPrimary = Color(0xFF2D3142);
  static const Color brandSecondary = Color(0xFFEF8354);
  static const Color brandAccent = Color(0xFFF1FF61);
  // ...
}
```

### 2. Theme Configuration (`/theme`)
Customize the look and feel:
```dart
// brand_theme_extension.dart
final Color brandAccent;
final Color onBrandAccent;

const BrandThemeExtension({
  required this.brandAccent,
  required this.onBrandAccent,
});

static const light = BrandThemeExtension(
    brandAccent: DesignTokens.brandAccent,
    onBrandAccent: DesignTokens.neutralBlack
);
```

### 3. Widgets (`/widgets`)
Copy the widgets you need:
```dart
// product_card.dart
class FlexProductCard extends StatelessWidget {
  final String productName;
  final String imageUrl;
  // ...
  
  // Implementation...
}
```

### 4. Explore & Preview
Run the included Widgetbook app to explore components:
```bash
flutter run -d chrome
```

---

## Development & Contributing

### Prerequisites

- Flutter SDK
- Firebase CLI (for deployment)
- Git

### Getting Started

1. Clone the repository:
```bash
git clone https://github.com/flex-storefront/flex_ui.git
cd flex_ui
```

2. Install dependencies:
```bash
flutter pub get
cd app && flutter pub get
cd ../playground && flutter pub get
```

### Available Commands

```makefile
# Compile the playground web application
make compile

# Deploy to Firebase
make deploy

# Compile and deploy in one command
make compile_and_deploy

# Run Widgetbook in Chrome
make widgetbook
```

### Contributing Guidelines

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-widget`)
3. Commit your changes (`git commit -m 'feat: add some amazing widget'`)
4. Push to the branch (`git push origin feature/amazing-widget`)
5. Open a Pull Request

Please ensure your PR adheres to:
- Proper documentation of new widgets
- Consistent code formatting
- Inclusion of example usage in Widgetbook
- Updates to the CHANGELOG if applicable

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

This project is tested with BrowserStack

## Support

For support, please:
1. Check the [Documentation](https://flex.base1.com)
2. Open an issue in this repository
3. Contact the maintainers team

---
Made with ♥️ by the FLEX Team
