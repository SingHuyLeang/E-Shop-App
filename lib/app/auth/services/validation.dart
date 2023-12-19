class Validation {
  final RegExp emailRegExp = RegExp(r"^[a-zA-z0-9.]+@[a-zA-z0-9.]+\.[a-zA-Z]+");
  final RegExp passwordRegExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  // firld empty
  final String emptyFieldEmail = 'Please enter your email';
  final String emptyFieldPassword = 'Please enter your password';
  final String emptyFieldConfirmPassword = 'Please enter your confirm password';
  // invalid user
  final String invalidEmail = 'Invalid your email';
  final String invalidPassword = 'Invalid your password';
  // password strong or not
  final String weakPassword = 'Your password is so weak';
  final String shortPassword = 'Your password is so short';
  // password not equal
  final String passwordNotEqual = 'Your confirm password is equal your password';
}
