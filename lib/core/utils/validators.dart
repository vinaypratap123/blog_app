///.... Email validator
String? customEmailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email';
  }
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

///.... password validator
String? customPasswordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters';
  }
  if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
    return 'Password must contain at least one uppercase letter';
  }
  if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
    return 'Password must contain at least one lowercase letter';
  }
  if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
    return 'Password must contain at least one number';
  }
  if (!RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>])').hasMatch(value)) {
    return 'Password must contain at least one special character';
  }
  return null;
}

///.... fullname validator
String? customFullnameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a name';
  }
  if (value.length < 3) {
    return 'Name must be at least 3 characters';
  }

  return null;
}
