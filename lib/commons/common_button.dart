import 'package:flutter/material.dart';
import 'package:flutter_lala_kids/global/app_themes.dart';

enum ButtonType {
  normal,
  confirm,
  text,
}

class CommonButtons extends StatelessWidget {
  final ButtonType type;
  final Function onPress;
  final String title;
  final bool isDisabled;
  const CommonButtons({
    Key? key,
    this.type = ButtonType.normal,
    required this.onPress,
    required this.title,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function() onPressedFunction = isDisabled
        ? () {}
        : () {
            onPress();
          };
    switch (type) {
      case (ButtonType.confirm):
        return OutlinedButton(
          onPressed: onPressedFunction,
          style: isDisabled
              ? OutlinedButton.styleFrom(backgroundColor: AppThemes.aquaDisabledColor)
              : Theme.of(context).outlinedButtonTheme.style,
          child: Text(
            title,
            style: isDisabled ? TextStyle(color: AppThemes.aquaColor) : const TextStyle(),
          ),
        );
      case (ButtonType.text):
        return TextButton(
          onPressed: onPressedFunction,
          child: Text(
            title,
            style: isDisabled
                ? TextStyle(color: AppThemes.lightTextDisabledColor)
                : TextStyle(color: AppThemes.lightTextColor),
          ),
        );
      case (ButtonType.normal):
      default:
        return ElevatedButton(
          onPressed: onPressedFunction,
          style: isDisabled
              ? ElevatedButton.styleFrom(primary: AppThemes.primaryDisabledColor)
              : Theme.of(context).elevatedButtonTheme.style,
          child: Text(title),
        );
    }
  }
}
