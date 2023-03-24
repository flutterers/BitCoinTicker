import '../components/coin_card.dart';
import 'coin.dart';

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

class CoinsManager {
  List<Coin> coins = [];

  List<CoinCard> initCoins(initialCurrency) {
    coins = [];
    List<CoinCard> coinCards = [];

    for (String coin in cryptoList) {
      coins.add(Coin(coinName: coin));
      coinCards.add(
        CoinCard(
          coinName: coin,
          selectedCurrency: initialCurrency,
          coinData: "?",
        ),
      );
    }

    return coinCards;
  }

  Future<Map<String, String>> getCoinsExchangeRates(selectedCurrency) async {
    Map<String, String> coinNameExchangeRateMap = {};
    String coinExchangeRate;
    for (Coin coin in coins) {
      coinExchangeRate = await coin.getExchangeRate(selectedCurrency);
      coinNameExchangeRateMap[coin.coinName] = coinExchangeRate;
      print(coinExchangeRate);
    }
    return coinNameExchangeRateMap;
  }
}
