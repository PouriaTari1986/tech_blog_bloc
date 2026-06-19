class AuthEntity {
  final bool? response;
  final String? userId;
  final String? token;
  final String? message;

  const AuthEntity({
    this.response,
    this.userId,
    this.token,
    this.message,
  });
}