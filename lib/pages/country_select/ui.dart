import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/commons/offline_data/countries.dart';
import 'package:task/commons/widgets/back_button.dart';
import 'package:task/commons/widgets/search_field/logic.dart';
import 'package:task/commons/widgets/search_field/ui.dart';

import 'logic.dart';

class CountrySelectRoot extends StatelessWidget {
  static const route = 'country_select';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: CounterSelectUi(),
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => CountrySelectLogic(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => SearchFieldLogic(),
        ),
      ],
    );
  }
}

class CounterSelectUi extends StatelessWidget {
  static final countries = OfflineData.countries;
  @override
  Widget build(BuildContext context) {
    CountrySelectLogic logic = Provider.of(context);
    SearchFieldLogic searchFieldLogic = Provider.of(context);

    return Scaffold(
      appBar: PreferredSize(
          child: SizedBox.fromSize(
            size: Size.fromHeight(120),
            child: Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: Row(
                children: <Widget>[
                  MyBackButton(),
                  Expanded(flex: 30, child: SearchField()),
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(120.h)),
      body: Directionality(
          textDirection: TextDirection.rtl, child: searchFieldLogic.body),
    );
  }
}
