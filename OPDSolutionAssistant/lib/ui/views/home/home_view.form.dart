// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String AgeValueKey = 'age';
const String GenderValueKey = 'gender';
const String MobileNumberValueKey = 'mobileNumber';
const String HeightValueKey = 'height';
const String WeightValueKey = 'weight';
const String PulseValueKey = 'pulse';
const String BpValueKey = 'bp';
const String BphValueKey = 'bph';
const String TemperatureValueKey = 'temperature';

final Map<String, TextEditingController> _HomeViewTextEditingControllers = {};

final Map<String, FocusNode> _HomeViewFocusNodes = {};

final Map<String, String? Function(String?)?> _HomeViewTextValidations = {
  FirstNameValueKey: null,
  LastNameValueKey: null,
  AgeValueKey: null,
  GenderValueKey: null,
  MobileNumberValueKey: null,
  HeightValueKey: null,
  WeightValueKey: null,
  PulseValueKey: null,
  BpValueKey: null,
  BphValueKey: null,
  TemperatureValueKey: null,
};

mixin $HomeView {
  TextEditingController get firstNameController =>
      _getFormTextEditingController(FirstNameValueKey);
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get ageController =>
      _getFormTextEditingController(AgeValueKey);
  TextEditingController get genderController =>
      _getFormTextEditingController(GenderValueKey);
  TextEditingController get mobileNumberController =>
      _getFormTextEditingController(MobileNumberValueKey);
  TextEditingController get heightController =>
      _getFormTextEditingController(HeightValueKey, initialValue: '5');
  TextEditingController get weightController =>
      _getFormTextEditingController(WeightValueKey, initialValue: '50');
  TextEditingController get pulseController =>
      _getFormTextEditingController(PulseValueKey, initialValue: '72');
  TextEditingController get bpController =>
      _getFormTextEditingController(BpValueKey, initialValue: '120');
  TextEditingController get bphController =>
      _getFormTextEditingController(BphValueKey, initialValue: '120');
  TextEditingController get temperatureController =>
      _getFormTextEditingController(TemperatureValueKey, initialValue: '98.8');

  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get ageFocusNode => _getFormFocusNode(AgeValueKey);
  FocusNode get genderFocusNode => _getFormFocusNode(GenderValueKey);
  FocusNode get mobileNumberFocusNode =>
      _getFormFocusNode(MobileNumberValueKey);
  FocusNode get heightFocusNode => _getFormFocusNode(HeightValueKey);
  FocusNode get weightFocusNode => _getFormFocusNode(WeightValueKey);
  FocusNode get pulseFocusNode => _getFormFocusNode(PulseValueKey);
  FocusNode get bpFocusNode => _getFormFocusNode(BpValueKey);
  FocusNode get bphFocusNode => _getFormFocusNode(BphValueKey);
  FocusNode get temperatureFocusNode => _getFormFocusNode(TemperatureValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_HomeViewTextEditingControllers.containsKey(key)) {
      return _HomeViewTextEditingControllers[key]!;
    }

    _HomeViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _HomeViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_HomeViewFocusNodes.containsKey(key)) {
      return _HomeViewFocusNodes[key]!;
    }
    _HomeViewFocusNodes[key] = FocusNode();
    return _HomeViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    ageController.addListener(() => _updateFormData(model));
    genderController.addListener(() => _updateFormData(model));
    mobileNumberController.addListener(() => _updateFormData(model));
    heightController.addListener(() => _updateFormData(model));
    weightController.addListener(() => _updateFormData(model));
    pulseController.addListener(() => _updateFormData(model));
    bpController.addListener(() => _updateFormData(model));
    bphController.addListener(() => _updateFormData(model));
    temperatureController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
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
    mobileNumberController.addListener(() => _updateFormData(model));
    heightController.addListener(() => _updateFormData(model));
    weightController.addListener(() => _updateFormData(model));
    pulseController.addListener(() => _updateFormData(model));
    bpController.addListener(() => _updateFormData(model));
    bphController.addListener(() => _updateFormData(model));
    temperatureController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
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
          MobileNumberValueKey: mobileNumberController.text,
          HeightValueKey: heightController.text,
          WeightValueKey: weightController.text,
          PulseValueKey: pulseController.text,
          BpValueKey: bpController.text,
          BphValueKey: bphController.text,
          TemperatureValueKey: temperatureController.text,
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

    for (var controller in _HomeViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _HomeViewFocusNodes.values) {
      focusNode.dispose();
    }

    _HomeViewTextEditingControllers.clear();
    _HomeViewFocusNodes.clear();
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

  String? get firstNameValue => this.formValueMap[FirstNameValueKey] as String?;
  String? get lastNameValue => this.formValueMap[LastNameValueKey] as String?;
  String? get ageValue => this.formValueMap[AgeValueKey] as String?;
  String? get genderValue => this.formValueMap[GenderValueKey] as String?;
  String? get mobileNumberValue =>
      this.formValueMap[MobileNumberValueKey] as String?;
  String? get heightValue => this.formValueMap[HeightValueKey] as String?;
  String? get weightValue => this.formValueMap[WeightValueKey] as String?;
  String? get pulseValue => this.formValueMap[PulseValueKey] as String?;
  String? get bpValue => this.formValueMap[BpValueKey] as String?;
  String? get bphValue => this.formValueMap[BphValueKey] as String?;
  String? get temperatureValue =>
      this.formValueMap[TemperatureValueKey] as String?;

  set firstNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FirstNameValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(FirstNameValueKey)) {
      _HomeViewTextEditingControllers[FirstNameValueKey]?.text = value ?? '';
    }
  }

  set lastNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LastNameValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(LastNameValueKey)) {
      _HomeViewTextEditingControllers[LastNameValueKey]?.text = value ?? '';
    }
  }

  set ageValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AgeValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(AgeValueKey)) {
      _HomeViewTextEditingControllers[AgeValueKey]?.text = value ?? '';
    }
  }

  set genderValue(String? value) {
    this.setData(
      this.formValueMap..addAll({GenderValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(GenderValueKey)) {
      _HomeViewTextEditingControllers[GenderValueKey]?.text = value ?? '';
    }
  }

  set mobileNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({MobileNumberValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(MobileNumberValueKey)) {
      _HomeViewTextEditingControllers[MobileNumberValueKey]?.text = value ?? '';
    }
  }

  set heightValue(String? value) {
    this.setData(
      this.formValueMap..addAll({HeightValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(HeightValueKey)) {
      _HomeViewTextEditingControllers[HeightValueKey]?.text = value ?? '';
    }
  }

  set weightValue(String? value) {
    this.setData(
      this.formValueMap..addAll({WeightValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(WeightValueKey)) {
      _HomeViewTextEditingControllers[WeightValueKey]?.text = value ?? '';
    }
  }

  set pulseValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PulseValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(PulseValueKey)) {
      _HomeViewTextEditingControllers[PulseValueKey]?.text = value ?? '';
    }
  }

  set bpValue(String? value) {
    this.setData(
      this.formValueMap..addAll({BpValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(BpValueKey)) {
      _HomeViewTextEditingControllers[BpValueKey]?.text = value ?? '';
    }
  }

  set bphValue(String? value) {
    this.setData(
      this.formValueMap..addAll({BphValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(BphValueKey)) {
      _HomeViewTextEditingControllers[BphValueKey]?.text = value ?? '';
    }
  }

  set temperatureValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TemperatureValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(TemperatureValueKey)) {
      _HomeViewTextEditingControllers[TemperatureValueKey]?.text = value ?? '';
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
  bool get hasMobileNumber =>
      this.formValueMap.containsKey(MobileNumberValueKey) &&
      (mobileNumberValue?.isNotEmpty ?? false);
  bool get hasHeight =>
      this.formValueMap.containsKey(HeightValueKey) &&
      (heightValue?.isNotEmpty ?? false);
  bool get hasWeight =>
      this.formValueMap.containsKey(WeightValueKey) &&
      (weightValue?.isNotEmpty ?? false);
  bool get hasPulse =>
      this.formValueMap.containsKey(PulseValueKey) &&
      (pulseValue?.isNotEmpty ?? false);
  bool get hasBp =>
      this.formValueMap.containsKey(BpValueKey) &&
      (bpValue?.isNotEmpty ?? false);
  bool get hasBph =>
      this.formValueMap.containsKey(BphValueKey) &&
      (bphValue?.isNotEmpty ?? false);
  bool get hasTemperature =>
      this.formValueMap.containsKey(TemperatureValueKey) &&
      (temperatureValue?.isNotEmpty ?? false);

  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasAgeValidationMessage =>
      this.fieldsValidationMessages[AgeValueKey]?.isNotEmpty ?? false;
  bool get hasGenderValidationMessage =>
      this.fieldsValidationMessages[GenderValueKey]?.isNotEmpty ?? false;
  bool get hasMobileNumberValidationMessage =>
      this.fieldsValidationMessages[MobileNumberValueKey]?.isNotEmpty ?? false;
  bool get hasHeightValidationMessage =>
      this.fieldsValidationMessages[HeightValueKey]?.isNotEmpty ?? false;
  bool get hasWeightValidationMessage =>
      this.fieldsValidationMessages[WeightValueKey]?.isNotEmpty ?? false;
  bool get hasPulseValidationMessage =>
      this.fieldsValidationMessages[PulseValueKey]?.isNotEmpty ?? false;
  bool get hasBpValidationMessage =>
      this.fieldsValidationMessages[BpValueKey]?.isNotEmpty ?? false;
  bool get hasBphValidationMessage =>
      this.fieldsValidationMessages[BphValueKey]?.isNotEmpty ?? false;
  bool get hasTemperatureValidationMessage =>
      this.fieldsValidationMessages[TemperatureValueKey]?.isNotEmpty ?? false;

  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get ageValidationMessage =>
      this.fieldsValidationMessages[AgeValueKey];
  String? get genderValidationMessage =>
      this.fieldsValidationMessages[GenderValueKey];
  String? get mobileNumberValidationMessage =>
      this.fieldsValidationMessages[MobileNumberValueKey];
  String? get heightValidationMessage =>
      this.fieldsValidationMessages[HeightValueKey];
  String? get weightValidationMessage =>
      this.fieldsValidationMessages[WeightValueKey];
  String? get pulseValidationMessage =>
      this.fieldsValidationMessages[PulseValueKey];
  String? get bpValidationMessage => this.fieldsValidationMessages[BpValueKey];
  String? get bphValidationMessage =>
      this.fieldsValidationMessages[BphValueKey];
  String? get temperatureValidationMessage =>
      this.fieldsValidationMessages[TemperatureValueKey];
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
  setMobileNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[MobileNumberValueKey] = validationMessage;
  setHeightValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[HeightValueKey] = validationMessage;
  setWeightValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[WeightValueKey] = validationMessage;
  setPulseValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PulseValueKey] = validationMessage;
  setBpValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BpValueKey] = validationMessage;
  setBphValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BphValueKey] = validationMessage;
  setTemperatureValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TemperatureValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    firstNameValue = '';
    lastNameValue = '';
    ageValue = '';
    genderValue = '';
    mobileNumberValue = '';
    heightValue = '';
    weightValue = '';
    pulseValue = '';
    bpValue = '';
    bphValue = '';
    temperatureValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      AgeValueKey: getValidationMessage(AgeValueKey),
      GenderValueKey: getValidationMessage(GenderValueKey),
      MobileNumberValueKey: getValidationMessage(MobileNumberValueKey),
      HeightValueKey: getValidationMessage(HeightValueKey),
      WeightValueKey: getValidationMessage(WeightValueKey),
      PulseValueKey: getValidationMessage(PulseValueKey),
      BpValueKey: getValidationMessage(BpValueKey),
      BphValueKey: getValidationMessage(BphValueKey),
      TemperatureValueKey: getValidationMessage(TemperatureValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _HomeViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _HomeViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      AgeValueKey: getValidationMessage(AgeValueKey),
      GenderValueKey: getValidationMessage(GenderValueKey),
      MobileNumberValueKey: getValidationMessage(MobileNumberValueKey),
      HeightValueKey: getValidationMessage(HeightValueKey),
      WeightValueKey: getValidationMessage(WeightValueKey),
      PulseValueKey: getValidationMessage(PulseValueKey),
      BpValueKey: getValidationMessage(BpValueKey),
      BphValueKey: getValidationMessage(BphValueKey),
      TemperatureValueKey: getValidationMessage(TemperatureValueKey),
    });
