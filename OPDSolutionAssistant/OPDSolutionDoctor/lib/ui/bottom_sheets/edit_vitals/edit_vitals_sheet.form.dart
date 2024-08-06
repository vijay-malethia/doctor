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
const String Bp2ValueKey = 'bp2';
const String TemperatureValueKey = 'temperature';

final Map<String, TextEditingController>
    _EditVitalsSheetTextEditingControllers = {};

final Map<String, FocusNode> _EditVitalsSheetFocusNodes = {};

final Map<String, String? Function(String?)?> _EditVitalsSheetTextValidations =
    {
  HeightValueKey: null,
  WeightValueKey: null,
  PulseValueKey: null,
  BpValueKey: null,
  Bp2ValueKey: null,
  TemperatureValueKey: null,
};

mixin $EditVitalsSheet {
  TextEditingController get heightController =>
      _getFormTextEditingController(HeightValueKey);
  TextEditingController get weightController =>
      _getFormTextEditingController(WeightValueKey);
  TextEditingController get pulseController =>
      _getFormTextEditingController(PulseValueKey);
  TextEditingController get bpController =>
      _getFormTextEditingController(BpValueKey);
  TextEditingController get bp2Controller =>
      _getFormTextEditingController(Bp2ValueKey);
  TextEditingController get temperatureController =>
      _getFormTextEditingController(TemperatureValueKey);
  FocusNode get heightFocusNode => _getFormFocusNode(HeightValueKey);
  FocusNode get weightFocusNode => _getFormFocusNode(WeightValueKey);
  FocusNode get pulseFocusNode => _getFormFocusNode(PulseValueKey);
  FocusNode get bpFocusNode => _getFormFocusNode(BpValueKey);
  FocusNode get bp2FocusNode => _getFormFocusNode(Bp2ValueKey);
  FocusNode get temperatureFocusNode => _getFormFocusNode(TemperatureValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_EditVitalsSheetTextEditingControllers.containsKey(key)) {
      return _EditVitalsSheetTextEditingControllers[key]!;
    }

    _EditVitalsSheetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _EditVitalsSheetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_EditVitalsSheetFocusNodes.containsKey(key)) {
      return _EditVitalsSheetFocusNodes[key]!;
    }
    _EditVitalsSheetFocusNodes[key] = FocusNode();
    return _EditVitalsSheetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    heightController.addListener(() => _updateFormData(model));
    weightController.addListener(() => _updateFormData(model));
    pulseController.addListener(() => _updateFormData(model));
    bpController.addListener(() => _updateFormData(model));
    bp2Controller.addListener(() => _updateFormData(model));
    temperatureController.addListener(() => _updateFormData(model));
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
    bp2Controller.addListener(() => _updateFormData(model));
    temperatureController.addListener(() => _updateFormData(model));
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
          Bp2ValueKey: bp2Controller.text,
          TemperatureValueKey: temperatureController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _EditVitalsSheetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _EditVitalsSheetFocusNodes.values) {
      focusNode.dispose();
    }

    _EditVitalsSheetTextEditingControllers.clear();
    _EditVitalsSheetFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get heightValue => this.formValueMap[HeightValueKey] as String?;
  String? get weightValue => this.formValueMap[WeightValueKey] as String?;
  String? get pulseValue => this.formValueMap[PulseValueKey] as String?;
  String? get bpValue => this.formValueMap[BpValueKey] as String?;
  String? get bp2Value => this.formValueMap[Bp2ValueKey] as String?;
  String? get temperatureValue =>
      this.formValueMap[TemperatureValueKey] as String?;

  set heightValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          HeightValueKey: value,
        }),
    );

    if (_EditVitalsSheetTextEditingControllers.containsKey(HeightValueKey)) {
      _EditVitalsSheetTextEditingControllers[HeightValueKey]?.text =
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

    if (_EditVitalsSheetTextEditingControllers.containsKey(WeightValueKey)) {
      _EditVitalsSheetTextEditingControllers[WeightValueKey]?.text =
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

    if (_EditVitalsSheetTextEditingControllers.containsKey(PulseValueKey)) {
      _EditVitalsSheetTextEditingControllers[PulseValueKey]?.text = value ?? '';
    }
  }

  set bpValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          BpValueKey: value,
        }),
    );

    if (_EditVitalsSheetTextEditingControllers.containsKey(BpValueKey)) {
      _EditVitalsSheetTextEditingControllers[BpValueKey]?.text = value ?? '';
    }
  }

  set bp2Value(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          Bp2ValueKey: value,
        }),
    );

    if (_EditVitalsSheetTextEditingControllers.containsKey(Bp2ValueKey)) {
      _EditVitalsSheetTextEditingControllers[Bp2ValueKey]?.text = value ?? '';
    }
  }

  set temperatureValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          TemperatureValueKey: value,
        }),
    );

    if (_EditVitalsSheetTextEditingControllers.containsKey(
        TemperatureValueKey)) {
      _EditVitalsSheetTextEditingControllers[TemperatureValueKey]?.text =
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
  bool get hasBp2 =>
      this.formValueMap.containsKey(Bp2ValueKey) &&
      (bp2Value?.isNotEmpty ?? false);
  bool get hasTemperature =>
      this.formValueMap.containsKey(TemperatureValueKey) &&
      (temperatureValue?.isNotEmpty ?? false);

  bool get hasHeightValidationMessage =>
      this.fieldsValidationMessages[HeightValueKey]?.isNotEmpty ?? false;
  bool get hasWeightValidationMessage =>
      this.fieldsValidationMessages[WeightValueKey]?.isNotEmpty ?? false;
  bool get hasPulseValidationMessage =>
      this.fieldsValidationMessages[PulseValueKey]?.isNotEmpty ?? false;
  bool get hasBpValidationMessage =>
      this.fieldsValidationMessages[BpValueKey]?.isNotEmpty ?? false;
  bool get hasBp2ValidationMessage =>
      this.fieldsValidationMessages[Bp2ValueKey]?.isNotEmpty ?? false;
  bool get hasTemperatureValidationMessage =>
      this.fieldsValidationMessages[TemperatureValueKey]?.isNotEmpty ?? false;

  String? get heightValidationMessage =>
      this.fieldsValidationMessages[HeightValueKey];
  String? get weightValidationMessage =>
      this.fieldsValidationMessages[WeightValueKey];
  String? get pulseValidationMessage =>
      this.fieldsValidationMessages[PulseValueKey];
  String? get bpValidationMessage => this.fieldsValidationMessages[BpValueKey];
  String? get bp2ValidationMessage =>
      this.fieldsValidationMessages[Bp2ValueKey];
  String? get temperatureValidationMessage =>
      this.fieldsValidationMessages[TemperatureValueKey];
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
  setBp2ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[Bp2ValueKey] = validationMessage;
  setTemperatureValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TemperatureValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    heightValue = '';
    weightValue = '';
    pulseValue = '';
    bpValue = '';
    bp2Value = '';
    temperatureValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      HeightValueKey: getValidationMessage(HeightValueKey),
      WeightValueKey: getValidationMessage(WeightValueKey),
      PulseValueKey: getValidationMessage(PulseValueKey),
      BpValueKey: getValidationMessage(BpValueKey),
      Bp2ValueKey: getValidationMessage(Bp2ValueKey),
      TemperatureValueKey: getValidationMessage(TemperatureValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _EditVitalsSheetTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _EditVitalsSheetTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      HeightValueKey: getValidationMessage(HeightValueKey),
      WeightValueKey: getValidationMessage(WeightValueKey),
      PulseValueKey: getValidationMessage(PulseValueKey),
      BpValueKey: getValidationMessage(BpValueKey),
      Bp2ValueKey: getValidationMessage(Bp2ValueKey),
      TemperatureValueKey: getValidationMessage(TemperatureValueKey),
    });
