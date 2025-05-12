import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  String? id;
  String? name;
  String? subtitle;
  String? email;
  String? phonenumber;
  DateTime? creationTime;
  String? photoUrl;
  bool isSelect;

  AppUser({
    this.id,
    this.name,
    this.subtitle = "",
    this.email,
    this.creationTime,
    this.photoUrl,
    this.isSelect = false,
  });

  // receiving data from server
  factory AppUser.fromMap(map) {
    return AppUser(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      photoUrl: map['photoUrl'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': id,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

  factory AppUser.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> doc, String? uid) {
    return AppUser(
      id: uid,
      name: doc.data()?['name'],
      email: doc.data()?['email'],
      photoUrl: doc.data()?['photoUrl'],
    );
  }
}

AppUser? currentUser_;
