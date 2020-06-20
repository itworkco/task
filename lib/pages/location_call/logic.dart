import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:geolocator/geolocator.dart';
import 'package:task/commons/models/country.dart';
import 'package:task/commons/offline_data/countries.dart';
import 'package:task/commons/widgets/helpers.dart';
import 'package:task/main.dart';
import 'package:task/pages/location_call/widgets/police_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationCallLogic extends ChangeNotifier {
  double bottomSheetHeight = 102;
  LocationCallLogic() {
    KeyboardVisibility.onChange.listen((show) {
      if (show) {
        collapseOtherNumbers();
      } else {
        expandOtherNumbers();
      }
      notifyListeners();
    });

  }
  double alertSize = 200;
  double endRadiusGlow = 115;
  String policeNumber;
  double fabPadding = 0;
  ScrollController scrollController = ScrollController();
  CountryModel mycountry;
  set setMyCountry(CountryModel countryModel) {
    this.mycountry = countryModel;
    notifyListeners();
  }

  void onVerticalDragUpdate(DragUpdateDetails dragUpdateDetails) {
    if (bottomSheetHeight <= 103 && dragUpdateDetails.primaryDelta >= 0 ||
        bottomSheetHeight >= 420 && dragUpdateDetails.primaryDelta <= 0) {
      return;
    }
    var primaryDelte = dragUpdateDetails.primaryDelta;
    bottomSheetHeight -= primaryDelte;
    alertSize += primaryDelte / 4;
    endRadiusGlow += primaryDelte / 8;
    fabPadding += bottomSheetHeight - 102;

    notifyListeners();
  }

  void onVerticalDragEnd(DragEndDetails dragEndDetails) {
    {
      if (bottomSheetHeight >= 240) {
        expandOtherNumbers();
      } else {
        collapseOtherNumbers();
      }
      if (dragEndDetails.velocity.pixelsPerSecond.distance > 700) {
        if (dragEndDetails.velocity.pixelsPerSecond.direction > 0) {
          collapseOtherNumbers();
        } else {
          expandOtherNumbers();
        }
      }
      notifyListeners();
    }
  }

  Future<void> callNumber(String telephone) async {
    var callRequest = 'tel:$telephone';
    if (await canLaunch(callRequest)) {
      await launch(callRequest);
    } else {}
  }

  CountryModel getMyCountry(String myCountryIsoCode) {
    var countries = OfflineData.countries;

    return countries.elementAt(countries
        .indexWhere((element) => element.isoCountryCode == myCountryIsoCode));
  }

  Future<void> getMyAddress(BuildContext context) async {
    var geoLocator = Geolocator();
    var helpers = Helpers(context);
    helpers.surroundThisBlockByProgressDialog(() async {
      var myAddress = await geoLocator
          .placemarkFromPosition(await geoLocator.getCurrentPosition());
      var myCountryIsoCode = myAddress.first.isoCountryCode;

      setMyCountry = (getMyCountry(myCountryIsoCode));
    });
  }

  String get countryIsoCode {}

  void expandOtherNumbers() {
    this.bottomSheetHeight = 420;
    this.alertSize = 111;
  }

  void collapseOtherNumbers() {
    this.bottomSheetHeight = 102;
    this.alertSize = 200;
  }

  void showPoliceConfirmDialog(String number) {
    this.policeNumber = number;
    showDialog(context: globalContext, builder: (_) => PoliceDialog());
  }
}
