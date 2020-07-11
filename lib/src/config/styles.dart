import '../init.dart';

class Styles {
  static Text greyText(String text, {double fontSize = 14, bool bold: false}) =>
      Text(text,
          style: TextStyle(
            color: grey_color,
            fontSize: fontSize,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ));

  static Text whiteText(String text, {double fontSize = 14}) => Text(text,
      style: TextStyle(
        color: white_color,
        fontSize: fontSize,
      ));

  static Text greyDarkText(String text, {double fontSize = 14}) => Text(text,
      style: TextStyle(
        color: text_grey_color,
        fontSize: fontSize,
      ));

  static Text orangeText(String text,
          {double fontSize = 14, bool bold: false}) =>
      Text(
        text,
        style: TextStyle(
          color: orange_color,
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
        overflow: TextOverflow.ellipsis,
      );

  static Text titleText(
    String text, {
    double fontSize = 19,
    Color color = text_blue_color,
  }) =>
      Text(text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ));
}
