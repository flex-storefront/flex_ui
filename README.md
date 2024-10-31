# FLEX UI

A beautiful collection of eCommerce widgets for Flutter developers. Build stunning storefronts faster.

## Overview

FLEX UI is **NOT** a component library - it's better. It's a carefully crafted collection of eCommerce widgets that you can copy and paste directly into your Flutter applications.

## Project Structure

```
flex_ui/
├── app/               # Core UI library and Widgetbook
│   └── lib/          # Widget implementations
│
├── playground/        # Flutter Web documentation app
│   ├── lib/          # Auto-route implementation
│   └── web/          # Web-specific assets
│
├── brick/            # Mason brick for distribution
│   ├── CHANGELOG.md  # Version history
│   └── __brick__/    # Brick template files
│
└── tool/             # Development tools
    └── generator/    # Brick generation scripts
```

### `/app` Directory

The `/app` directory contains the core UI library and a Widgetbook implementation. This is where you'll find:
- All widget implementations
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

### `/brick` Directory

The `/brick` directory contains a Mason brick that can be installed via the Mason CLI. This allows developers to easily integrate FLEX UI components into their projects.

The brick includes:
- Pre-configured widget templates
- A maintained CHANGELOG documenting all updates
- Installation and usage instructions

### `/tool` Directory

The `/tool` directory contains development utilities, primarily focused on brick generation. The main script:
- Automatically generates the `/brick` directory content
- Updates based on changes in the `/app` directory
- Maintains consistency between the library and distribution files

To generate an updated brick:
```bash
make build_brick
```

## Development & Contributing

### Prerequisites

- Flutter SDK
- Firebase CLI (for deployment)
- Mason CLI
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

3. Install the Mason CLI:
```bash
dart pub global activate mason_cli
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

# Generate updated brick files
make build_brick
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
- Updates to the brick CHANGELOG if applicable

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For support, please:
1. Check the [Documentation](https://flex.base1.com)
2. Open an issue in this repository
3. Contact the maintainers team

---
Made with ♥️ by the FLEX UI Team
