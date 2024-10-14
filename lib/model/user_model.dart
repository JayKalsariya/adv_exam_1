import 'package:firebase_exam/services/firestore_services.dart';
import 'package:firebase_exam/utils/global.dart';

class UserModel {
  String uid;
  String displayName;
  String email;
  String phoneNumber;
  var photoURL;
  List<UserModel> friends = [];

  UserModel(
      this.uid, this.displayName, this.email, this.phoneNumber, this.photoURL) {
    // coming();
  }

  factory UserModel.fromMap(Map data) => UserModel(
        data['uid'] ?? "0000",
        data['displayName'] ?? "No Name",
        data['email'] ?? "No Email",
        data['phoneNumber'] ?? "No Phone Number",
        data['photoURL'] ??
            "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
      );

  // Future<void> coming() async {
  //   if (uid == FireStoreServices.instance.currentUser.uid) {
  //     friends = await FireStoreServices.instance.getFriends();
  //   }
  // }

  Map<String, dynamic> get toMap => {
        'uid': uid,
        'displayName': Global.nc.text ?? email.split('@')[0],
        'email': email ?? "No Email",
        'phoneNumber': phoneNumber ?? "No Phone Number",
        'photoURL': photoURL ??
            "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
      };
}
