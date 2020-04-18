import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:badiup/colors.dart';

class CustomColor {
  final String name;
  final String hex;
  final String label;
  final String textColor;
  final DocumentReference reference;

  CustomColor({
    this.name,
    this.hex,
    this.label,
    this.textColor,
    this.reference,
  });

  CustomColor.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['hex'] != null),
        assert(map['label'] != null),
        assert(map['textColor'] != null),
        name = map['name'].trim(), // make sure to remove misterious space
        hex = map['hex'].trim(),
        label = map['label'].trim(),
        textColor = map['textColor'].trim();

  CustomColor.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'hex': hex,
      'label': label,
      'textColor': textColor,
    };
  }

  String get getName {
    return this.name;
  }

  String get getLabel {
    return this.label;
  }

  String get getHex {
    return this.hex;
  }

  String get getTextColor {
    return this.textColor;
  }

  @override
  String toString() => "CustomColor<$name:$hex:$label:$textColor>";
}

class CustomColorList {
  final List<CustomColor> customColorList;
  Map<String, CustomColor> customColorMap = {};
  Map<String, Color> textColorMap = {
    "grey": paletteGreyColor2,
    "white": kPaletteWhite
  };

  CustomColorList({
    this.customColorList,
  });

  Map<String, CustomColor> getCustomColorMap() {
    this.customColorList.forEach((color) => customColorMap[color.name] = color);

    return customColorMap;
  }

  String getDisplayTextForItemColor(String colorName) {
    return customColorMap[colorName] == null
        ? ""
        : customColorMap[colorName].label;
  }

  Color getDisplayColorForItemColor(String colorName) {
    return customColorMap[colorName] == null
        ? Colors.transparent
        : getColorWithHex(customColorMap[colorName].hex);
  }

  Color getDisplayTextColorForItemColor(String colorName) {
    return customColorMap[colorName] == null
        ? paletteGreyColor2
        : textColorMap[customColorMap[colorName].textColor];
  }
}
