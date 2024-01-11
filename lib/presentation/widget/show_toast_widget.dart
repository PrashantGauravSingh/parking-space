import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget{

 void showToastWidget(String message, Color colors){

   Fluttertoast.showToast(
       msg: message,
       toastLength: Toast.LENGTH_LONG,
       gravity: ToastGravity.SNACKBAR,
       timeInSecForIosWeb: 1,
       backgroundColor: colors,
       textColor: Colors.black,
       fontSize: 16.0,
   );
}
}