import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Icon _icon;
  final VoidCallback _onPressed;
  final String _text;

  SecondaryButton({
    Key key,
    Icon icon,
    String text,
    VoidCallback onPressed,
  })  : _icon = icon,
        _text = text,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderSide = BorderSide(color: Theme.of(context).primaryColor,);
    final color = Theme.of(context).primaryColor;
    final label = Text(
      _text.toUpperCase(),
      style: theme.textTheme.button.copyWith(color: theme.primaryColor),
    );
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    );


    return (_icon != null)
        ? OutlineButton.icon(
            borderSide: borderSide,
            icon: _icon,
            shape: shape,
            onPressed: _onPressed,
            label: label,
            color: color)
        : OutlineButton(
            borderSide: borderSide,
            shape: shape,
            onPressed: _onPressed,
            child: label,
            color: color,
          );
  }
}