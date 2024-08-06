// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String AgeValueKey = 'age';
const String PhoneNumberValueKey = 'phoneNumber';

final Map<String, TextEditingController>
    _EditUserProfileSheetTextEditingControllers = {};

final Map<String, FocusNode> _EditUserProfileSheetFocusNodes = {};

final Map<String, String? Function(String?)?>
    _EditUserProfileSheetTextValidations = {
  FirstNameValueKey: null,
  LastNameValueKey: null,
  AgeValueKey: null,
  PhoneNumberValueKey: null,
};

mixin $EditUserProfileSheet {
  TextEditingController get firstNameController =>
      _getFormTextEditingController(FirstNameValueKey);
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get ageController =>
      _getFormTextEditingController(AgeValueKey);
  TextEditingController get phoneNumberController =>
      _getFormTextEditingController(PhoneNumberValueKey);
  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get ageFocusNode => _getFormFocusNode(AgeValueKey);
  FocusNode get phoneNumberFocusNode => _getFormFocusNode(PhoneNumberValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_EditUserProfileSheetTextEditingControllers.containsKey(key)) {
      return _EditUserProfileSheetTextEditingControllers[key]!;
    }

    _EditUserProfileSheetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _EditUserProfileSheetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_EditUserProfileSheetFocusNodes.containsKey(key)) {
      return _EditUserProfileSheetFocusNodes[key]!;
    }
    _EditUserProfileSheetFocusNodes[key] = FocusNode();
    return _EditUserProfileSheetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    ageController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    ageController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
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
          FirstNameValueKey: firstNameController.text,
          LastNameValueKey: lastNameController.text,
          AgeValueKey: ageController.text,
          PhoneNumberValueKey: phoneNumberController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _EditUserProfileSheetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _EditUserProfileSheetFocusNodes.values) {
      focusNode.dispose();
    }

    _EditUserProfileSheetTextEditingControllers.clear();
    _EditUserProfileSheetFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get firstNameValue => this.formValueMap[FirstNameValueKey] as String?;
  String? get lastNameValue => this.formValueMap[LastNameValueKey] as String?;
  String? get ageValue => this.formValueMap[AgeValueKey] as String?;
  String? get phoneNumberValue =>
      this.formValueMap[PhoneNumberValueKey] as String?;

  set firstNameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          FirstNameValueKey: value,
        }),
    );

    if (_EditUserProfileSheetTextEditingControllers.containsKey(
        FirstNameValueKey)) {
      _EditUserProfileSheetTextEditingControllers[FirstNameValueKey]?.text =
          value ?? '';
    }
  }

  set lastNameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          LastNameValueKey: value,
        }),
    );

    if (_EditUserProfileSheetTextEditingControllers.containsKey(
        LastNameValueKey)) {
      _EditUserProfileSheetTextEditingControllers[LastNameValueKey]?.text =
          value ?? '';
    }
  }

  set ageValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          AgeValueKey: value,
        }),
    );

    if (_EditUserProfileSheetTextEditingControllers.containsKey(AgeValueKey)) {
      _EditUserProfileSheetTextEditingControllers[AgeValueKey]?.text =
          value ?? '';
    }
  }

  set phoneNumberValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          PhoneNumberValueKey: value,
        }),
    );

    if (_EditUserProfileSheetTextEditingControllers.containsKey(
        PhoneNumberValueKey)) {
      _EditUserProfileSheetTextEditingControllers[PhoneNumberValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasFirstName =>
      this.formValueMap.containsKey(FirstNameValueKey) &&
      (firstNameValue?.isNotEmpty ?? false);
  bool get hasLastName =>
      this.formValueMap.containsKey(LastNameValueKey) &&
      (lastNameValue?.isNotEmpty ?? false);
  bool get hasAge =>
      this.formValueMap.containsKey(AgeValueKey) &&
      (ageValue?.isNotEmpty ?? false);
  bool get hasPhoneNumber =>
      this.formValueMap.containsKey(PhoneNumberValueKey) &&
      (phoneNumberValue?.isNotEmpty ?? false);

  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasAgeValidationMessage =>
      this.fieldsValidationMessages[AgeValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey]?.isNotEmpty ?? false;

  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get ageValidationMessage =>
      this.fieldsValidationMessages[AgeValueKey];
  String? get phoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey];
}

extension Methods on FormViewModel {
  setFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstNameValueKey] = validationMessage;
  setLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastNameValueKey] = validationMessage;
  setAgeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AgeValueKey] = validationMessage;
  setPhoneNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneNumberValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    firstNameValue = '';
    lastNameValue = '';
    ageValue = '';
    phoneNumberValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      AgeValueKey: getValidationMessage(AgeValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _EditUserProfileSheetTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _EditUserProfileSheetTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      AgeValueKey: getValidationMessage(AgeValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
    });
