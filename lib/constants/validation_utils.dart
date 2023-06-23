class Validations {
  static String? validateEmail(email) {
    RegExp _emailRegex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (email == null || email.trim().isEmpty) {
      return "Please enter your email address";
    }
    if (!_emailRegex.hasMatch(email)) {
      return "Please enter valid email address";
    }
    return null;
  }

  static String? validatePassword(password, {rePassword}) {
    // RegExp _passRegex = RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}');
    if (password == null || password.trim().isEmpty) {
      return "Please enter a password";
    }
    if (password.trim().length < 6) {
      return "Password must be at least 6 characters";
    }
    // if (!_passRegex.hasMatch(password)) {
    //   return "Must contain at least one number and one uppercase and lowercase letter";
    // }
    if (rePassword != null && rePassword != password) {
      return "Confirm password is not match";
    }
    return null;
  }

  static validateEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }
  }
}
