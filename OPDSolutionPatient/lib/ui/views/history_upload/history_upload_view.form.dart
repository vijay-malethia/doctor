// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String DoctorNameValueKey = 'doctorName';

final Map<String, TextEditingController>
    _HistoryUploadViewTextEditingControllers = {};

final Map<String, FocusNode> _HistoryUploadViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _HistoryUploadViewTextValidations = {
  DoctorNameValueKey: null,
};

mixin $HistoryUploadView {
  TextEditingController get doctorNameController =>
      _getFormTextEditingController(DoctorNameValueKey);

  FocusNode get doctorNameFocusNode => _getFormFocusNode(DoctorNameValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_HistoryUploadViewTextEditingControllers.containsKey(key)) {
      return _HistoryUploadViewTextEditingControllers[key]!;
    }

    _HistoryUploadViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _HistoryUploadViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_HistoryUploadViewFocusNodes.containsKey(key)) {
      return _HistoryUploadViewFocusNodes[key]!;
    }
    _HistoryUploadViewFocusNodes[key] = FocusNode();
    return _HistoryUploadViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    doctorNameController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    doctorNameController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          DoctorNameValueKey: doctorNameController.text,
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

    for (var controller in _HistoryUploadViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _HistoryUploadViewFocusNodes.values) {
      focusNode.dispose();
    }

    _HistoryUploadViewTextEditingControllers.clear();
    _HistoryUploadViewFocusNodes.clear();
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

  String? get doctorNameValue =>
      this.formValueMap[DoctorNameValueKey] as String?;

  set doctorNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({DoctorNameValueKey: value}),
    );

    if (_HistoryUploadViewTextEditingControllers.containsKey(
        DoctorNameValueKey)) {
      _HistoryUploadViewTextEditingControllers[DoctorNameValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasDoctorName =>
      this.formValueMap.containsKey(DoctorNameValueKey) &&
      (doctorNameValue?.isNotEmpty ?? false);

  bool get hasDoctorNameValidationMessage =>
      this.fieldsValidationMessages[DoctorNameValueKey]?.isNotEmpty ?? false;

  String? get doctorNameValidationMessage =>
      this.fieldsValidationMessages[DoctorNameValueKey];
}

extension Methods on FormViewModel {
  setDoctorNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DoctorNameValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    doctorNameValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      DoctorNameValueKey: getValidationMessage(DoctorNameValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _HistoryUploadViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _HistoryUploadViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      DoctorNameValueKey: getValidationMessage(DoctorNameValueKey),
    });
