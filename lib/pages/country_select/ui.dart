import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/commons/offline_data/countries.dart';
import 'package:task/commons/widgets/back_button.dart';
import 'package:task/commons/widgets/search_field.dart';

import 'logic.dart';

class CountrySelectRoot extends StatelessWidget {
  static const route = 'country_select';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CountrySelectLogic(),
      child: CounterSelectUi(),
    );
  }
}

class CounterSelectUi extends StatelessWidget {
  static final countries = OfflineData.countries;
  @override
  Widget build(BuildContext context) {
    CountrySelectLogic logic = Provider.of(context);
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
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: countries.length,
          itemBuilder: (_, int index) => ListTile(
            onTap: () => logic.selectCountry(context, index),
            title: Text(countries[index].name),
            leading: Image.asset(
              countries[index].flag,
              width: 50.w,
              height: 30.h,
            ),
          ),
        ),
      ),
    );
  }
}
