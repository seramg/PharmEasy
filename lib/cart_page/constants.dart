class Validator {
  static const _kEmailRegex =
      r'^(([^<>()[\]/\\.,;:\s@\"]+(\.[^<>()[\]/\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const _kAllowedDomains = [];

  static bool checkDomain(String email) {
    bool valid = false;
    _kAllowedDomains.forEach((element) {
      if (email.endsWith(element)) {
        valid = true;
      }
    });
    return valid;
  }

  static bool checkEmail(String email) => RegExp(_kEmailRegex).hasMatch(email);
}
