import 'package:flutter/material.dart';
import 'package:badiup/constants.dart' as constants;
import 'package:badiup/colors.dart';
import 'package:badiup/sign_in.dart';

class AdminSettingsListing extends StatefulWidget {
  @override
  _AdminSettingsListingState createState() => _AdminSettingsListingState();
}

class _AdminSettingsListingState extends State<AdminSettingsListing> {
  bool _value = currentSignedInUser.setting.taxInclusive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: ListView(
          children: <Widget>[
            _buildShowTaxSetting(),
          ],
        ),
      ),
    );
  }

  Widget _buildShowTaxSetting() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 50.0,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('消費税込みの価格に設定する'),
            Switch(
              activeColor: Colors.white,
              activeTrackColor: paletteForegroundColor,
              value: _value,
              onChanged: (bool value) {
                _updateShowTaxSetting(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateShowTaxSetting(bool value) async {
    currentSignedInUser.setting.taxInclusive = value;
    await db
        .collection(constants.DBCollections.users)
        .document(currentSignedInUser.email)
        .updateData(currentSignedInUser.toMap());
    setState(() {
      _value = value;
    });
  }
}
