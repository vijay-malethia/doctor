// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String AddValueKey = 'add';

final Map<String, TextEditingController> _AddItemDialogTextEditingControllers =
    {};

final Map<String, FocusNode> _AddItemDialogFocusNodes = {};

final Map<String, String? Function(String?)?> _AddItemDialogTextValidations = {
  AddValueKey: null,
};

mixin $AddItemDialog on StatelessWidget {
  TextEditingController get addController =>
      _getFormTextEditingController(AddValueKey);
  FocusNode get addFocusNode => _getFormFocusNode(AddValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddItemDialogTextEditingControllers.containsKey(key)) {
      return _AddItemDialogTextEditingControllers[key]!;
    }

    _AddItemDialogTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddItemDialogTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddItemDialogFocusNodes.containsKey(key)) {
      return _AddItemDialogFocusNodes[key]!;
    }
    _AddItemDialogFocusNodes[key] = FocusNode();
    return _AddItemDialogFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    addController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    addController.addListener(() => _updateFormData(model));
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
          AddValueKey: addController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _AddItemDialogTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddItemDialogFocusNodes.values) {
      focusNode.dispose();
    }

    _AddItemDialogTextEditingControllers.clear();
    _AddItemDialogFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get addValue => this.formValueMap[AddValueKey] as String?;

  set addValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          AddValueKey: value,
        }),
    );

    if (_AddItemDialogTextEditingControllers.containsKey(AddValueKey)) {
      _AddItemDialogTextEditingControllers[AddValueKey]?.text = value ?? '';
    }
  }

  bool get hasAdd =>
      this.formValueMap.containsKey(AddValueKey) &&
      (addValue?.isNotEmpty ?? false);

  bool get hasAddValidationMessage =>
      this.fieldsValidationMessages[AddValueKey]?.isNotEmpty ?? false;

  String? get addValidationMessage =>
      this.fieldsValidationMessages[AddValueKey];
}

extension Methods on FormViewModel {
  setAddValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AddValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    addValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      AddValueKey: getValidationMessage(AddValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddItemDialogTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddItemDialogTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      AddValueKey: getValidationMessage(AddValueKey),
    });
