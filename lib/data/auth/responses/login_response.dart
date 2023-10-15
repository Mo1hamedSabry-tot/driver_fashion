class LoginResponse {
  final String accessToken;
  final String tokenType;
  final int? expiresIn;

  LoginResponse(
      {required this.accessToken, required this.tokenType, this.expiresIn});

  factory LoginResponse.fromJson({required Map<String, dynamic> json}) {
    return LoginResponse(
      accessToken: json["access_token"],
      tokenType: json["token_type"],
      expiresIn: json["expires_in"],
    );
  }
}
