import "package:http/http.dart" as http;

abstract class NetworkInfo {
  Future<bool> get hasConnection;
}

class NetworkInfoImpl implements NetworkInfo {
  http.Client client;

  NetworkInfoImpl({required this.client});

  @override
  Future<bool> get hasConnection async {
    List<String> testUrls = [
      'https://clients3.google.com/generate_204', // Google
      'https://cloudflare.com/cdn-cgi/trace', // Cloudflare
      'https://www.opendns.com/' // OpenDNS (Cisco)
    ];

    for (String url in testUrls) {
      try {
        final response = await client.get(Uri.parse(url)).timeout(Duration(seconds: 3));
        if (response.statusCode == 204 || response.statusCode == 200) {
          return true;
        }
      } catch (_) {
        continue;
      }
    }
    return false;
  }
}
