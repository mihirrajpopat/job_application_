class Validation {
  static emailValidate(value) {
    bool flag = true;

    if (flag == true) {
      return null;
    }
    if (value == null || value.isEmpty) {
      return "Enter Valid Mail Address";
    }
    final bool emailValid =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);

    if (emailValid == false) {
      return "Enter Valid Mail Address";
    }

    return null;
  }

  static phoneValidate(value) {
    bool flag = true;

    if (flag == true) {
      return null;
    }
    if (value == null || value.isEmpty) {
      return "Please Enter Valid Mobile Number";
    }

    final bool mobileValidate = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value!);

    if (mobileValidate == false) {
      return "Please Enter Valid Mobile Number";
    }
    return null;
  }

  static passwordValidate(value) {
    bool flag = true;

    if (flag == true) {
      return null;
    }
    if (value == null || value.isEmpty) {
      return "Please make Password Strong";
    }
    final bool passwordValidate =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value!);

    if (passwordValidate == false) {
      return "Please make Password Strong";
    }

    return null;
  }

  static conforimpasswordValidate(value, firstvalue) {
    bool flag = true;

    if (flag == true) {
      return null;
    }
    if (value == null || value.isEmpty) {
      return "Password not Matched";
    }

    if (value == firstvalue) {
      return "Password not Matched";
    }
  }

  static requiredFiled(value) {
    bool flag = true;

    if (flag == true) {
      return null;
    }
    if (value == null || value.isEmpty) {
      return "please filed above filed";
    }

    return null;
  }
}
