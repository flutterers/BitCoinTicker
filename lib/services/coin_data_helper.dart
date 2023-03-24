import 'package:bitcoin_ticker/utilities/constants.dart';

import 'coins_manager.dart';
import 'networking.dart';

class CoinDataHelper {
  Future getCoinExchangeDate(String currency, String coin) async {
    var queryParameters = {
      'apikey': kAPIKey,
    };
    dynamic coinData =
        await _sendRequestGetResponse(queryParameters, coin, currency);
    return coinData;
  }

  Future _sendRequestGetResponse(queryParameters, coin, currency) async {
    /// from documentation --> Request url Should look like this:
    /// https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    var url = Uri.https(
      'rest.coinapi.io',
      '/v1/exchangerate/$coin/$currency',
      queryParameters,
    );
    print(url);
    var weatherDecodedJsonData = await NetworkHelper().getHttpResponse(url);
    return weatherDecodedJsonData;
  }
}
