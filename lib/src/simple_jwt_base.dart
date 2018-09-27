import 'dart:convert';
import 'package:crypto/crypto.dart';

class JWT {
  /// Generates a new token.
  ///
  /// - [payload]: the payload.
  /// - [key]: The key to sign the payload.
  static String generate(Map<String, Object> payload, String key,
      [String secret = ""]) {
    final Map<String, String> header = {"alg": "HS256", "typ": "JWT"};
    final headerData = utf8.encode(json.encode(header));
    final payloadData = utf8.encode(json.encode(payload));

    String signature = () {
      final bytes = utf8.encode(base64UrlEncode(headerData) +
          "." +
          base64UrlEncode(payloadData) +
          "." +
          secret);
      final hmacSha256 = new Hmac(sha256, utf8.encode(key)); // HMAC-SHA256
      final digest = hmacSha256.convert(bytes);
      return base64.encode(digest.bytes);
    }();

    return base64.encode(headerData) +
        "." +
        base64.encode(payloadData) +
        "." +
        signature;
  }
}
