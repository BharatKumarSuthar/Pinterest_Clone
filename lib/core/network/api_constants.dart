class ApiConstants {
  static const String baseUrl = 'https://api.pexels.com/v1/';

  static const int connectTimeout = 15000;
  static const int receiveTimeout = 15000;

  static const String apiKey =
      'W6XqXpC95mPCLDcWxVSaDWiYCmNFfbbyID30r20wmlod1u3uL7n2kUta';

  //------------------------ Endpoints -------------------
  static String photos(int page, int perPage) =>
      'curated?page=$page&per_page=$perPage';
}
