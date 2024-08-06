// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String PhoneNumberValueKey = 'phoneNumber';
const String EmailValueKey = 'email';
const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String AgeValueKey = 'age';
const String GenderValueKey = 'gender';

final Map<String, TextEditingController>
    _EditProfileViewTextEditingControllers = {};

final Map<String, FocusNode> _EditProfileViewFocusNodes = {};

final Map<String, String? Function(String?)?> _EditProfileViewTextValidations =
    {
  PhoneNumberValueKey: null,
  EmailValueKey: null,
  FirstNameValueKey: null,
  LastNameValueKey: null,
  AgeValueKey: null,
  GenderValueKey: null,
};

mixin $EditProfileView {
  TextEditingController get phoneNumberController =>
      _getFormTextEditingController(PhoneNumberValueKey);
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  TextEditingController get firstNameController =>
      _getFormTextEditingController(FirstNameValueKey);
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get ageController =>
      _getFormTextEditingController(AgeValueKey);
  TextEditingController get genderController =>
      _getFormTextEditingController(GenderValueKey);

  FocusNode get phoneNumberFocusNode => _getFormFocusNode(PhoneNumberValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);
  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get ageFocusNode => _getFormFocusNode(AgeValueKey);
  FocusNode get genderFocusNode => _getFormFocusNode(GenderValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_EditProfileViewTextEditingControllers.containsKey(key)) {
      return _EditProfileViewTextEditingControllers[key]!;
    }

    _EditProfileViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _EditProfileViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_EditProfileViewFocusNodes.containsKey(key)) {
      return _EditProfileViewFocusNodes[key]!;
    }
    _EditProfileViewFocusNodes[key] = FocusNode();
    return _EditProfileViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    phoneNumberController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    ageController.addListener(() => _updateFormData(model));
    genderController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    phoneNumberController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    ageController.addListener(() => _updateFormData(model));
    genderController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          PhoneNumberValueKey: phoneNumberController.text,
          EmailValueKey: emailController.text,
          FirstNameValueKey: firstNameController.text,
          LastNameValueKey: lastNameController.text,
          AgeValueKey: ageController.text,
          GenderValueKey: genderController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _EditProfileViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _EditProfileViewFocusNodes.values) {
      focusNode.dispose();
    }

    _EditProfileViewTextEditingControllers.clear();
    _EditProfileViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get phoneNumberValue =>
      this.formValueMap[PhoneNumberValueKey] as String?;
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;
  String? get firstNameValue => this.formValueMap[FirstNameValueKey] as String?;
  String? get lastNameValue => this.formValueMap[LastNameValueKey] as String?;
  String? get ageValue => this.formValueMap[AgeValueKey] as String?;
  String? get genderValue => this.formValueMap[GenderValueKey] as String?;

  set phoneNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneNumberValueKey: value}),
    );

    if (_EditProfileViewTextEditingControllers.containsKey(
        PhoneNumberValueKey)) {
      _EditProfileViewTextEditingControllers[PhoneNumberValueKey]?.text =
          value ?? '';
    }
  }

  set emailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailValueKey: value}),
    );

    if (_EditProfileViewTextEditingControllers.containsKey(EmailValueKey)) {
      _EditProfileViewTextEditingControllers[EmailValueKey]?.text = value ?? '';
    }
  }

  set firstNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FirstNameValueKey: value}),
    );

    if (_EditProfileViewTextEditingControllers.containsKey(FirstNameValueKey)) {
      _EditProfileViewTextEditingControllers[FirstNameValueKey]?.text =
          value ?? '';
    }
  }

  set lastNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LastNameValueKey: value}),
    );

    if (_EditProfileViewTextEditingControllers.containsKey(LastNameValueKey)) {
      _EditProfileViewTextEditingControllers[LastNameValueKey]?.text =
          value ?? '';
    }
  }

  set ageValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AgeValueKey: value}),
    );

    if (_EditProfileViewTextEditingControllers.containsKey(AgeValueKey)) {
      _EditProfileViewTextEditingControllers[AgeValueKey]?.text = value ?? '';
    }
  }

  set genderValue(String? value) {
    this.setData(
      this.formValueMap..addAll({GenderValueKey: value}),
    );

    if (_EditProfileViewTextEditingControllers.containsKey(GenderValueKey)) {
      _EditProfileViewTextEditingControllers[GenderValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasPhoneNumber =>
      this.formValueMap.containsKey(PhoneNumberValueKey) &&
      (phoneNumberValue?.isNotEmpty ?? false);
  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);
  bool get hasFirstName =>
      this.formValueMap.containsKey(FirstNameValueKey) &&
      (firstNameValue?.isNotEmpty ?? false);
  bool get hasLastName =>
      this.formValueMap.containsKey(LastNameValueKey) &&
      (lastNameValue?.isNotEmpty ?? false);
  bool get hasAge =>
      this.formValueMap.containsKey(AgeValueKey) &&
      (ageValue?.isNotEmpty ?? false);
  bool get hasGender =>
      this.formValueMap.containsKey(GenderValueKey) &&
      (genderValue?.isNotEmpty ?? false);

  bool get hasPhoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey]?.isNotEmpty ?? false;
  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;
  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasAgeValidationMessage =>
      this.fieldsValidationMessages[AgeValueKey]?.isNotEmpty ?? false;
  bool get hasGenderValidationMessage =>
      this.fieldsValidationMessages[GenderValueKey]?.isNotEmpty ?? false;

  String? get phoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey];
  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get ageValidationMessage =>
      this.fieldsValidationMessages[AgeValueKey];
  String? get genderValidationMessage =>
      this.fieldsValidationMessages[GenderValueKey];
}

extension Methods on FormViewModel {
  setPhoneNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneNumberValueKey] = validationMessage;
  setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
  setFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstNameValueKey] = validationMessage;
  setLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastNameValueKey] = validationMessage;
  setAgeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AgeValueKey] = validationMessage;
  setGenderValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[GenderValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    phoneNumberValue = '';
    emailValue = '';
    firstNameValue = '';
    lastNameValue = '';
    ageValue = '';
    genderValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      AgeValueKey: getValidationMessage(AgeValueKey),
      GenderValueKey: getValidationMessage(GenderValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _EditProfileViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _EditProfileViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      AgeValueKey: getValidationMessage(AgeValueKey),
      GenderValueKey: getValidationMessage(GenderValueKey),
    });
