import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/pages/location_call/logic.dart';
import 'package:task/pages/location_call/widgets/other_numbers_sheet/widgets/numbers_list.dart';

class UnEmptySearchResult extends StatelessWidget {
  List list;
  UnEmptySearchResult(this.list);
  @override
  Widget build(BuildContext context) {
    LocationCallLogic logic = Provider.of(context, listen: false);

    return NumbersList(list);
  }
}
