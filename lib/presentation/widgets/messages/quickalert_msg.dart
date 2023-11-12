import 'package:flutter/material.dart';    
import 'package:quickalert/quickalert.dart';    
    
class QuickAlertDialog{    
  static void showAlert(BuildContext context, QuickAlertType quickAlertType, String message) {    
    QuickAlert.show(    
      context: context,    
      type: quickAlertType, 
      text: message,    
    );    
  }    
}    
