class AppValidators {
  static String? fieldName(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    // Validation: only digits, length between 8 and 15, no "+"
    final regex = RegExp(r'^[0-9]{8,15}$');
    if (!regex.hasMatch(value.trim())) {
      return 'Invalid phone number';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.length < 8) {
      return 'Password is too short';
    }
    return null;
  }
}
