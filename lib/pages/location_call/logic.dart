import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:task/commons/models/country.dart';
import 'package:task/commons/offline_data/countries.dart';
import 'package:task/commons/widgets/helpers.dart';
import 'package:task/main.dart';
import 'package:task/pages/location_call/widgets/other_numbers_sheet/widgets/empty_search_result.dart';
import 'package:task/pages/location_call/widgets/other_numbers_sheet/widgets/un_empty_search_result.dart';
import 'package:task/pages/location_call/widgets/police_dialog.dart';
import 'package:task/pretend_api.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/send_location/ui.dart';

class LocationCallLogic extends ChangeNotifier {
  FocusNode searchFocusNode = FocusNode();
  double bottomSheetHeight = 102;
  var numbersList = PretendApi.numbers;
  Widget suffix;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> searchResult = [];
  Widget numbersSheetBody;
  bool showSearchResultList = false;
  var searchFieldController = TextEditingController();
  void onChangedSearch(String input) {
    if (input.length == 0) {
      numbersSheetBody = UnEmptySearchResult(PretendApi.numbers);
      suffixIconToSearchMode();
    } else {
      suffixIconToClearMode();
      searchResult = [];

      for (var element in numbersList) {
        if (element['name'].contains(input)) {
          searchResult.add(element);
        }
      }

      if (searchResult.isEmpty) {
        numbersSheetBody = EmptySearchResult();
      } else {
        this.numbersSheetBody = UnEmptySearchResult(searchResult);
      }
    }
    notifyListeners();
  }

  void suffixIconToClearMode() {
    suffix = Stack(
      children: <Widget>[
        Icon(Icons.close),
        Positioned.fill(
            child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTapClear,
          ),
        ))
      ],
    );
  }

  void suffixIconToSearchMode() {
    suffix = Icon(
      Icons.search,
    );
  }

  LocationCallLogic() {
    suffixIconToSearchMode();
    numbersSheetBody = UnEmptySearchResult(PretendApi.numbers);
    KeyboardVisibility.onChange.listen((show) {
      if (!show) {
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
    var location = Location.instance;
    if (await Location().hasPermission() == PermissionStatus.granted &&
        await location.serviceEnabled()) {
      var geoLocator = Geolocator();
      var helpers = HelpersWidgets(context);
      helpers.surroundThisBlockByProgressDialog(() async {
        var myAddress = await geoLocator
            .placemarkFromPosition(await geoLocator.getCurrentPosition());
        var myCountryIsoCode = myAddress.first.isoCountryCode;
        setMyCountry = (getMyCountry(myCountryIsoCode));
      });
    } else {
      HelpersWidgets.showSnackBar(scaffoldKey,
          'تأكد من إعطاء الصلاحيات للوصول الي موقعك وايضا تأكد من تفعيل الـ GPS');
    }
  }

  void expandOtherNumbers() {
    this.bottomSheetHeight = 420;
    this.alertSize = 111;
  }

  void collapseOtherNumbers() {
    this.bottomSheetHeight = 102;
    this.alertSize = 200;
    this.searchFocusNode.unfocus();
  }

  void showPoliceConfirmDialog(String number) {
    this.policeNumber = number;
    showDialog(context: globalContext, builder: (_) => PoliceDialog());
  }

  void navigateToSendLocation() =>
      Navigator.of(globalContext).push(PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return SendLocationRoot();
          }));

  void onTapClear() {
    searchFieldController.clear();
    numbersSheetBody = UnEmptySearchResult(PretendApi.numbers);
    notifyListeners();
  }
}
