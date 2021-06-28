import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'keys.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  CoinData({
    this.currency,
  });

  final String currency;

  Future getCoinData() async {
    Uri url = Uri.https(
      'rest.coinapi.io',
      'v1/exchangerate/BTC/USD',
      {
        'apikey': kApiKey,
      },
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return convert.jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
