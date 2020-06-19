import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/commons/offline_data/countries.dart';
import 'package:task/pages/location_call/logic.dart';

class CountrySelectLogic extends ChangeNotifier {
  void selectCountry(BuildContext context, int index) {
    LocationCallLogic logic = Provider.of(context, listen: false);
    logic.setMyCountry = OfflineData.countries[index];
    Navigator.pop(context);
  }
}
