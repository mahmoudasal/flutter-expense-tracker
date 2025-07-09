# Contributing to Flutter Expense Tracker

First off, thank you for considering contributing to Flutter Expense Tracker! It's people like you that make this project great.

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the existing issues as you might find out that you don't need to create one. When you are creating a bug report, please include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps which reproduce the problem**
- **Provide specific examples to demonstrate the steps**
- **Describe the behavior you observed after following the steps**
- **Explain which behavior you expected to see instead and why**
- **Include screenshots and animated GIFs if possible**

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:

- **Use a clear and descriptive title**
- **Provide a step-by-step description of the suggested enhancement**
- **Provide specific examples to demonstrate the steps**
- **Describe the current behavior and explain which behavior you expected to see instead**
- **Explain why this enhancement would be useful**

### Pull Requests

1. Fork the repository
2. Create a new branch from `main` for your feature or bug fix
3. Make your changes
4. Add or update tests as appropriate
5. Ensure the code follows the project's coding standards
6. Commit your changes using conventional commit messages
7. Push to your fork and submit a pull request

#### Conventional Commits

We use [Conventional Commits](https://www.conventionalcommits.org/) for commit messages:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

Types:
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that do not affect the meaning of the code
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `chore`: Changes to the build process or auxiliary tools

Examples:
```
feat: add expense search functionality
fix: resolve date picker crash on Android
docs: update installation instructions
style: format code according to dart standards
refactor: simplify expense calculation logic
test: add unit tests for expense model
chore: update dependencies to latest versions
```

## Development Process

### Setup Development Environment

1. Install Flutter SDK (3.8.1 or higher)
2. Clone your fork of the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter analyze` to check for any issues
5. Run `flutter test` to ensure all tests pass

### Coding Standards

- Follow [Dart style guide](https://dart.dev/guides/language/effective-dart/style)
- Use meaningful variable and function names
- Write self-documenting code with appropriate comments
- Ensure code is properly formatted using `dart format`
- Add tests for new functionality

### Testing

- Write unit tests for new features
- Ensure all existing tests continue to pass
- Test on both Android and iOS if possible
- Test on different screen sizes

## Project Structure

```
lib/
├── main.dart              # App entry point
├── expenses.dart          # Main expenses screen
├── models/                # Data models
│   └── expense.dart
└── widgets/               # Reusable widgets
    ├── new_expense.dart
    └── expenses_list/
```

## Questions?

Don't hesitate to ask questions by opening an issue or reaching out to the maintainers directly.

Thank you for contributing! 🎉
