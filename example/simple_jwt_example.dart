import 'package:simple_jwt/simple_jwt.dart';

main() {
  var payload = {"sub": "1234567890", "name": "John Doe", "iat": 1516239022};
  var key = "key";
  var jwt = JWT.generate(payload, key, "");
  print(jwt);
}
