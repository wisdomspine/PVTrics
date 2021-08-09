import 'package:flutter/services.dart';
import 'package:phone_number/phone_number.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:vptrics/modules/core/validation/app_validation_message.dart';

class AppValidators {
  static final Map<String, dynamic>? Function(AbstractControl) notEmpty =
      (AbstractControl control) {
    if (control.value == null ||
        !(control.value is String) ||
        control.value.toString().trim().isNotEmpty) {
      return null;
    }
    return {AppValidationMessage.notEmpty: true};
  };

  static final Future<Map<String, dynamic>?> Function(AbstractControl) phone =
      (AbstractControl control) async {
    if (control.value == null ||
        !(control.value is String) ||
        control.value.toString().trim().isEmpty) {
      return null;
    }
    try {
      await PhoneNumberUtil().parse(control.value.toString().trim());
      return null;
    } on PlatformException {
      return {AppValidationMessage.phone: true};
    }
  };
}
