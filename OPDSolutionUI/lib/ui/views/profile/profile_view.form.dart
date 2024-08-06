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
const String GenderValueKey = 'gender';
const String SpecializationValueKey = 'specialization';

final Map<String, TextEditingController> _ProfileViewTextEditingControllers =
    {};

final Map<String, FocusNode> _ProfileViewFocusNodes = {};

final Map<String, String? Function(String?)?> _ProfileViewTextValidations = {
  FirstNameValueKey: null,
  LastNameValueKey: null,
  AgeValueKey: null,
  GenderValueKey: null,
  SpecializationValueKey: null,
};

mixin $ProfileView on StatelessWidget {
  TextEditingController get firstNameController =>
      _getFormTextEditingController(FirstNameValueKey);
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get ageController =>
      _getFormTextEditingController(AgeValueKey);
  TextEditingController get genderController =>
      _getFormTextEditingController(GenderValueKey);
  TextEditingController get specializationController =>
      _getFormTextEditingController(SpecializationValueKey);
  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get ageFocusNode => _getFormFocusNode(AgeValueKey);
  FocusNode get genderFocusNode => _getFormFocusNode(GenderValueKey);
  FocusNode get specializationFocusNode =>
      _getFormFocusNode(SpecializationValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ProfileViewTextEditingControllers.containsKey(key)) {
      return _ProfileViewTextEditingControllers[key]!;
    }

    _ProfileViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ProfileViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ProfileViewFocusNodes.containsKey(key)) {
      return _ProfileViewFocusNodes[key]!;
    }
    _ProfileViewFocusNodes[key] = FocusNode();
    return _ProfileViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    ageController.addListener(() => _updateFormData(model));
    genderController.addListener(() => _updateFormData(model));
    specializationController.addListener(() => _updateFormData(model));
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
    genderController.addListener(() => _updateFormData(model));
    specializationController.addListener(() => _updateFormData(model));
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
          GenderValueKey: genderController.text,
          SpecializationValueKey: specializationController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _ProfileViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ProfileViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ProfileViewTextEditingControllers.clear();
    _ProfileViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get firstNameValue => this.formValueMap[FirstNameValueKey] as String?;
  String? get lastNameValue => this.formValueMap[LastNameValueKey] as String?;
  String? get ageValue => this.formValueMap[AgeValueKey] as String?;
  String? get genderValue => this.formValueMap[GenderValueKey] as String?;
  String? get specializationValue =>
      this.formValueMap[SpecializationValueKey] as String?;

  set firstNameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          FirstNameValueKey: value,
        }),
    );

    if (_ProfileViewTextEditingControllers.containsKey(FirstNameValueKey)) {
      _ProfileViewTextEditingControllers[FirstNameValueKey]?.text = value ?? '';
    }
  }

  set lastNameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          LastNameValueKey: value,
        }),
    );

    if (_ProfileViewTextEditingControllers.containsKey(LastNameValueKey)) {
      _ProfileViewTextEditingControllers[LastNameValueKey]?.text = value ?? '';
    }
  }

  set ageValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          AgeValueKey: value,
        }),
    );

    if (_ProfileViewTextEditingControllers.containsKey(AgeValueKey)) {
      _ProfileViewTextEditingControllers[AgeValueKey]?.text = value ?? '';
    }
  }

  set genderValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          GenderValueKey: value,
        }),
    );

    if (_ProfileViewTextEditingControllers.containsKey(GenderValueKey)) {
      _ProfileViewTextEditingControllers[GenderValueKey]?.text = value ?? '';
    }
  }

  set specializationValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          SpecializationValueKey: value,
        }),
    );

    if (_ProfileViewTextEditingControllers.containsKey(
        SpecializationValueKey)) {
      _ProfileViewTextEditingControllers[SpecializationValueKey]?.text =
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
  bool get hasGender =>
      this.formValueMap.containsKey(GenderValueKey) &&
      (genderValue?.isNotEmpty ?? false);
  bool get hasSpecialization =>
      this.formValueMap.containsKey(SpecializationValueKey) &&
      (specializationValue?.isNotEmpty ?? false);

  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasAgeValidationMessage =>
      this.fieldsValidationMessages[AgeValueKey]?.isNotEmpty ?? false;
  bool get hasGenderValidationMessage =>
      this.fieldsValidationMessages[GenderValueKey]?.isNotEmpty ?? false;
  bool get hasSpecializationValidationMessage =>
      this.fieldsValidationMessages[SpecializationValueKey]?.isNotEmpty ??
      false;

  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get ageValidationMessage =>
      this.fieldsValidationMessages[AgeValueKey];
  String? get genderValidationMessage =>
      this.fieldsValidationMessages[GenderValueKey];
  String? get specializationValidationMessage =>
      this.fieldsValidationMessages[SpecializationValueKey];
}

extension Methods on FormViewModel {
  setFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstNameValueKey] = validationMessage;
  setLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastNameValueKey] = validationMessage;
  setAgeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AgeValueKey] = validationMessage;
  setGenderValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[GenderValueKey] = validationMessage;
  setSpecializationValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SpecializationValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    firstNameValue = '';
    lastNameValue = '';
    ageValue = '';
    genderValue = '';
    specializationValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      AgeValueKey: getValidationMessage(AgeValueKey),
      GenderValueKey: getValidationMessage(GenderValueKey),
      SpecializationValueKey: getValidationMessage(SpecializationValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ProfileViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ProfileViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      AgeValueKey: getValidationMessage(AgeValueKey),
      GenderValueKey: getValidationMessage(GenderValueKey),
      SpecializationValueKey: getValidationMessage(SpecializationValueKey),
    });
