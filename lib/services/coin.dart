import 'coin_data_helper.dart';

class Coin {
  late String coinName;
  late double ExchangeRate;
  Coin({required this.coinName});

  Future<String> getExchangeRate(String currency) async {
    var decodedCoinData =
        await CoinDataHelper().getCoinExchangeDate(currency, coinName);
    ExchangeRate = decodedCoinData['rate'];
    print(ExchangeRate);
    return ExchangeRate.toStringAsFixed(2);
  }
}
