// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String PhoneNumberValueKey = 'phoneNumber';
const String AgeValueKey = 'Age';
const String SpecialityValueKey = 'Speciality';
const String ExperienceValueKey = 'Experience';
const String ClinicNameValueKey = 'clinicName';
const String ClinicLocationValueKey = 'clinicLocation';
const String Number1ValueKey = 'number1';
const String AssistantFirstNameValueKey = 'assistantFirstName';
const String AssistantLastNameValueKey = 'assistantLastName';
const String AssistantContactNumberValueKey = 'assistantContactNumber';
const String AssistantSpecializationValueKey = 'assistantSpecialization';

final Map<String, TextEditingController>
    _DoctorProfileViewTextEditingControllers = {};

final Map<String, FocusNode> _DoctorProfileViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _DoctorProfileViewTextValidations = {
  FirstNameValueKey: null,
  LastNameValueKey: null,
  PhoneNumberValueKey: null,
  AgeValueKey: null,
  SpecialityValueKey: null,
  ExperienceValueKey: null,
  ClinicNameValueKey: null,
  ClinicLocationValueKey: null,
  Number1ValueKey: null,
  AssistantFirstNameValueKey: null,
  AssistantLastNameValueKey: null,
  AssistantContactNumberValueKey: null,
  AssistantSpecializationValueKey: null,
};

mixin $DoctorProfileView {
  TextEditingController get firstNameController =>
      _getFormTextEditingController(FirstNameValueKey);
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get phoneNumberController =>
      _getFormTextEditingController(PhoneNumberValueKey);
  TextEditingController get ageController =>
      _getFormTextEditingController(AgeValueKey);
  TextEditingController get specialityController =>
      _getFormTextEditingController(SpecialityValueKey);
  TextEditingController get experienceController =>
      _getFormTextEditingController(ExperienceValueKey);
  TextEditingController get clinicNameController =>
      _getFormTextEditingController(ClinicNameValueKey);
  TextEditingController get clinicLocationController =>
      _getFormTextEditingController(ClinicLocationValueKey);
  TextEditingController get number1Controller =>
      _getFormTextEditingController(Number1ValueKey);
  TextEditingController get assistantFirstNameController =>
      _getFormTextEditingController(AssistantFirstNameValueKey);
  TextEditingController get assistantLastNameController =>
      _getFormTextEditingController(AssistantLastNameValueKey);
  TextEditingController get assistantContactNumberController =>
      _getFormTextEditingController(AssistantContactNumberValueKey);
  TextEditingController get assistantSpecializationController =>
      _getFormTextEditingController(AssistantSpecializationValueKey);
  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get phoneNumberFocusNode => _getFormFocusNode(PhoneNumberValueKey);
  FocusNode get ageFocusNode => _getFormFocusNode(AgeValueKey);
  FocusNode get specialityFocusNode => _getFormFocusNode(SpecialityValueKey);
  FocusNode get experienceFocusNode => _getFormFocusNode(ExperienceValueKey);
  FocusNode get clinicNameFocusNode => _getFormFocusNode(ClinicNameValueKey);
  FocusNode get clinicLocationFocusNode =>
      _getFormFocusNode(ClinicLocationValueKey);
  FocusNode get number1FocusNode => _getFormFocusNode(Number1ValueKey);
  FocusNode get assistantFirstNameFocusNode =>
      _getFormFocusNode(AssistantFirstNameValueKey);
  FocusNode get assistantLastNameFocusNode =>
      _getFormFocusNode(AssistantLastNameValueKey);
  FocusNode get assistantContactNumberFocusNode =>
      _getFormFocusNode(AssistantContactNumberValueKey);
  FocusNode get assistantSpecializationFocusNode =>
      _getFormFocusNode(AssistantSpecializationValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_DoctorProfileViewTextEditingControllers.containsKey(key)) {
      return _DoctorProfileViewTextEditingControllers[key]!;
    }

    _DoctorProfileViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _DoctorProfileViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_DoctorProfileViewFocusNodes.containsKey(key)) {
      return _DoctorProfileViewFocusNodes[key]!;
    }
    _DoctorProfileViewFocusNodes[key] = FocusNode();
    return _DoctorProfileViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
    ageController.addListener(() => _updateFormData(model));
    specialityController.addListener(() => _updateFormData(model));
    experienceController.addListener(() => _updateFormData(model));
    clinicNameController.addListener(() => _updateFormData(model));
    clinicLocationController.addListener(() => _updateFormData(model));
    number1Controller.addListener(() => _updateFormData(model));
    assistantFirstNameController.addListener(() => _updateFormData(model));
    assistantLastNameController.addListener(() => _updateFormData(model));
    assistantContactNumberController.addListener(() => _updateFormData(model));
    assistantSpecializationController.addListener(() => _updateFormData(model));
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
    phoneNumberController.addListener(() => _updateFormData(model));
    ageController.addListener(() => _updateFormData(model));
    specialityController.addListener(() => _updateFormData(model));
    experienceController.addListener(() => _updateFormData(model));
    clinicNameController.addListener(() => _updateFormData(model));
    clinicLocationController.addListener(() => _updateFormData(model));
    number1Controller.addListener(() => _updateFormData(model));
    assistantFirstNameController.addListener(() => _updateFormData(model));
    assistantLastNameController.addListener(() => _updateFormData(model));
    assistantContactNumberController.addListener(() => _updateFormData(model));
    assistantSpecializationController.addListener(() => _updateFormData(model));
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
          PhoneNumberValueKey: phoneNumberController.text,
          AgeValueKey: ageController.text,
          SpecialityValueKey: specialityController.text,
          ExperienceValueKey: experienceController.text,
          ClinicNameValueKey: clinicNameController.text,
          ClinicLocationValueKey: clinicLocationController.text,
          Number1ValueKey: number1Controller.text,
          AssistantFirstNameValueKey: assistantFirstNameController.text,
          AssistantLastNameValueKey: assistantLastNameController.text,
          AssistantContactNumberValueKey: assistantContactNumberController.text,
          AssistantSpecializationValueKey:
              assistantSpecializationController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _DoctorProfileViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _DoctorProfileViewFocusNodes.values) {
      focusNode.dispose();
    }

    _DoctorProfileViewTextEditingControllers.clear();
    _DoctorProfileViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get firstNameValue => this.formValueMap[FirstNameValueKey] as String?;
  String? get lastNameValue => this.formValueMap[LastNameValueKey] as String?;
  String? get phoneNumberValue =>
      this.formValueMap[PhoneNumberValueKey] as String?;
  String? get ageValue => this.formValueMap[AgeValueKey] as String?;
  String? get specialityValue =>
      this.formValueMap[SpecialityValueKey] as String?;
  String? get experienceValue =>
      this.formValueMap[ExperienceValueKey] as String?;
  String? get clinicNameValue =>
      this.formValueMap[ClinicNameValueKey] as String?;
  String? get clinicLocationValue =>
      this.formValueMap[ClinicLocationValueKey] as String?;
  String? get number1Value => this.formValueMap[Number1ValueKey] as String?;
  String? get assistantFirstNameValue =>
      this.formValueMap[AssistantFirstNameValueKey] as String?;
  String? get assistantLastNameValue =>
      this.formValueMap[AssistantLastNameValueKey] as String?;
  String? get assistantContactNumberValue =>
      this.formValueMap[AssistantContactNumberValueKey] as String?;
  String? get assistantSpecializationValue =>
      this.formValueMap[AssistantSpecializationValueKey] as String?;

  set firstNameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          FirstNameValueKey: value,
        }),
    );

    if (_DoctorProfileViewTextEditingControllers.containsKey(
        FirstNameValueKey)) {
      _DoctorProfileViewTextEditingControllers[FirstNameValueKey]?.text =
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

    if (_DoctorProfileViewTextEditingControllers.containsKey(
        LastNameValueKey)) {
      _DoctorProfileViewTextEditingControllers[LastNameValueKey]?.text =
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

    if (_DoctorProfileViewTextEditingControllers.containsKey(
        PhoneNumberValueKey)) {
      _DoctorProfileViewTextEditingControllers[PhoneNumberValueKey]?.text =
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

    if (_DoctorProfileViewTextEditingControllers.containsKey(AgeValueKey)) {
      _DoctorProfileViewTextEditingControllers[AgeValueKey]?.text = value ?? '';
    }
  }

  set specialityValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          SpecialityValueKey: value,
        }),
    );

    if (_DoctorProfileViewTextEditingControllers.containsKey(
        SpecialityValueKey)) {
      _DoctorProfileViewTextEditingControllers[SpecialityValueKey]?.text =
          value ?? '';
    }
  }

  set experienceValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          ExperienceValueKey: value,
        }),
    );

    if (_DoctorProfileViewTextEditingControllers.containsKey(
        ExperienceValueKey)) {
      _DoctorProfileViewTextEditingControllers[ExperienceValueKey]?.text =
          value ?? '';
    }
  }

  set clinicNameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          ClinicNameValueKey: value,
        }),
    );

    if (_DoctorProfileViewTextEditingControllers.containsKey(
        ClinicNameValueKey)) {
      _DoctorProfileViewTextEditingControllers[ClinicNameValueKey]?.text =
          value ?? '';
    }
  }

  set clinicLocationValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          ClinicLocationValueKey: value,
        }),
    );

    if (_DoctorProfileViewTextEditingControllers.containsKey(
        ClinicLocationValueKey)) {
      _DoctorProfileViewTextEditingControllers[ClinicLocationValueKey]?.text =
          value ?? '';
    }
  }

  set number1Value(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          Number1ValueKey: value,
        }),
    );

    if (_DoctorProfileViewTextEditingControllers.containsKey(Number1ValueKey)) {
      _DoctorProfileViewTextEditingControllers[Number1ValueKey]?.text =
          value ?? '';
    }
  }

  set assistantFirstNameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          AssistantFirstNameValueKey: value,
        }),
    );

    if (_DoctorProfileViewTextEditingControllers.containsKey(
        AssistantFirstNameValueKey)) {
      _DoctorProfileViewTextEditingControllers[AssistantFirstNameValueKey]
          ?.text = value ?? '';
    }
  }

  set assistantLastNameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          AssistantLastNameValueKey: value,
        }),
    );

    if (_DoctorProfileViewTextEditingControllers.containsKey(
        AssistantLastNameValueKey)) {
      _DoctorProfileViewTextEditingControllers[AssistantLastNameValueKey]
          ?.text = value ?? '';
    }
  }

  set assistantContactNumberValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          AssistantContactNumberValueKey: value,
        }),
    );

    if (_DoctorProfileViewTextEditingControllers.containsKey(
        AssistantContactNumberValueKey)) {
      _DoctorProfileViewTextEditingControllers[AssistantContactNumberValueKey]
          ?.text = value ?? '';
    }
  }

  set assistantSpecializationValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          AssistantSpecializationValueKey: value,
        }),
    );

    if (_DoctorProfileViewTextEditingControllers.containsKey(
        AssistantSpecializationValueKey)) {
      _DoctorProfileViewTextEditingControllers[AssistantSpecializationValueKey]
          ?.text = value ?? '';
    }
  }

  bool get hasFirstName =>
      this.formValueMap.containsKey(FirstNameValueKey) &&
      (firstNameValue?.isNotEmpty ?? false);
  bool get hasLastName =>
      this.formValueMap.containsKey(LastNameValueKey) &&
      (lastNameValue?.isNotEmpty ?? false);
  bool get hasPhoneNumber =>
      this.formValueMap.containsKey(PhoneNumberValueKey) &&
      (phoneNumberValue?.isNotEmpty ?? false);
  bool get hasAge =>
      this.formValueMap.containsKey(AgeValueKey) &&
      (ageValue?.isNotEmpty ?? false);
  bool get hasSpeciality =>
      this.formValueMap.containsKey(SpecialityValueKey) &&
      (specialityValue?.isNotEmpty ?? false);
  bool get hasExperience =>
      this.formValueMap.containsKey(ExperienceValueKey) &&
      (experienceValue?.isNotEmpty ?? false);
  bool get hasClinicName =>
      this.formValueMap.containsKey(ClinicNameValueKey) &&
      (clinicNameValue?.isNotEmpty ?? false);
  bool get hasClinicLocation =>
      this.formValueMap.containsKey(ClinicLocationValueKey) &&
      (clinicLocationValue?.isNotEmpty ?? false);
  bool get hasNumber1 =>
      this.formValueMap.containsKey(Number1ValueKey) &&
      (number1Value?.isNotEmpty ?? false);
  bool get hasAssistantFirstName =>
      this.formValueMap.containsKey(AssistantFirstNameValueKey) &&
      (assistantFirstNameValue?.isNotEmpty ?? false);
  bool get hasAssistantLastName =>
      this.formValueMap.containsKey(AssistantLastNameValueKey) &&
      (assistantLastNameValue?.isNotEmpty ?? false);
  bool get hasAssistantContactNumber =>
      this.formValueMap.containsKey(AssistantContactNumberValueKey) &&
      (assistantContactNumberValue?.isNotEmpty ?? false);
  bool get hasAssistantSpecialization =>
      this.formValueMap.containsKey(AssistantSpecializationValueKey) &&
      (assistantSpecializationValue?.isNotEmpty ?? false);

  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey]?.isNotEmpty ?? false;
  bool get hasAgeValidationMessage =>
      this.fieldsValidationMessages[AgeValueKey]?.isNotEmpty ?? false;
  bool get hasSpecialityValidationMessage =>
      this.fieldsValidationMessages[SpecialityValueKey]?.isNotEmpty ?? false;
  bool get hasExperienceValidationMessage =>
      this.fieldsValidationMessages[ExperienceValueKey]?.isNotEmpty ?? false;
  bool get hasClinicNameValidationMessage =>
      this.fieldsValidationMessages[ClinicNameValueKey]?.isNotEmpty ?? false;
  bool get hasClinicLocationValidationMessage =>
      this.fieldsValidationMessages[ClinicLocationValueKey]?.isNotEmpty ??
      false;
  bool get hasNumber1ValidationMessage =>
      this.fieldsValidationMessages[Number1ValueKey]?.isNotEmpty ?? false;
  bool get hasAssistantFirstNameValidationMessage =>
      this.fieldsValidationMessages[AssistantFirstNameValueKey]?.isNotEmpty ??
      false;
  bool get hasAssistantLastNameValidationMessage =>
      this.fieldsValidationMessages[AssistantLastNameValueKey]?.isNotEmpty ??
      false;
  bool get hasAssistantContactNumberValidationMessage =>
      this
          .fieldsValidationMessages[AssistantContactNumberValueKey]
          ?.isNotEmpty ??
      false;
  bool get hasAssistantSpecializationValidationMessage =>
      this
          .fieldsValidationMessages[AssistantSpecializationValueKey]
          ?.isNotEmpty ??
      false;

  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get phoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey];
  String? get ageValidationMessage =>
      this.fieldsValidationMessages[AgeValueKey];
  String? get specialityValidationMessage =>
      this.fieldsValidationMessages[SpecialityValueKey];
  String? get experienceValidationMessage =>
      this.fieldsValidationMessages[ExperienceValueKey];
  String? get clinicNameValidationMessage =>
      this.fieldsValidationMessages[ClinicNameValueKey];
  String? get clinicLocationValidationMessage =>
      this.fieldsValidationMessages[ClinicLocationValueKey];
  String? get number1ValidationMessage =>
      this.fieldsValidationMessages[Number1ValueKey];
  String? get assistantFirstNameValidationMessage =>
      this.fieldsValidationMessages[AssistantFirstNameValueKey];
  String? get assistantLastNameValidationMessage =>
      this.fieldsValidationMessages[AssistantLastNameValueKey];
  String? get assistantContactNumberValidationMessage =>
      this.fieldsValidationMessages[AssistantContactNumberValueKey];
  String? get assistantSpecializationValidationMessage =>
      this.fieldsValidationMessages[AssistantSpecializationValueKey];
}

extension Methods on FormViewModel {
  setFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstNameValueKey] = validationMessage;
  setLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastNameValueKey] = validationMessage;
  setPhoneNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneNumberValueKey] = validationMessage;
  setAgeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AgeValueKey] = validationMessage;
  setSpecialityValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SpecialityValueKey] = validationMessage;
  setExperienceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ExperienceValueKey] = validationMessage;
  setClinicNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ClinicNameValueKey] = validationMessage;
  setClinicLocationValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ClinicLocationValueKey] = validationMessage;
  setNumber1ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[Number1ValueKey] = validationMessage;
  setAssistantFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AssistantFirstNameValueKey] =
          validationMessage;
  setAssistantLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AssistantLastNameValueKey] =
          validationMessage;
  setAssistantContactNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AssistantContactNumberValueKey] =
          validationMessage;
  setAssistantSpecializationValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AssistantSpecializationValueKey] =
          validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    firstNameValue = '';
    lastNameValue = '';
    phoneNumberValue = '';
    ageValue = '';
    specialityValue = '';
    experienceValue = '';
    clinicNameValue = '';
    clinicLocationValue = '';
    number1Value = '';
    assistantFirstNameValue = '';
    assistantLastNameValue = '';
    assistantContactNumberValue = '';
    assistantSpecializationValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      AgeValueKey: getValidationMessage(AgeValueKey),
      SpecialityValueKey: getValidationMessage(SpecialityValueKey),
      ExperienceValueKey: getValidationMessage(ExperienceValueKey),
      ClinicNameValueKey: getValidationMessage(ClinicNameValueKey),
      ClinicLocationValueKey: getValidationMessage(ClinicLocationValueKey),
      Number1ValueKey: getValidationMessage(Number1ValueKey),
      AssistantFirstNameValueKey:
          getValidationMessage(AssistantFirstNameValueKey),
      AssistantLastNameValueKey:
          getValidationMessage(AssistantLastNameValueKey),
      AssistantContactNumberValueKey:
          getValidationMessage(AssistantContactNumberValueKey),
      AssistantSpecializationValueKey:
          getValidationMessage(AssistantSpecializationValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _DoctorProfileViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _DoctorProfileViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      AgeValueKey: getValidationMessage(AgeValueKey),
      SpecialityValueKey: getValidationMessage(SpecialityValueKey),
      ExperienceValueKey: getValidationMessage(ExperienceValueKey),
      ClinicNameValueKey: getValidationMessage(ClinicNameValueKey),
      ClinicLocationValueKey: getValidationMessage(ClinicLocationValueKey),
      Number1ValueKey: getValidationMessage(Number1ValueKey),
      AssistantFirstNameValueKey:
          getValidationMessage(AssistantFirstNameValueKey),
      AssistantLastNameValueKey:
          getValidationMessage(AssistantLastNameValueKey),
      AssistantContactNumberValueKey:
          getValidationMessage(AssistantContactNumberValueKey),
      AssistantSpecializationValueKey:
          getValidationMessage(AssistantSpecializationValueKey),
    });
