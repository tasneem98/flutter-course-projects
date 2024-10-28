import 'package:flutter/material.dart';

class CoinTracker extends StatelessWidget {
  const CoinTracker({
    super.key,
    required this.assetBase,
    required this.rate,
    required this.assetQuote,
  });
  final String assetBase;
  final String rate;
  final String assetQuote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 18.0),
      child: Card(
        color: Colors.purple.shade500,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $assetBase = $rate $assetQuote',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
