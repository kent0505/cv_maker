import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../core/models/vip.dart';
export '../../../core/models/vip.dart';
import '../../../core/utils.dart';

part 'vip_event.dart';

class VipBloc extends Bloc<VipEvent, Vip> {
  Offering? offering;

  VipBloc() : super(Vip(isVip: false)) {
    on<VipEvent>(
      (event, emit) => switch (event) {
        CheckVip() => _checkVip(event, emit),
      },
    );
  }

  _checkVip(
    CheckVip event,
    Emitter<Vip> emit,
  ) async {
    try {
      CustomerInfo customerInfo = await Purchases.getCustomerInfo();
      bool isVip = customerInfo.entitlements.active.isNotEmpty;

      Offerings offerings = await Purchases.getOfferings();
      offering = offerings.getOffering(
        'monthly_subsctiption_cv',
      );

      emit(Vip(
        isVip: isVip,
        offering: offering,
      ));
    } catch (e) {
      logger(e);
      emit(Vip(isVip: false));
    }
  }
}
