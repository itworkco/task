import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/pages/country_select/logic.dart';

class CountrySelectList extends StatelessWidget {
  List list;
  CountrySelectList(this.list);
  @override
  Widget build(BuildContext context) {
    CountrySelectLogic logic = Provider.of(context);
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (_, int index) => ListTile(
        onTap: () => logic.selectCountry(context, index),
        title: Text(list[index].name),
        leading: Image.asset(
          list[index].flag,
          width: 50.w,
          height: 30.h,
        ),
      ),
    );
  }
}
