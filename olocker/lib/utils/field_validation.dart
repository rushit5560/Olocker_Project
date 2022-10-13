class FieldValidator {
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
}
