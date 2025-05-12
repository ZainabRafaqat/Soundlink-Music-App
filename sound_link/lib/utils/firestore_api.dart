import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreAPI with ChangeNotifier {
  late FirebaseFirestore _instance;

  FirestoreAPI.instance() {
    _instance = FirebaseFirestore.instance;
  }

  Stream<QuerySnapshot> get getAllVideos => _instance
      .collection('Path of your firestore here')
      .orderBy('createdAt', descending: true)
      .snapshots();

  Future<DocumentSnapshot> getVideoDetails(String videoId) =>
      _instance.collection('Path of your firestore here').doc(videoId).get();

  Future changeProfilePicture(String newPath, String userId) {
    _instance.collection('Path to profile picture here').doc(userId).update({
      'profilePicture': newPath,
    });
    notifyListeners();
    return Future.delayed(const Duration(milliseconds: 2));
  }
}
