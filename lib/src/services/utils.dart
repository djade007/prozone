import 'package:prozone/src/init.dart';
import 'package:intl/intl.dart';

class Utils {
  static String formatPrice(double price) {
    return NumberFormat().format(price);
  }

  static ShapeBorder shapeBorder() {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));
  }

  static InputDecoration decoration(
    String label, {
    String hint,
    Widget prefix,
    Widget prefixWidget,
    Widget suffix,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide:
            BorderSide(color: orange_color, width: 2, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: prefix,
      prefix: prefixWidget,
      suffixIcon: suffix,
    );
  }

  static Text dropdownHint(String hint) => Styles.greyText(hint);

  static void error(message) {
    Get.snackbar(
      null,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  static void success(message) {
    Get.snackbar(
      null,
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}
