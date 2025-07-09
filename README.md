# Flutter Expense Tracker 💰

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.8.1-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.0+-blue.svg)](https://dart.dev/)

A beautiful and intuitive expense tracking mobile application built with Flutter. Keep track of your daily expenses with an elegant user interface and powerful features.

## 📱 Screenshots

<!-- Add screenshots here once available -->
*Screenshots coming soon*

## ✨ Features

- 📊 **Expense Management**: Add, edit, and delete expenses with ease
- 🏷️ **Categories**: Organize expenses by categories (Food, Travel, Leisure, Work)
- 📅 **Date Tracking**: Keep track of when expenses occurred
- 💰 **Amount Tracking**: Monitor your spending with precise amount recording
- 🔄 **Undo Functionality**: Restore accidentally deleted expenses
- 📱 **Responsive Design**: Works seamlessly across different screen sizes
- 🎨 **Material Design**: Beautiful and intuitive user interface

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.8.1 or higher)
- [Dart SDK](https://dart.dev/get-dart) (3.0 or higher)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/mahmoudasal/flutter-expense-tracker.git
   cd flutter-expense-tracker
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Building for Production

#### Android
```bash
flutter build apk --release
```

#### iOS
```bash
flutter build ios --release
```

## 📂 Project Structure

```
lib/
├── main.dart              # App entry point
├── expenses.dart          # Main expenses screen
├── models/
│   └── expense.dart       # Expense data model
└── widgets/
    ├── new_expense.dart   # Add expense form
    └── expenses_list/     # Expense list components
```

## 🛠️ Dependencies

- [flutter](https://flutter.dev/) - UI framework
- [uuid](https://pub.dev/packages/uuid) - Generate unique IDs
- [intl](https://pub.dev/packages/intl) - Internationalization and date formatting
- [cupertino_icons](https://pub.dev/packages/cupertino_icons) - iOS-style icons

## 📖 Usage

1. **Adding Expenses**: Tap the '+' button in the app bar to open the expense form
2. **Categorizing**: Select from predefined categories (Food, Travel, Leisure, Work)
3. **Date Selection**: Choose the date when the expense occurred
4. **Amount Entry**: Enter the expense amount in your local currency
5. **Viewing Expenses**: Browse your expense list on the main screen
6. **Deleting Expenses**: Swipe or use delete functionality with undo option

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### How to Contribute

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Commit your changes**
   ```bash
   git commit -m 'feat: add amazing feature'
   ```
4. **Push to the branch**
   ```bash
   git push origin feature/amazing-feature
   ```
5. **Open a Pull Request**

### Commit Message Convention

This project follows [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` - New features
- `fix:` - Bug fixes
- `docs:` - Documentation changes
- `style:` - Code style changes (formatting, etc.)
- `refactor:` - Code refactoring
- `test:` - Adding or updating tests
- `chore:` - Maintenance tasks

## 🐛 Known Issues

- None currently identified

## 🗺️ Roadmap

- [ ] Add charts and analytics
- [ ] Implement data persistence (local database)
- [ ] Add expense categories customization
- [ ] Implement export functionality (CSV, PDF)
- [ ] Add dark mode support
- [ ] Implement backup and sync features
- [ ] Add budget tracking and alerts

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Mahmoud Asal**
- GitHub: [@mahmoudasal](https://github.com/mahmoudasal)
- Email: mahmoud.asal@example.com

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for the UI inspiration
- Open source community for the packages used

## 📞 Support

If you have any questions or need help, please open an issue on GitHub or contact me directly.

---

⭐ If you found this project helpful, please give it a star!
