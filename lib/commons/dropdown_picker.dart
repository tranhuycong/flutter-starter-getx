import 'package:flutter/material.dart';

class DropdownPicker extends StatelessWidget {
  DropdownPicker({required this.menuOptions, required this.selectedOption, required this.onChanged});

  final List<dynamic> menuOptions;
  final String selectedOption;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        items: menuOptions
            .map((data) => DropdownMenuItem<String>(
                  value: data.key,
                  child: Text(
                    data.value,
                  ),
                ))
            .toList(),
        value: selectedOption,
        onChanged: onChanged);
  }
}
