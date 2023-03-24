import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../services/coins_manager.dart';

Widget iOSPicker(onSelectedItemChangedfn) {
  List<Text> lst = [];
  for (String currency in currenciesList) {
    lst.add(Text(currency));
  }

  return CupertinoPicker(
    itemExtent: 50,
    useMagnifier: true,
    backgroundColor: Colors.lightBlueAccent,
    onSelectedItemChanged: onSelectedItemChangedfn,
    children: lst,
  );
}

Widget androidDropDown(onChangedfn, {required String initialValue}) {
  List<DropdownMenuItem<String>> lst = [];
  for (String currency in currenciesList) {
    lst.add(
      DropdownMenuItem(
        value: currency,
        child: Text(currency),
      ),
    );
  }

  return DropdownButton<String>(
    value: initialValue,
    items: lst,
    onChanged: onChangedfn,
    style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
  );
}
