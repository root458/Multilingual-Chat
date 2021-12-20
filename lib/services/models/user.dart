class CustomUser {
  final String uid;
  final String? displayName;
  final String email;
  final String? photoUrl;

  CustomUser({
    required this.uid,
    this.displayName,
    required this.email,
    this.photoUrl,
  });

  Map<String, String?> get properties => {
        'uid' : uid,
        'displayName' : displayName,
        'email' : email,
        'photoUrl' : photoUrl
      };
}
