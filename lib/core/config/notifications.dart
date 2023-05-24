import 'package:fluttertoast/fluttertoast.dart' as fluttertoast;

showErrorToast(String message) {
  fluttertoast.Fluttertoast.showToast(
      msg: message,
      toastLength: fluttertoast.Toast.LENGTH_LONG,
      gravity: fluttertoast.ToastGravity.CENTER,
      webBgColor: "linear-gradient(to right, #FF0000, #FF6347)");
}
