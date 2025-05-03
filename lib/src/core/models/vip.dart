import 'package:purchases_flutter/purchases_flutter.dart';

class Vip {
  Vip({
    required this.isVip,
    this.offering,
  });

  final bool isVip;
  final Offering? offering;
}
