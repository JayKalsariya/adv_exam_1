import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_exam/model/user_model.dart';
import 'package:firebase_exam/services/auth_service.dart';
import 'package:logger/logger.dart';

class FireStoreServices {
  FireStoreServices._();

  static final FireStoreServices instance = FireStoreServices._();

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  //Collection
  String userPath = "users";

  late UserModel currentUser;

  //Add User
  Future<void> addUser({required User user}) async {
    Map<String, dynamic> data = {
      'uid': user.uid,
      'email': user.email ?? "demo@mail",
      'displayName': user.displayName ?? user.email!.split('@')[0],
      'phoneNumber': user.phoneNumber ?? "no number",
      'photoURL': user.photoURL ??
          "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
    };

    await fireStore.collection(userPath).doc(user.displayName).set(data);
  }

  //Get User
  Future<void> getUser() async {
    DocumentSnapshot snap = await fireStore
        .collection(userPath)
        .doc(AuthServices.instance.auth.currentUser?.uid)
        .get();

    Logger().i(snap.data());
    currentUser = UserModel.fromMap(snap.data() as Map);

    Logger().i(currentUser.uid);
  }
}
