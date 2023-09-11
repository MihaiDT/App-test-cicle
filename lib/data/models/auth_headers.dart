class AuthHeaders {
  String? accessToken;
  String? client;
  String? tokenType;
  String? uid;

  AuthHeaders({
    this.accessToken,
    this.client,
    this.tokenType,
    this.uid,
  });

  factory AuthHeaders.fromJson(Map<String, dynamic> json) => AuthHeaders(
        accessToken: json['accessToken'],
        client: json['client'],
        tokenType: json['tokenType'],
        uid: json['uid'],
      );

  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
        'client': client,
        'tokenType': tokenType,
        'uid': uid,
      };
}
