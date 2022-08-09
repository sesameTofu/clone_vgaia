class LoginPrams {
  LoginPrams({
    required this.username,
    required this.password,
    required this.captcha,
    String? lang,
    String? srcChannel,
  }) {
    this.lang = lang ?? '';
    this.srcChannel = srcChannel ?? '5';
  }

  String username;
  String password;
  String? lang;
  String captcha;
  String? srcChannel;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': username,
        'password': password,
        'lang': lang,
        'srcChannel': srcChannel,
        'captcha': captcha,
      };
}
