import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/provider_class.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import '../themes.dart';

class ToggleSwitch extends StatelessWidget {
  ToggleSwitch({Key? key}) : super(key: key);
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvideClass>(
      builder: (context, myProvider, child) {
        return FlutterSwitch(
          inactiveIcon: Icon(
            Icons.light_mode_outlined,
            color: Theme.of(context).buttonColor,
          ),
          inactiveColor: Theme.of(context).buttonColor,
          activeIcon: Icon(
            Icons.dark_mode_outlined,
            color: Theme.of(context).buttonColor,
          ),
          activeColor: Theme.of(context).buttonColor,
          toggleColor: MyTheme.creamColor,
          width: 80,
          height: 40.0,
          valueFontSize: 20.0,
          toggleSize: 38.0,
          value: myProvider.isDark,
          padding: 3,
          onToggle: (val) {
            myProvider.toggleState();
          },
        );
      },
    );
  }
}
