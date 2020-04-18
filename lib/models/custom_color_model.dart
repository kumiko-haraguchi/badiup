import 'package:cloud_firestore/cloud_firestore.dart';

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
        name = map['name'],
        hex = map['hex'],
        label = map['label'],
        textColor = map['textColor'];

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

  @override
  String toString() => "CustomColor<$name:$hex:$label:$textColor>";
}
