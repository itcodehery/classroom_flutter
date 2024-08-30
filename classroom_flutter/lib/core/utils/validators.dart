//unnecessary code removed
class Validators {
  RegExp classCodeExp = RegExp(r'^[a-zA-Z0-9]{6}$');

  bool isValidClassCode(String classCode) {
    return classCodeExp.hasMatch(classCode);
  }
}
