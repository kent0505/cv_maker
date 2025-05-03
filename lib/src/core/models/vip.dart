import 'package:purchases_flutter/purchases_flutter.dart';

class Vip {
  Vip({
    this.isVip = false,
    this.hasInternet = false,
    this.offering,
  });

  final bool isVip;
  final bool hasInternet;
  final Offering? offering;
}
