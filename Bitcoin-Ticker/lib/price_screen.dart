import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bitcoin_data.dart';
import 'coin_tracker.dart';
import 'consts.dart';

class BitCoinScreen extends StatefulWidget {
  const BitCoinScreen({super.key});

  @override
  State<BitCoinScreen> createState() => _BitCoinScreenState();
}

class _BitCoinScreenState extends State<BitCoinScreen> {
  String selectedCurrency = 'AUD';
  bool _isLoading = false;
  Map<String, String> trackerResult = {};

  @override
  void initState() {
    super.initState();

    loadBtcTracker();
  }

  loadBtcTracker() async {
    _isLoading = true;

    try {
      trackerResult = await CoinData().loadBtcTracker(selectedCurrency);
    } catch (error) {
      throw ('Error $error');
    }

    setState(() {
      _isLoading = false;

      makeCard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BitCoin Tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _isLoading
              ? Center(
                  child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).height / 3),
                  child: const CircularProgressIndicator(),
                ))
              : makeCard(),
          Container(
              height: 150,
              padding: const EdgeInsets.only(bottom: 30),
              alignment: Alignment.center,
              decoration: kBottomBoxDecoration,
              child: Platform.isIOS ? iosPicker() : androidDropDown())
        ],
      ),
    );
  }

  CupertinoPicker iosPicker() {
    List<Text> pickerText = [];
    for (String currency in currenciesList) {
      pickerText.add(
        Text(
          currency,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
      );
    }
    return CupertinoPicker(
        selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
          background: Colors.white54,
        ),
        itemExtent: 28.0,
        backgroundColor: Colors.purple.shade400,
        onSelectedItemChanged: (index) {
          setState(() {
            selectedCurrency = currenciesList[index];
            loadBtcTracker();
          });
        },
        children: pickerText);
  }

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      dropDownItems.add(
        DropdownMenuItem(
          value: currency,
          child: Text(
            currency,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    }
    return DropdownButton(
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value.toString();
          loadBtcTracker();
        });
      },
      value: selectedCurrency,
    );
  }

  Column makeCard() {
    List<CoinTracker> coinTrackers = [];

    for (String crypto in cryptoList) {
      coinTrackers.add(CoinTracker(
          assetBase: crypto,
          rate: _isLoading ? '?' : trackerResult[crypto].toString(),
          assetQuote: selectedCurrency));
    }
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, children: coinTrackers);
  }
}
