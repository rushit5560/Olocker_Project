class FieldValidator {
  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String? validateMobileNumber(String value) {
    if (value.isEmpty) {
      return 'Mobile Number is required';
    } else if (value.length < 10) {
      return 'Enter Atleast 10 digit Mobile Number';
    }
    return null;
  }

  String? validateOtpNumber(String value) {
    if (value.isEmpty) {
      return 'Otp number is required';
    } else if (value.length < 6) {
      return 'Enter valid Otp Number';
    }
    return null;
  }

  String? validateFirstName(String value) {
    if (value.isEmpty) {
      return 'First Name is required';
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.isEmpty) {
      return 'Last Name is required';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email is required";
    } else if (!isNumeric(value) &&
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return "Invalid email";
    } else {
      return null;
    }
  }

  String? validateRefferalCodeNumber(String value) {
    if (value.isEmpty) {
      return 'Refferal code is required';
    }
    return null;
  }

  String? validateGrossWeight(String value) {
    if (value.isEmpty) {
      return 'Enter Gross Weight';
    }
    return null;
  }

  String? validatePurchasedFrom(String value) {
    if (value.isEmpty) {
      return 'Enter Purchased From Shop Name';
    }
    return null;
  }

  String? validatePurchasedDate(String value) {
    if (value.isEmpty) {
      return 'Enter Purchased Date';
    }
    return null;
  }

  String? validatePurchasedPrice(String value) {
    if (value.isEmpty) {
      return 'Enter Purchased Price';
    }
    return null;
  }
}
