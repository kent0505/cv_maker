import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/dialog_widget.dart';

class VipSheet extends StatelessWidget {
  const VipSheet({super.key, this.offering});

  final Offering? offering;

  @override
  Widget build(BuildContext context) {
    void showInfo(String title, String description) {
      DialogWidget.show(
        context,
        title: title,
        description: description,
        info: true,
        onYes: () {},
      );
    }

    return PaywallView(
      // displayCloseButton: true,
      offering: offering,
      onDismiss: () {
        context.pop();
        showInfo('DISMISS', '');
      },
      onPurchaseCompleted: (customerInfo, storeTransaction) {
        showInfo(
          'COMPLETED',
          customerInfo.entitlements.active.toString(),
        );
      },
      onPurchaseCancelled: () {
        showInfo('CANCEL', '');
      },
      onPurchaseError: (e) {
        showInfo(
          'PURCHASE ERROR',
          e.message,
        );
      },
      onPurchaseStarted: (rcPackage) {
        logger('PURCHASE STARTED');
        logger(rcPackage.storeProduct.subscriptionPeriod.toString());
      },
      onRestoreCompleted: (customerInfo) {
        showInfo(
          'RESTORE COMPLETED',
          customerInfo.entitlements.active.toString(),
        );
      },
      onRestoreError: (e) {
        showInfo(
          'RESTORE ERROR',
          e.message,
        );
      },
    );
  }
}
