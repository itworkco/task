import 'package:flutter/material.dart';
import 'package:task/commons/screen_converter.dart';

class EmptySearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      print(constraints.maxHeight);
      return ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Icon(
                    Icons.search,
                    size: ScreenConverter.aspectRatioConverter(60),
                  ),
                  Text(
                    'للأسف لا توجد نتائج لهذا البحث',
                    textAlign: TextAlign.center,
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
