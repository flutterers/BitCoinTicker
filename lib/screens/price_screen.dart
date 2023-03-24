import 'package:bitcoin_ticker/services/coins_manager.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import '../components/coin_card.dart';
import '../components/dropdown_picker.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinsManager mngr = CoinsManager();
  List<CoinCard> coinCards = [];
  String _selectedCurrency = currenciesList[0];
  Map<String, String> coinsExs = {};

  List<CoinCard> getCoinsCards(selectedCurrency) {
    if (coinsExs.isEmpty) {
      return mngr.initCoins(selectedCurrency);
    }
    List<CoinCard> coinCards = [];
    coinsExs.forEach((coin, exRate) {
      coinCards.add(CoinCard(
          coinName: coin,
          selectedCurrency: selectedCurrency,
          coinData: exRate));
    });
    return coinCards;
  }

  @override
  void initState() {
    coinCards = mngr.initCoins(_selectedCurrency);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    iOsPickerOnChanged(selectedIndex) async {
      setState(() {
        coinCards = mngr.initCoins(_selectedCurrency);
      });
      coinsExs = await mngr.getCoinsExchangeRates(_selectedCurrency);
      setState(() {
        coinCards = getCoinsCards(_selectedCurrency);
      });
    }

    androidDropDownOnChanged(value) async {
      setState(() {
        _selectedCurrency = value;
        coinCards = mngr.initCoins(_selectedCurrency);
      });
      coinsExs = await mngr.getCoinsExchangeRates(_selectedCurrency);
      setState(() {
        coinCards = getCoinsCards(_selectedCurrency);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: coinCards,
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlueAccent,
            child: Center(
              child: Platform.isIOS
                  ? iOSPicker(iOsPickerOnChanged)
                  : androidDropDown(androidDropDownOnChanged,
                      initialValue: _selectedCurrency),
            ),
          ),
        ],
      ),
    );
  }
}
