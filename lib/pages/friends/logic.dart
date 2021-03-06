import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task/main.dart';
import 'package:task/pages/friends/dialogs/add_friend/add_friend.dart';
import 'package:task/pretend_api.dart';

import 'dialogs/delete_friend.dart';

class FriendsLogic extends ChangeNotifier {
  int deletedIndex;
  ImageSource imageSource;
  String selectedImagePath;
  set setImageSource(ImageSource imageSource) => this.imageSource = imageSource;

  void confirmDelete() {
    PretendApi.friends.removeAt(deletedIndex);
    Navigator.pop(globalContext);
    notifyListeners();
  }

  void onRecoreder(int oldIndex, int newIndex) {
    var oldIndexElement = PretendApi.friends[oldIndex];
    var newIndexElement = PretendApi.friends[newIndex];
    PretendApi.friends[oldIndex] = newIndexElement;
    PretendApi.friends[newIndex] = oldIndexElement;
    notifyListeners();
  }

  void deleteFriend(int index) {
    this.deletedIndex = index;

    showDialog(
        context: globalContext,
        builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(19))),
              child: DeleteFriendDialog(),
            ));
  }

  void showThisDialog() {}
  void addFriend() {
    showDialog(
        context: globalContext,
        builder: (_) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(19))),
              child: AddFriendDialog(),
            ));
  }

  Future<void> pickImagePath(ImageSource imageSource) async {
    Navigator.pop(globalContext);
    var image = await ImagePicker().getImage(
        source: imageSource, preferredCameraDevice: CameraDevice.rear);
    this.selectedImagePath = image.path;
    notifyListeners();
  }
}
