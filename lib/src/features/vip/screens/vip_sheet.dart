import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

import '../../../core/utils.dart';

class VipSheet extends StatelessWidget {
  const VipSheet({super.key, this.offering});

  final Offering? offering;

  @override
  Widget build(BuildContext context) {
    return PaywallView(
      // displayCloseButton: true,
      offering: offering,
      onDismiss: () {
        context.pop();
        logger('DISMISS');
      },
      onPurchaseCompleted: (customerInfo, storeTransaction) {
        logger('COMPLETED');
      },
      onPurchaseCancelled: () {
        logger('CANCEL');
      },
      onPurchaseError: (e) {
        logger('PURCHASE ERROR');
        logger(e.message);
      },
      onPurchaseStarted: (rcPackage) {
        logger('PURCHASE STARTED');
        logger(rcPackage.storeProduct.subscriptionPeriod.toString());
      },
      onRestoreCompleted: (customerInfo) {
        logger('RESTORE COMPLETED');
      },
      onRestoreError: (e) {
        logger('RESTORE ERROR');
        logger(e.message);
      },
    );
  }
}
