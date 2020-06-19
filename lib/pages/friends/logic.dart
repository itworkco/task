import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task/pages/friends/dialogs/add_friend/add_friend.dart';
import 'package:task/pretend_api.dart';

import 'dialogs/delete_friend.dart';

class FriendsLogic extends ChangeNotifier {
  void onRecoreder(int oldIndex, int newIndex) {
    var oldIndexElement = PretendApi.friends[oldIndex];
    var newIndexElement = PretendApi.friends[newIndex];
    PretendApi.friends[oldIndex] = newIndexElement;
    PretendApi.friends[newIndex] = oldIndexElement;
    notifyListeners();
  }

  void deleteFriend(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(19))),
              child: DeleteFriendDialog(),
            ));
  }

  void showThisDialog() {}
  void addFriend(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(19))),
              child: AddFriendDialog(),
            ));
  }
}
