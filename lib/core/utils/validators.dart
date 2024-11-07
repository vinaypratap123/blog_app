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

///.... username validator
String? customUsernameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a username';
  }
  if (value.length < 3) {
    return 'Username must be at least 3 characters';
  }
  if (value.contains(' ')) {
    return 'Username cannot contain spaces';
  }
  final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
  if (!usernameRegex.hasMatch(value)) {
    return 'Username can only contain letters, numbers, and underscores';
  }
  return null;
}
