// services/quote_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/quote.dart';

class QuoteService {
  final String url = 'https://type.fit/api/quotes';

  Future<Quote> fetchRandomQuote() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> quotes = json.decode(response.body);
      final randomIndex = (quotes.length * (DateTime.now().millisecondsSinceEpoch % 1000 / 1000)).floor();
      return Quote.fromJson(quotes[randomIndex]);
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}
