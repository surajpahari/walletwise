class WwValidator {
  static String? isInputEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    return null;
  }
}
