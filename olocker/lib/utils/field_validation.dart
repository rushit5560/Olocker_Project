class FieldValidator {
  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String? validateMobileNumber(String value) {
    if (value.isEmpty) {
      return 'Mobile number is required.';
    } else if (value.length < 10) {
      return 'Enter atleast 10 digit mobile number.';
    } else if (value == "0000000000") {
      return 'Please enter valid mobile number.';
    }
    return null;
  }

  String? validateOtpNumber(String value) {
    if (value.isEmpty) {
      return 'Otp number is required.';
    } else if (value.length < 6) {
      return 'Enter valid otp number.';
    }
    return null;
  }

  String? validateFirstName(String value) {
    if (value.isEmpty) {
      return 'First name is required.';
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return 'Address is required.';
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.isEmpty) {
      return 'Last name is required.';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email is required.";
    } else if (!isNumeric(value) &&
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return "Invalid email.";
    } else {
      return null;
    }
  }

  String? signUpValidateEmail(String value) {
    if (value.isEmpty) {
      return null;
    } else {
      if (!isNumeric(value) &&
          !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
        return "Invalid email.";
      } else {
        return null;
      }
    }
  }

  String? validateRetailerCodeNumber(String value) {
    if (value.isEmpty) {
      return 'Retailer code is required.';
    }
    return null;
  }

  String? validateReferralCodeNumber(String value) {
    if (value.isEmpty) {
      return 'Referral code is required.';
    }
    return null;
  }

  String? validateProductName(String value) {
    if (value.isEmpty) {
      return 'Enter product name.';
    } else if (value.contains("SELECT PRODUCT NAME")) {
      return 'Please select product name.';
    }
    return null;
  }

  String? validateGrossWeight(String value) {
    if (value.isEmpty) {
      return 'Enter gross weight.';
    }
    return null;
  }

  String? validatePurchasedFrom(String value) {
    if (value.isEmpty) {
      return 'Enter purchased from shop name.';
    }

    return null;
  }

  String? validatePurchasedDate(String value) {
    if (value.isEmpty) {
      return 'Enter purchased date.';
    } else if (value.contains("Select Purchased Date")) {
      return 'Please select product purchased date.';
    }
    return null;
  }

  String? validatePurchasedPrice(String value) {
    if (value.isEmpty) {
      return 'Enter purchased price.';
    }
    return null;
  }

  // metal details formfields
  String? validateMetalType(String value) {
    if (value.isEmpty) {
      return 'Please select metal type name.';
    } else if (value.contains("SELECT METAL TYPE")) {
      return 'Please select metal type name.';
    }
    return null;
  }

  String? validateMetalPurity(String value) {
    if (value.isEmpty) {
      return 'Please select metal purity.';
    } else if (value.contains("SELECT PURITY")) {
      return 'Please select product purchased date.';
    }
    return null;
  }

  String? validateMetalWeight(String value) {
    if (value.isEmpty) {
      return 'Enter metal weight.';
    }
    return null;
  }

  // stone details formfields
  String? validateStoneName(String value) {
    if (value.isEmpty) {
      return 'Please select stone name.';
    }
    return null;
  }

  String? validateStoneWeight(String value) {
    if (value.isEmpty) {
      return 'Enter stone weight.';
    }
    return null;
  }

  String? validateUnitOfWeight(String value) {
    if (value.isEmpty) {
      return 'Select or Enter unit of weight.';
    }
    return null;
  }

  // deco details formfields
  String? validateDecoItemName(String value) {
    if (value.isEmpty) {
      return 'Enter decorative item name.';
    }
    return null;
  }

  String? validateDecoItemWeight(String value) {
    if (value.isEmpty) {
      return 'Enter decorative item weight.';
    }
    return null;
  }

  String? validateDob(String value) {
    if (value.isEmpty) {
      return 'Enter birthdate.';
    }
    return null;
  }

  String? validatePinCode(String value) {
    if (value.isEmpty) {
      return 'Enter pincode.';
    } else if (!RegExp("^[1-9]{1}[0-9]{2}\\s{0,1}[0-9]{3}").hasMatch(value)) {
      return 'Enter valid pincode.';
    }
    return null;
  }

  String? validatePanCard(String value) {
    // regex = "[A-Z]{5}[0-9]{4}[A-Z]{1}";

    if (value.isEmpty) {
      return 'Enter pan card number.';
    } else if (!RegExp("[A-Z]{5}[0-9]{4}[A-Z]{1}").hasMatch(value)) {
      {
        return 'Invalid pan card number.';
      }
    }
    return null;
  }

  String? validateAadhaarCard(String value) {
    // regex = "[A-Z]{5}[0-9]{4}[A-Z]{1}";

    if (value.isEmpty) {
      return 'Enter aadhaar number.';
    }
    // else if (!RegExp(r'^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$').hasMatch(value)) {
    //     return 'Invalid aadhaar number';
    // }
    else if (value.length < 12) {
      return 'Invalid aadhaar number.';
    }
    return null;
  }

  String? validateMonthlyIncome(String value) {
    if (value.isEmpty) {
      return 'Enter monthly income.';
    }
    return null;
  }

  String? validateEmployerName(String value) {
    if (value.isEmpty) {
      return "Enter employer's name.";
    }
    return null;
  }

  String? validateCurrentTotalEmi(String value) {
    if (value.isEmpty) {
      return 'Enter current total emi amount you are paying.';
    }
    return null;
  }

  String? validateWhichBank(String value) {
    if (value.isEmpty) {
      return 'Enter bank name.';
    }
    return null;
  }

  String? validateRetailerCode(String value) {
    if (value.isEmpty) {
      return 'Enter retailer code.';
    }
    return null;
  }

  String? validateCurrentLocation(String value) {
    if (value.isEmpty) {
      return 'Please select current location type.';
    }
    return null;
  }

  String? validateOtherLocation(String value) {
    if (value.isEmpty) {
      return 'Please enter other location.';
    }
    return null;
  }

  String? validateActivityDate(String value) {
    if (value.isEmpty) {
      return 'Please select activity date.';
    }
    return null;
  }

  String? validateRelevantDocument(String value) {
    if (value.isEmpty) {
      return 'Please enter relevant document data.';
    }
    return null;
  }

  String? validateNotes(String value) {
    if (value.isEmpty) {
      return 'Please enter some notes about your jewellery.';
    }
    return null;
  }

  String? validateCity(String value) {
    if (value.isEmpty) {
      return 'City is required.';
    }
    return null;
  }

  String? validateState(String value) {
    if (value.isEmpty) {
      return 'State is required.';
    }
    return null;
  }

  String? validateLossDate(String value) {
    if (value.isEmpty) {
      return 'Enter Loss Date.';
    }
    return null;
  }

  String? validateLocationOfLoss(String value) {
    if (value.isEmpty) {
      return 'Enter location of loss.';
    }
    return null;
  }

  String? validateEventOfLoss(String value) {
    if (value.isEmpty) {
      return 'Describe the event of loss.';
    }
    return null;
  }

  String? validateClaimNumber(String value) {
    if (value.isEmpty) {
      return 'Enter claim number.';
    }
    return null;
  }

  String? validateFirNumber(String value) {
    if (value.isEmpty) {
      return 'Enter fir number.';
    }
    return null;
  }

  String? validatePoliceStationAddress(String value) {
    if (value.isEmpty) {
      return 'Enter Police Station Address.';
    }
    return null;
  }
}
