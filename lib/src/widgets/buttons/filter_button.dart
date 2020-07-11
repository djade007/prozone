import 'package:flutter_svg/flutter_svg.dart';
import 'package:prozone/src/init.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;

  const FilterButton({
    Key key,
    @required this.title,
    this.icon,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 5,
      color: white_color,
      textColor: grey_color,
      child: icon == null
          ? Text(title)
          : Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 2),
                    child: SvgPicture.asset('assets/svg/button/$icon.svg'),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(title),
                ),
              ],
            ),
      onPressed: onPressed,
    );
  }
}
