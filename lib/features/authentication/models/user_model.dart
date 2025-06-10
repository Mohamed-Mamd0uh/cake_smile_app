import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
   String email;
   String userName;
   String firstName;
   String lastName;
   String phoneNumber;
   String profilePicture;

  UserModel({
    required this.id,
    required this.email,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
  });
// Helper function to get the full name.
  String get fullName => '$firstName $lastName';

// Helper function to format phone number.
// String get formattedPhoneNo => mFormatter.formatPhoneNumber(phoneNumber);

// Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(" ");

// Static function to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername =
        "$firstName$lastName"; // Combine first and last name
    String usernameWithPrefix = camelCaseUsername; // Add "cwt_" prefix
    return usernameWithPrefix;
  }

  /// Static function to create an empty user model.
  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      userName: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  Map<String, dynamic> toMap() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture
    };
  }

//======//
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> docs) {
    if (docs.data() != null) {
      final data = docs.data();
      return UserModel(
          id: docs.id,
          email: data!['Email'] ?? '',
          firstName: data['FirstName'] ?? '',
          lastName: data['LastName'] ?? '',
          userName: data['UserName'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '');
    } else {
      return UserModel.empty();
    }
  }
}
