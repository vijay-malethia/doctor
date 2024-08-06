// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String AdviceValueKey = 'advice';
const String InstructionValueKey = 'instruction';
const String SearchValueKey = 'search';

final Map<String, TextEditingController> _PatientViewTextEditingControllers =
    {};

final Map<String, FocusNode> _PatientViewFocusNodes = {};

final Map<String, String? Function(String?)?> _PatientViewTextValidations = {
  AdviceValueKey: null,
  InstructionValueKey: null,
  SearchValueKey: null,
};

mixin $PatientView {
  TextEditingController get adviceController =>
      _getFormTextEditingController(AdviceValueKey);
  TextEditingController get instructionController =>
      _getFormTextEditingController(InstructionValueKey);
  TextEditingController get searchController =>
      _getFormTextEditingController(SearchValueKey);
  FocusNode get adviceFocusNode => _getFormFocusNode(AdviceValueKey);
  FocusNode get instructionFocusNode => _getFormFocusNode(InstructionValueKey);
  FocusNode get searchFocusNode => _getFormFocusNode(SearchValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_PatientViewTextEditingControllers.containsKey(key)) {
      return _PatientViewTextEditingControllers[key]!;
    }

    _PatientViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _PatientViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_PatientViewFocusNodes.containsKey(key)) {
      return _PatientViewFocusNodes[key]!;
    }
    _PatientViewFocusNodes[key] = FocusNode();
    return _PatientViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    adviceController.addListener(() => _updateFormData(model));
    instructionController.addListener(() => _updateFormData(model));
    searchController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    adviceController.addListener(() => _updateFormData(model));
    instructionController.addListener(() => _updateFormData(model));
    searchController.addListener(() => _updateFormData(model));
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
          AdviceValueKey: adviceController.text,
          InstructionValueKey: instructionController.text,
          SearchValueKey: searchController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _PatientViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _PatientViewFocusNodes.values) {
      focusNode.dispose();
    }

    _PatientViewTextEditingControllers.clear();
    _PatientViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get adviceValue => this.formValueMap[AdviceValueKey] as String?;
  String? get instructionValue =>
      this.formValueMap[InstructionValueKey] as String?;
  String? get searchValue => this.formValueMap[SearchValueKey] as String?;

  set adviceValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          AdviceValueKey: value,
        }),
    );

    if (_PatientViewTextEditingControllers.containsKey(AdviceValueKey)) {
      _PatientViewTextEditingControllers[AdviceValueKey]?.text = value ?? '';
    }
  }

  set instructionValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          InstructionValueKey: value,
        }),
    );

    if (_PatientViewTextEditingControllers.containsKey(InstructionValueKey)) {
      _PatientViewTextEditingControllers[InstructionValueKey]?.text =
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

    if (_PatientViewTextEditingControllers.containsKey(SearchValueKey)) {
      _PatientViewTextEditingControllers[SearchValueKey]?.text = value ?? '';
    }
  }

  bool get hasAdvice =>
      this.formValueMap.containsKey(AdviceValueKey) &&
      (adviceValue?.isNotEmpty ?? false);
  bool get hasInstruction =>
      this.formValueMap.containsKey(InstructionValueKey) &&
      (instructionValue?.isNotEmpty ?? false);
  bool get hasSearch =>
      this.formValueMap.containsKey(SearchValueKey) &&
      (searchValue?.isNotEmpty ?? false);

  bool get hasAdviceValidationMessage =>
      this.fieldsValidationMessages[AdviceValueKey]?.isNotEmpty ?? false;
  bool get hasInstructionValidationMessage =>
      this.fieldsValidationMessages[InstructionValueKey]?.isNotEmpty ?? false;
  bool get hasSearchValidationMessage =>
      this.fieldsValidationMessages[SearchValueKey]?.isNotEmpty ?? false;

  String? get adviceValidationMessage =>
      this.fieldsValidationMessages[AdviceValueKey];
  String? get instructionValidationMessage =>
      this.fieldsValidationMessages[InstructionValueKey];
  String? get searchValidationMessage =>
      this.fieldsValidationMessages[SearchValueKey];
}

extension Methods on FormViewModel {
  setAdviceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AdviceValueKey] = validationMessage;
  setInstructionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[InstructionValueKey] = validationMessage;
  setSearchValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SearchValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    adviceValue = '';
    instructionValue = '';
    searchValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      AdviceValueKey: getValidationMessage(AdviceValueKey),
      InstructionValueKey: getValidationMessage(InstructionValueKey),
      SearchValueKey: getValidationMessage(SearchValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _PatientViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _PatientViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      AdviceValueKey: getValidationMessage(AdviceValueKey),
      InstructionValueKey: getValidationMessage(InstructionValueKey),
      SearchValueKey: getValidationMessage(SearchValueKey),
    });
