class WwValidator {
  static String? isInputEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return "This field cannot be empty";
    }
    return null;
  }

  static String? isNumeric(String? value) {
    if (value == null || double.tryParse(value) == null) {
      return "Please enter a valid number";
    }
    return null;
  }

  static String? isPositiveNumeric(String? value) {
    if (value == null ||
        double.tryParse(value) == null ||
        double.parse(value) <= 0) {
      return "Please enter a positive number";
    }
    return null;
  }

  static String? isNonNegativeNumeric(String? value) {
    if (value == null ||
        double.tryParse(value) == null ||
        double.parse(value) < 0) {
      return "Please enter a non-negative number";
    }
    return null;
  }

  static String? isValidEmail(String? value) {
    if (value == null ||
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  static String? isValidPassword(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  static String? isValidCurrency(String? value) {
    if (value == null ||
        double.tryParse(value) == null ||
        double.parse(value) <= 0) {
      return "Please enter a valid currency amount";
    }
    return null;
  }
}
