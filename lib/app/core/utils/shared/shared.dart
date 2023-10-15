class Shared {
  Shared._();
  static final _instance = Shared._();

  factory Shared() => _instance;

  String accessToken = "";
  String refreshToken = "";

  final String routingKey =
      '5b3ce3597851110001cf62480384c1db92764d1b8959761ea2510ac8';
}
