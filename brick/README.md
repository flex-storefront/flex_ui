# FLEX UI 🧱

A beautiful collection of eCommerce widgets for Flutter developers. Build stunning storefronts faster.

## What is FLEX UI?

FLEX UI is **NOT** a component library - it's better. It's a carefully crafted collection of eCommerce widgets that you can copy and paste directly into your Flutter applications.

### Why Not a Component Library?

We deliberately chose not to make this a traditional component library because:

1. **No Dependencies** - You don't install it as a package dependency
2. **Full Control** - The code is yours to customize and modify
3. **Cherry Pick** - Take only what you need, leave what you don't
4. **Learn & Build** - Use this as a reference to build your own component libraries

Think of FLEX UI as your personal UI cookbook - grab the recipes you like and make them your own.

## Installation

1. Install the Mason CLI:
```bash
dart pub global activate mason_cli
```

2. Initialize Mason in your project:
```bash
mason init
```

3. Add FLEX UI brick:
```bash
mason add flex_ui --git-url https://github.com/flex-storefront/flex_ui --git-path /brick
```

4. Get the brick:
```bash
mason get
```

5. Generate the UI components:
```bash
mason make flex_ui
```

## Project Structure

When you generate the FLEX UI components, you'll get the following structure:

```
lib/
├── theme/                   # Theme Configuration
│   ├── flex_app_theme.dart  # Main app theme
│   └── subthemes/           # Widget-specific themes
│
├── tokens/             # Design System Tokens
│   ├── colors.dart     # Color palette
│   ├── typography.dart # Text styles
│   └── sizes.dart      # Layout constants
│
├── utils/             # Utilities
│   └── extensions/    # Common helper functions
│
├── widgets/          # FLEX UI Components
│   ├── app_bar/      # Flex App Bar
│   ├── carousel/     # Carousel display widget
│   └── etc/          # Other components
│
└── main.dart         # Widgetbook explorer app
```

## How It Works

### 1. Design Tokens (`/tokens`)
The foundation of your design system:
```dart
// colors.dart
class FlexColors {
  static const primary = Color(0xFF2D3142);
  static const accent = Color(0xFFEF8354);
  // ...
}
```

### 2. Theme Configuration (`/theme`)
Customize the look and feel:
```dart
// app_theme.dart
ThemeData buildFlexTheme() {
  return ThemeData(
    colorScheme: FlexColors.lightScheme,
    textTheme: FlexTextTheme.textTheme,
    // ...
  );
}
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

## Usage Example

1. Choose the components you want
2. Copy them into your project
3. Customize as needed:

```dart
// Your customized version
class MyProductCard extends StatelessWidget {
  final Product product;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: // Your customized implementation...
    );
  }
}
```

## 🧱 Available Widgets

| Widget | Description |
|--------|-------------|
| `FlexAppBar` | A customizable app bar component with built-in support for common eCommerce actions like cart, search, and menu icons. Handles icon layout and spacing automatically. |
| `FlexBanner` | A responsive banner component designed for homepage promotions and marketing content. Integrates seamlessly with CMS systems for dynamic content updates. |
| `FlexButton` | A flexible button widget that extends [ElevatedButton] with support for loading and disabled states. |
| `FlexProductCard` | A versatile product display card showing product image, title, price, and optional elements like ratings and sale badges. Optimized for grid and list layouts. |
| `FlexCarousel` | A smooth, gesture-enabled carousel widget for showcasing multiple banners or products. Features autoplay, custom transitions, and pagination indicators. |
| `FlexImage` | An enhanced image widget that handles loading states, error fallbacks, and image caching. Includes placeholder support and progressive loading for larger images. |
| `FlexQuantitySelector` | An intuitive quantity selector with increment/decrement buttons and direct input. Includes inventory validation and customizable min/max limits. |

## Customization

Each component is designed to be customized. Common customization points:

1. **Styling**
   - Colors, typography, and spacing via theme
   - Custom shapes and decorations
   
2. **Behavior**
   - Callback functions
   - State management integration
   
3. **Layout**
   - Responsive breakpoints
   - Grid configurations

## Best Practices

1. **Copy Mindfully**
   - Only copy what you need
   - Keep track of what you've copied
   - Document your customizations

2. **Theme Integration**
   - Use the provided theme structure
   - Extend tokens for your brand
   - Keep consistent styling

3. **Maintenance**
   - Create your own component library
   - Document your changes
   - Share improvements back with the community

## License

MIT License - Feel free to use in personal or commercial projects.

## Support

- 📚 [Documentation](https://flex.base1.com)
- 🐛 [Issue Tracker](https://github.com/flex-storefront/flex_ui/issues)

---
Made with 💙 by the FLEX Team