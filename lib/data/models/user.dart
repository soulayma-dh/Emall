import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String profilePicture;
  DateTime? createdAt;
  DateTime? updatedAt;
  String deviceToken;

  /// Constructor for UserModel.
  UserModel({
    required this.id,
    required this.email,
    this.firstName = '',
    this.lastName = '',
    this.phoneNumber = '',
    this.profilePicture = '',
    this.createdAt,
    this.updatedAt,
    this.deviceToken = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'deviceToken': deviceToken,
      'createdAt': createdAt,
      'updatedAt': updatedAt = DateTime.now(),
    };
  }

  /// Factory method to create a UserModel from a Firebase document snapshot.
  factory UserModel.fromJson(String id, Map<String, dynamic> data) {
    return UserModel(
      id: id,
      firstName: data.containsKey('firstName') ? data['firstName'] ?? '' : '',
      lastName: data.containsKey('lastName') ? data['lastName'] ?? '' : '',
      email: data.containsKey('email') ? data['email'] ?? '' : '',
      phoneNumber:
          data.containsKey('phoneNumber') ? data['phoneNumber'] ?? '' : '',
      profilePicture: data.containsKey('profilePicture')
          ? data['profilePicture'] ?? ''
          : '',
      createdAt: data.containsKey('createdAt')
          ? data['createdAt']?.toDate() ?? DateTime.now()
          : DateTime.now(),
      updatedAt: data.containsKey('updatedAt')
          ? data['updatedAt']?.toDate() ?? DateTime.now()
          : DateTime.now(),
      deviceToken:
          data.containsKey('deviceToken') ? data['deviceToken'] ?? '' : '',
    );
  }
  
  // Factory method to create UserModel from Firestore document snapshot
  factory UserModel.fromDocSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return UserModel.fromJson(doc.id, data);
  }

  //Static Method to create an empty user 
  static UserModel empty() =>
      UserModel(id: '', email: ''); 

}
