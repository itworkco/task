import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task/pages/location_call/widgets/other_numbers_sheet/widgets/empty_search_result.dart';
import 'package:task/pages/location_call/widgets/other_numbers_sheet/widgets/un_empty_search_result.dart';
import 'package:task/pretend_api.dart';

typedef Widget Test(List list);

class SearchFieldLogic extends ChangeNotifier {
  Widget suffix;
  TextEditingController searchFieldController;
  List<Map<String, dynamic>> searchResult = [];
  Widget body;
  Widget listItems;
  void onChangedSearch(
    String input,
    List<Map<String, dynamic>> list,
  ) {
    if (input.length == 0) {
      body = UnEmptySearchResult(PretendApi.numbers);
      suffixIconToSearchMode();
    } else {
      suffixIconToClearMode();
      searchResult = [];

      for (var element in list) {
        if (element['name'].contains(input)) {
          searchResult.add(element);
        }
      }

      if (searchResult.isEmpty) {
        this.body = EmptySearchResult();
      } else {
        this.body = UnEmptySearchResult(searchResult);
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

  void onTapClear() {
    searchFieldController.clear();
    this.body = UnEmptySearchResult(PretendApi.numbers);
    notifyListeners();
  }
}
