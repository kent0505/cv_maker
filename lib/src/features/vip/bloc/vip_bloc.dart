import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../core/utils.dart';

part 'vip_event.dart';

class VipBloc extends Bloc<VipEvent, bool> {
  VipBloc() : super(false) {
    on<VipEvent>(
      (event, emit) => switch (event) {
        CheckVip() => _checkVip(event, emit),
      },
    );
  }

  _checkVip(CheckVip event, Emitter<bool> emit) async {
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();
    logger(customerInfo.entitlements);
    try {
      CustomerInfo customerInfo = await Purchases.getCustomerInfo();
      bool isVip = customerInfo.entitlements.active.containsKey('vip_access');
      logger(customerInfo.entitlements.all);
      emit(isVip);
    } catch (e) {
      logger(e);
      emit(false);
    }
  }
}
