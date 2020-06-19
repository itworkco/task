import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:task/commons/models/country.dart';
import 'package:task/commons/offline_data/countries.dart';
import 'package:task/commons/widgets/helpers.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationCallLogic extends ChangeNotifier {
  double bottomSheetHeight = 78;
  double imageHeight = 180;
  double endRadiusGlow = 100;
  double fabPadding = 0;
  ScrollController scrollController = ScrollController();
  CountryModel mycountry;
  set setMyCountry(CountryModel countryModel) {
    this.mycountry = countryModel;
    notifyListeners();
  }

  void onVerticalDragUpdate(DragUpdateDetails dragUpdateDetails) {
    if (bottomSheetHeight <= 78 && dragUpdateDetails.primaryDelta >= 0 ||
        bottomSheetHeight >= 350 && dragUpdateDetails.primaryDelta <= 0) {
      return;
    }
    var primaryDelte = dragUpdateDetails.primaryDelta;
    bottomSheetHeight -= primaryDelte;
    imageHeight += primaryDelte / 4;
    endRadiusGlow += primaryDelte / 8;
    fabPadding += bottomSheetHeight - 78;

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
    this.bottomSheetHeight = 350;
  }

  void collapseOtherNumbers() {
    this.bottomSheetHeight = 78;
  }
}
