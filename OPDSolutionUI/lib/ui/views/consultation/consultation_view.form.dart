// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String HeightValueKey = 'height';
const String WeightValueKey = 'weight';
const String PulseValueKey = 'pulse';
const String BpValueKey = 'bp';
const String TemperatureValueKey = 'temperature';
const String AdviceValueKey = 'advice';
const String AdviceTextValueKey = 'adviceText';
const String SearchValueKey = 'search';
const String InstructionValueKey = 'instruction';
const String NextAppointmentValueKey = 'nextAppointment';

final Map<String, TextEditingController>
    _ConsultationViewTextEditingControllers = {};

final Map<String, FocusNode> _ConsultationViewFocusNodes = {};

final Map<String, String? Function(String?)?> _ConsultationViewTextValidations =
    {
  HeightValueKey: null,
  WeightValueKey: null,
  PulseValueKey: null,
  BpValueKey: null,
  TemperatureValueKey: null,
  AdviceValueKey: null,
  AdviceTextValueKey: null,
  SearchValueKey: null,
  InstructionValueKey: null,
  NextAppointmentValueKey: null,
};

mixin $ConsultationView on StatelessWidget {
  TextEditingController get heightController =>
      _getFormTextEditingController(HeightValueKey);
  TextEditingController get weightController =>
      _getFormTextEditingController(WeightValueKey);
  TextEditingController get pulseController =>
      _getFormTextEditingController(PulseValueKey);
  TextEditingController get bpController =>
      _getFormTextEditingController(BpValueKey);
  TextEditingController get temperatureController =>
      _getFormTextEditingController(TemperatureValueKey);
  TextEditingController get adviceController =>
      _getFormTextEditingController(AdviceValueKey);
  TextEditingController get adviceTextController =>
      _getFormTextEditingController(AdviceTextValueKey);
  TextEditingController get searchController =>
      _getFormTextEditingController(SearchValueKey);
  TextEditingController get instructionController =>
      _getFormTextEditingController(InstructionValueKey);
  TextEditingController get nextAppointmentController =>
      _getFormTextEditingController(NextAppointmentValueKey);
  FocusNode get heightFocusNode => _getFormFocusNode(HeightValueKey);
  FocusNode get weightFocusNode => _getFormFocusNode(WeightValueKey);
  FocusNode get pulseFocusNode => _getFormFocusNode(PulseValueKey);
  FocusNode get bpFocusNode => _getFormFocusNode(BpValueKey);
  FocusNode get temperatureFocusNode => _getFormFocusNode(TemperatureValueKey);
  FocusNode get adviceFocusNode => _getFormFocusNode(AdviceValueKey);
  FocusNode get adviceTextFocusNode => _getFormFocusNode(AdviceTextValueKey);
  FocusNode get searchFocusNode => _getFormFocusNode(SearchValueKey);
  FocusNode get instructionFocusNode => _getFormFocusNode(InstructionValueKey);
  FocusNode get nextAppointmentFocusNode =>
      _getFormFocusNode(NextAppointmentValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ConsultationViewTextEditingControllers.containsKey(key)) {
      return _ConsultationViewTextEditingControllers[key]!;
    }

    _ConsultationViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ConsultationViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ConsultationViewFocusNodes.containsKey(key)) {
      return _ConsultationViewFocusNodes[key]!;
    }
    _ConsultationViewFocusNodes[key] = FocusNode();
    return _ConsultationViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    heightController.addListener(() => _updateFormData(model));
    weightController.addListener(() => _updateFormData(model));
    pulseController.addListener(() => _updateFormData(model));
    bpController.addListener(() => _updateFormData(model));
    temperatureController.addListener(() => _updateFormData(model));
    adviceController.addListener(() => _updateFormData(model));
    adviceTextController.addListener(() => _updateFormData(model));
    searchController.addListener(() => _updateFormData(model));
    instructionController.addListener(() => _updateFormData(model));
    nextAppointmentController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    heightController.addListener(() => _updateFormData(model));
    weightController.addListener(() => _updateFormData(model));
    pulseController.addListener(() => _updateFormData(model));
    bpController.addListener(() => _updateFormData(model));
    temperatureController.addListener(() => _updateFormData(model));
    adviceController.addListener(() => _updateFormData(model));
    adviceTextController.addListener(() => _updateFormData(model));
    searchController.addListener(() => _updateFormData(model));
    instructionController.addListener(() => _updateFormData(model));
    nextAppointmentController.addListener(() => _updateFormData(model));
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
          HeightValueKey: heightController.text,
          WeightValueKey: weightController.text,
          PulseValueKey: pulseController.text,
          BpValueKey: bpController.text,
          TemperatureValueKey: temperatureController.text,
          AdviceValueKey: adviceController.text,
          AdviceTextValueKey: adviceTextController.text,
          SearchValueKey: searchController.text,
          InstructionValueKey: instructionController.text,
          NextAppointmentValueKey: nextAppointmentController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _ConsultationViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ConsultationViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ConsultationViewTextEditingControllers.clear();
    _ConsultationViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get heightValue => this.formValueMap[HeightValueKey] as String?;
  String? get weightValue => this.formValueMap[WeightValueKey] as String?;
  String? get pulseValue => this.formValueMap[PulseValueKey] as String?;
  String? get bpValue => this.formValueMap[BpValueKey] as String?;
  String? get temperatureValue =>
      this.formValueMap[TemperatureValueKey] as String?;
  String? get adviceValue => this.formValueMap[AdviceValueKey] as String?;
  String? get adviceTextValue =>
      this.formValueMap[AdviceTextValueKey] as String?;
  String? get searchValue => this.formValueMap[SearchValueKey] as String?;
  String? get instructionValue =>
      this.formValueMap[InstructionValueKey] as String?;
  String? get nextAppointmentValue =>
      this.formValueMap[NextAppointmentValueKey] as String?;

  set heightValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          HeightValueKey: value,
        }),
    );

    if (_ConsultationViewTextEditingControllers.containsKey(HeightValueKey)) {
      _ConsultationViewTextEditingControllers[HeightValueKey]?.text =
          value ?? '';
    }
  }

  set weightValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          WeightValueKey: value,
        }),
    );

    if (_ConsultationViewTextEditingControllers.containsKey(WeightValueKey)) {
      _ConsultationViewTextEditingControllers[WeightValueKey]?.text =
          value ?? '';
    }
  }

  set pulseValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          PulseValueKey: value,
        }),
    );

    if (_ConsultationViewTextEditingControllers.containsKey(PulseValueKey)) {
      _ConsultationViewTextEditingControllers[PulseValueKey]?.text =
          value ?? '';
    }
  }

  set bpValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          BpValueKey: value,
        }),
    );

    if (_ConsultationViewTextEditingControllers.containsKey(BpValueKey)) {
      _ConsultationViewTextEditingControllers[BpValueKey]?.text = value ?? '';
    }
  }

  set temperatureValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          TemperatureValueKey: value,
        }),
    );

    if (_ConsultationViewTextEditingControllers.containsKey(
        TemperatureValueKey)) {
      _ConsultationViewTextEditingControllers[TemperatureValueKey]?.text =
          value ?? '';
    }
  }

  set adviceValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          AdviceValueKey: value,
        }),
    );

    if (_ConsultationViewTextEditingControllers.containsKey(AdviceValueKey)) {
      _ConsultationViewTextEditingControllers[AdviceValueKey]?.text =
          value ?? '';
    }
  }

  set adviceTextValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          AdviceTextValueKey: value,
        }),
    );

    if (_ConsultationViewTextEditingControllers.containsKey(
        AdviceTextValueKey)) {
      _ConsultationViewTextEditingControllers[AdviceTextValueKey]?.text =
          value ?? '';
    }
  }

  set searchValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          SearchValueKey: value,
        }),
    );

    if (_ConsultationViewTextEditingControllers.containsKey(SearchValueKey)) {
      _ConsultationViewTextEditingControllers[SearchValueKey]?.text =
          value ?? '';
    }
  }

  set instructionValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          InstructionValueKey: value,
        }),
    );

    if (_ConsultationViewTextEditingControllers.containsKey(
        InstructionValueKey)) {
      _ConsultationViewTextEditingControllers[InstructionValueKey]?.text =
          value ?? '';
    }
  }

  set nextAppointmentValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          NextAppointmentValueKey: value,
        }),
    );

    if (_ConsultationViewTextEditingControllers.containsKey(
        NextAppointmentValueKey)) {
      _ConsultationViewTextEditingControllers[NextAppointmentValueKey]?.text =
          value ?? '';
    }
  }

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
  bool get hasTemperature =>
      this.formValueMap.containsKey(TemperatureValueKey) &&
      (temperatureValue?.isNotEmpty ?? false);
  bool get hasAdvice =>
      this.formValueMap.containsKey(AdviceValueKey) &&
      (adviceValue?.isNotEmpty ?? false);
  bool get hasAdviceText =>
      this.formValueMap.containsKey(AdviceTextValueKey) &&
      (adviceTextValue?.isNotEmpty ?? false);
  bool get hasSearch =>
      this.formValueMap.containsKey(SearchValueKey) &&
      (searchValue?.isNotEmpty ?? false);
  bool get hasInstruction =>
      this.formValueMap.containsKey(InstructionValueKey) &&
      (instructionValue?.isNotEmpty ?? false);
  bool get hasNextAppointment =>
      this.formValueMap.containsKey(NextAppointmentValueKey) &&
      (nextAppointmentValue?.isNotEmpty ?? false);

  bool get hasHeightValidationMessage =>
      this.fieldsValidationMessages[HeightValueKey]?.isNotEmpty ?? false;
  bool get hasWeightValidationMessage =>
      this.fieldsValidationMessages[WeightValueKey]?.isNotEmpty ?? false;
  bool get hasPulseValidationMessage =>
      this.fieldsValidationMessages[PulseValueKey]?.isNotEmpty ?? false;
  bool get hasBpValidationMessage =>
      this.fieldsValidationMessages[BpValueKey]?.isNotEmpty ?? false;
  bool get hasTemperatureValidationMessage =>
      this.fieldsValidationMessages[TemperatureValueKey]?.isNotEmpty ?? false;
  bool get hasAdviceValidationMessage =>
      this.fieldsValidationMessages[AdviceValueKey]?.isNotEmpty ?? false;
  bool get hasAdviceTextValidationMessage =>
      this.fieldsValidationMessages[AdviceTextValueKey]?.isNotEmpty ?? false;
  bool get hasSearchValidationMessage =>
      this.fieldsValidationMessages[SearchValueKey]?.isNotEmpty ?? false;
  bool get hasInstructionValidationMessage =>
      this.fieldsValidationMessages[InstructionValueKey]?.isNotEmpty ?? false;
  bool get hasNextAppointmentValidationMessage =>
      this.fieldsValidationMessages[NextAppointmentValueKey]?.isNotEmpty ??
      false;

  String? get heightValidationMessage =>
      this.fieldsValidationMessages[HeightValueKey];
  String? get weightValidationMessage =>
      this.fieldsValidationMessages[WeightValueKey];
  String? get pulseValidationMessage =>
      this.fieldsValidationMessages[PulseValueKey];
  String? get bpValidationMessage => this.fieldsValidationMessages[BpValueKey];
  String? get temperatureValidationMessage =>
      this.fieldsValidationMessages[TemperatureValueKey];
  String? get adviceValidationMessage =>
      this.fieldsValidationMessages[AdviceValueKey];
  String? get adviceTextValidationMessage =>
      this.fieldsValidationMessages[AdviceTextValueKey];
  String? get searchValidationMessage =>
      this.fieldsValidationMessages[SearchValueKey];
  String? get instructionValidationMessage =>
      this.fieldsValidationMessages[InstructionValueKey];
  String? get nextAppointmentValidationMessage =>
      this.fieldsValidationMessages[NextAppointmentValueKey];
}

extension Methods on FormViewModel {
  setHeightValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[HeightValueKey] = validationMessage;
  setWeightValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[WeightValueKey] = validationMessage;
  setPulseValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PulseValueKey] = validationMessage;
  setBpValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BpValueKey] = validationMessage;
  setTemperatureValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TemperatureValueKey] = validationMessage;
  setAdviceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AdviceValueKey] = validationMessage;
  setAdviceTextValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AdviceTextValueKey] = validationMessage;
  setSearchValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SearchValueKey] = validationMessage;
  setInstructionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[InstructionValueKey] = validationMessage;
  setNextAppointmentValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NextAppointmentValueKey] =
          validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    heightValue = '';
    weightValue = '';
    pulseValue = '';
    bpValue = '';
    temperatureValue = '';
    adviceValue = '';
    adviceTextValue = '';
    searchValue = '';
    instructionValue = '';
    nextAppointmentValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      HeightValueKey: getValidationMessage(HeightValueKey),
      WeightValueKey: getValidationMessage(WeightValueKey),
      PulseValueKey: getValidationMessage(PulseValueKey),
      BpValueKey: getValidationMessage(BpValueKey),
      TemperatureValueKey: getValidationMessage(TemperatureValueKey),
      AdviceValueKey: getValidationMessage(AdviceValueKey),
      AdviceTextValueKey: getValidationMessage(AdviceTextValueKey),
      SearchValueKey: getValidationMessage(SearchValueKey),
      InstructionValueKey: getValidationMessage(InstructionValueKey),
      NextAppointmentValueKey: getValidationMessage(NextAppointmentValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ConsultationViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ConsultationViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      HeightValueKey: getValidationMessage(HeightValueKey),
      WeightValueKey: getValidationMessage(WeightValueKey),
      PulseValueKey: getValidationMessage(PulseValueKey),
      BpValueKey: getValidationMessage(BpValueKey),
      TemperatureValueKey: getValidationMessage(TemperatureValueKey),
      AdviceValueKey: getValidationMessage(AdviceValueKey),
      AdviceTextValueKey: getValidationMessage(AdviceTextValueKey),
      SearchValueKey: getValidationMessage(SearchValueKey),
      InstructionValueKey: getValidationMessage(InstructionValueKey),
      NextAppointmentValueKey: getValidationMessage(NextAppointmentValueKey),
    });
