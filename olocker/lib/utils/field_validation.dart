class FieldValidator {
  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String? validateMobileNumber(String value) {
    if (value.isEmpty) {
      return 'Mobile number is required';
    } else if (value.length < 10) {
      return 'Enter atleast 10 digit mobile number';
    }
    return null;
  }

  String? validateOtpNumber(String value) {
    if (value.isEmpty) {
      return 'Otp number is required';
    } else if (value.length < 6) {
      return 'Enter valid otp number';
    }
    return null;
  }

  String? validateFirstName(String value) {
    if (value.isEmpty) {
      return 'First name is required';
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.isEmpty) {
      return 'Last name is required';
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
      return 'Referral code is required';
    }
    return null;
  }

  String? validateGrossWeight(String value) {
    if (value.isEmpty) {
      return 'Enter gross weight';
    }
    return null;
  }

  String? validatePurchasedFrom(String value) {
    if (value.isEmpty) {
      return 'Enter purchased from shop name';
    }
    return null;
  }

  String? validatePurchasedDate(String value) {
    if (value.isEmpty) {
      return 'Enter purchased date';
    }
    return null;
  }

  String? validatePurchasedPrice(String value) {
    if (value.isEmpty) {
      return 'Enter purchased price';
    }
    return null;
  }

  String? validateDob(String value) {
    if (value.isEmpty) {
      return 'Enter birthdate';
    }
    return null;
  }

  String? validatePinCode(String value) {
    if (value.isEmpty) {
      return 'Enter pincode';
    } else if(!RegExp("^[1-9]{1}[0-9]{2}\\s{0,1}[0-9]{3}").hasMatch(value)) {
      return 'Enter valid pincode';
    }
    return null;
  }

  String? validatePanCard(String value) {
    // regex = "[A-Z]{5}[0-9]{4}[A-Z]{1}";

    if (value.isEmpty) {
      return 'Enter pancard';
    } else if(!RegExp("[A-Z]{5}[0-9]{4}[A-Z]{1}").hasMatch(value)) {
      {
        return 'Invalid pan number';
      }
    }
    return null;
  }

  String? validateMonthlyIncome(String value) {
    if (value.isEmpty) {
      return 'Enter monthly income';
    }
    return null;
  }

  String? validateEmployerName(String value) {
    if (value.isEmpty) {
      return 'Enter employer name';
    }
    return null;
  }

  String? validateCurrentTotalEmi(String value) {
    if (value.isEmpty) {
      return 'Enter current total emi';
    }
    return null;
  }

  String? validateWhichBank(String value) {
    if (value.isEmpty) {
      return 'Enter bank name';
    }
    return null;
  }



}
