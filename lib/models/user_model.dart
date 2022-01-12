class User {
  String name;
  String email;
  String photoUrl;
  String token;
  String phoneNo;
  User({
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.token,
    required this.phoneNo,
  });
  
}
class GoogleUser {
  String displayName;
  String email;
  String id;
  String photoUrl;
  GoogleUser({
    required this.displayName,
    required this.email,
    required this.id,
    required this.photoUrl,
  });
  // String phoneNo;
  
}
