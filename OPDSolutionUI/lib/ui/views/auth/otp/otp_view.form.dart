// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String OtpDigit1ValueKey = 'otpDigit1';
const String OtpDigit2ValueKey = 'otpDigit2';
const String OtpDigit3ValueKey = 'otpDigit3';
const String OtpDigit4ValueKey = 'otpDigit4';

final Map<String, TextEditingController> _OtpViewTextEditingControllers = {};

final Map<String, FocusNode> _OtpViewFocusNodes = {};

final Map<String, String? Function(String?)?> _OtpViewTextValidations = {
  OtpDigit1ValueKey: null,
  OtpDigit2ValueKey: null,
  OtpDigit3ValueKey: null,
  OtpDigit4ValueKey: null,
};

mixin $OtpView on StatelessWidget {
  TextEditingController get otpDigit1Controller =>
      _getFormTextEditingController(OtpDigit1ValueKey);
  TextEditingController get otpDigit2Controller =>
      _getFormTextEditingController(OtpDigit2ValueKey);
  TextEditingController get otpDigit3Controller =>
      _getFormTextEditingController(OtpDigit3ValueKey);
  TextEditingController get otpDigit4Controller =>
      _getFormTextEditingController(OtpDigit4ValueKey);
  FocusNode get otpDigit1FocusNode => _getFormFocusNode(OtpDigit1ValueKey);
  FocusNode get otpDigit2FocusNode => _getFormFocusNode(OtpDigit2ValueKey);
  FocusNode get otpDigit3FocusNode => _getFormFocusNode(OtpDigit3ValueKey);
  FocusNode get otpDigit4FocusNode => _getFormFocusNode(OtpDigit4ValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_OtpViewTextEditingControllers.containsKey(key)) {
      return _OtpViewTextEditingControllers[key]!;
    }

    _OtpViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _OtpViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_OtpViewFocusNodes.containsKey(key)) {
      return _OtpViewFocusNodes[key]!;
    }
    _OtpViewFocusNodes[key] = FocusNode();
    return _OtpViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    otpDigit1Controller.addListener(() => _updateFormData(model));
    otpDigit2Controller.addListener(() => _updateFormData(model));
    otpDigit3Controller.addListener(() => _updateFormData(model));
    otpDigit4Controller.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    otpDigit1Controller.addListener(() => _updateFormData(model));
    otpDigit2Controller.addListener(() => _updateFormData(model));
    otpDigit3Controller.addListener(() => _updateFormData(model));
    otpDigit4Controller.addListener(() => _updateFormData(model));
  }

  static const bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          OtpDigit1ValueKey: otpDigit1Controller.text,
          OtpDigit2ValueKey: otpDigit2Controller.text,
          OtpDigit3ValueKey: otpDigit3Controller.text,
          OtpDigit4ValueKey: otpDigit4Controller.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _OtpViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _OtpViewFocusNodes.values) {
      focusNode.dispose();
    }

    _OtpViewTextEditingControllers.clear();
    _OtpViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get otpDigit1Value => this.formValueMap[OtpDigit1ValueKey] as String?;
  String? get otpDigit2Value => this.formValueMap[OtpDigit2ValueKey] as String?;
  String? get otpDigit3Value => this.formValueMap[OtpDigit3ValueKey] as String?;
  String? get otpDigit4Value => this.formValueMap[OtpDigit4ValueKey] as String?;

  set otpDigit1Value(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          OtpDigit1ValueKey: value,
        }),
    );

    if (_OtpViewTextEditingControllers.containsKey(OtpDigit1ValueKey)) {
      _OtpViewTextEditingControllers[OtpDigit1ValueKey]?.text = value ?? '';
    }
  }

  set otpDigit2Value(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          OtpDigit2ValueKey: value,
        }),
    );

    if (_OtpViewTextEditingControllers.containsKey(OtpDigit2ValueKey)) {
      _OtpViewTextEditingControllers[OtpDigit2ValueKey]?.text = value ?? '';
    }
  }

  set otpDigit3Value(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          OtpDigit3ValueKey: value,
        }),
    );

    if (_OtpViewTextEditingControllers.containsKey(OtpDigit3ValueKey)) {
      _OtpViewTextEditingControllers[OtpDigit3ValueKey]?.text = value ?? '';
    }
  }

  set otpDigit4Value(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          OtpDigit4ValueKey: value,
        }),
    );

    if (_OtpViewTextEditingControllers.containsKey(OtpDigit4ValueKey)) {
      _OtpViewTextEditingControllers[OtpDigit4ValueKey]?.text = value ?? '';
    }
  }

  bool get hasOtpDigit1 =>
      this.formValueMap.containsKey(OtpDigit1ValueKey) &&
      (otpDigit1Value?.isNotEmpty ?? false);
  bool get hasOtpDigit2 =>
      this.formValueMap.containsKey(OtpDigit2ValueKey) &&
      (otpDigit2Value?.isNotEmpty ?? false);
  bool get hasOtpDigit3 =>
      this.formValueMap.containsKey(OtpDigit3ValueKey) &&
      (otpDigit3Value?.isNotEmpty ?? false);
  bool get hasOtpDigit4 =>
      this.formValueMap.containsKey(OtpDigit4ValueKey) &&
      (otpDigit4Value?.isNotEmpty ?? false);

  bool get hasOtpDigit1ValidationMessage =>
      this.fieldsValidationMessages[OtpDigit1ValueKey]?.isNotEmpty ?? false;
  bool get hasOtpDigit2ValidationMessage =>
      this.fieldsValidationMessages[OtpDigit2ValueKey]?.isNotEmpty ?? false;
  bool get hasOtpDigit3ValidationMessage =>
      this.fieldsValidationMessages[OtpDigit3ValueKey]?.isNotEmpty ?? false;
  bool get hasOtpDigit4ValidationMessage =>
      this.fieldsValidationMessages[OtpDigit4ValueKey]?.isNotEmpty ?? false;

  String? get otpDigit1ValidationMessage =>
      this.fieldsValidationMessages[OtpDigit1ValueKey];
  String? get otpDigit2ValidationMessage =>
      this.fieldsValidationMessages[OtpDigit2ValueKey];
  String? get otpDigit3ValidationMessage =>
      this.fieldsValidationMessages[OtpDigit3ValueKey];
  String? get otpDigit4ValidationMessage =>
      this.fieldsValidationMessages[OtpDigit4ValueKey];
}

extension Methods on FormViewModel {
  setOtpDigit1ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[OtpDigit1ValueKey] = validationMessage;
  setOtpDigit2ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[OtpDigit2ValueKey] = validationMessage;
  setOtpDigit3ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[OtpDigit3ValueKey] = validationMessage;
  setOtpDigit4ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[OtpDigit4ValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    otpDigit1Value = '';
    otpDigit2Value = '';
    otpDigit3Value = '';
    otpDigit4Value = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      OtpDigit1ValueKey: getValidationMessage(OtpDigit1ValueKey),
      OtpDigit2ValueKey: getValidationMessage(OtpDigit2ValueKey),
      OtpDigit3ValueKey: getValidationMessage(OtpDigit3ValueKey),
      OtpDigit4ValueKey: getValidationMessage(OtpDigit4ValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _OtpViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _OtpViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      OtpDigit1ValueKey: getValidationMessage(OtpDigit1ValueKey),
      OtpDigit2ValueKey: getValidationMessage(OtpDigit2ValueKey),
      OtpDigit3ValueKey: getValidationMessage(OtpDigit3ValueKey),
      OtpDigit4ValueKey: getValidationMessage(OtpDigit4ValueKey),
    });
