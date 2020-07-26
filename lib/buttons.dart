import 'package:flutter/material.dart';

class ButtonWithIcons extends StatelessWidget {
  final Icon leadingIcon;
  final String label;
  final Icon trailingIcon;
  final Color backGroundColor;
  final Color foreGroundColor;
  final Function onPressed;

  const ButtonWithIcons({
    Key key,
    this.leadingIcon,
    @required this.label,
    @required this.backGroundColor,
    @required this.foreGroundColor,
    this.trailingIcon,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: backGroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          leadingIcon != null ? leadingIcon : SizedBox(),
          SizedBox(
            width: leadingIcon != null ? 4.0 : 0.0,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              color: foreGroundColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: trailingIcon != null ? 4.0 : 0.0,
          ),
          trailingIcon != null ? trailingIcon : SizedBox(),
        ],
      ),
      onPressed: onPressed,
    );
  }
}

class ButtonWithChild extends StatelessWidget {
  final Widget child;
  final Color backGroundColor;
  final Function onPressed;

  const ButtonWithChild({
    Key key,
    @required this.child,
    @required this.backGroundColor,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
      onPressed: onPressed,
    );
  }
}
