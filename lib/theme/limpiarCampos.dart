import 'package:flutter/material.dart';

class FormUtils {
  static void clearTextControllers(List<TextEditingController> controllers) {
    for (var controller in controllers) {
      controller.clear();
      
    }
  }
}