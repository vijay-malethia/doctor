// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String SearchValueKey = 'search';

final Map<String, TextEditingController> _DiagnosisViewTextEditingControllers =
    {};

final Map<String, FocusNode> _DiagnosisViewFocusNodes = {};

final Map<String, String? Function(String?)?> _DiagnosisViewTextValidations = {
  SearchValueKey: null,
};

mixin $DiagnosisView on StatelessWidget {
  TextEditingController get searchController =>
      _getFormTextEditingController(SearchValueKey);
  FocusNode get searchFocusNode => _getFormFocusNode(SearchValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_DiagnosisViewTextEditingControllers.containsKey(key)) {
      return _DiagnosisViewTextEditingControllers[key]!;
    }

    _DiagnosisViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _DiagnosisViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_DiagnosisViewFocusNodes.containsKey(key)) {
      return _DiagnosisViewFocusNodes[key]!;
    }
    _DiagnosisViewFocusNodes[key] = FocusNode();
    return _DiagnosisViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    searchController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
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

    for (var controller in _DiagnosisViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _DiagnosisViewFocusNodes.values) {
      focusNode.dispose();
    }

    _DiagnosisViewTextEditingControllers.clear();
    _DiagnosisViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get searchValue => this.formValueMap[SearchValueKey] as String?;

  set searchValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          SearchValueKey: value,
        }),
    );

    if (_DiagnosisViewTextEditingControllers.containsKey(SearchValueKey)) {
      _DiagnosisViewTextEditingControllers[SearchValueKey]?.text = value ?? '';
    }
  }

  bool get hasSearch =>
      this.formValueMap.containsKey(SearchValueKey) &&
      (searchValue?.isNotEmpty ?? false);

  bool get hasSearchValidationMessage =>
      this.fieldsValidationMessages[SearchValueKey]?.isNotEmpty ?? false;

  String? get searchValidationMessage =>
      this.fieldsValidationMessages[SearchValueKey];
}

extension Methods on FormViewModel {
  setSearchValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SearchValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    searchValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      SearchValueKey: getValidationMessage(SearchValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _DiagnosisViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _DiagnosisViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      SearchValueKey: getValidationMessage(SearchValueKey),
    });
