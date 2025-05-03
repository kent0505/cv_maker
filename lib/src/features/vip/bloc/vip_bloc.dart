import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../core/models/vip.dart';
import '../../../core/utils.dart';
export '../../../core/models/vip.dart';

part 'vip_event.dart';

class VipBloc extends Bloc<VipEvent, Vip> {
  final _connectivity = Connectivity();

  VipBloc() : super(Vip()) {
    on<VipEvent>(
      (event, emit) => switch (event) {
        CheckVip() => _checkVip(event, emit),
        ChangeVip() => _changeVip(event, emit),
      },
    );
  }

  void _checkVip(
    CheckVip event,
    Emitter<Vip> emit,
  ) async {
    if (Platform.isIOS) {
      _connectivity.onConnectivityChanged.listen((result) {
        if (result.contains(ConnectivityResult.mobile) ||
            result.contains(ConnectivityResult.wifi)) {
          logger('HAS INTERNET');
          add(ChangeVip(connected: true));
        } else {
          logger('NO INTERNET');
          add(ChangeVip(connected: false));
        }
      });
    } else {
      emit(Vip(
        isVip: true,
        hasInternet: true,
      ));
    }
  }

  void _changeVip(
    ChangeVip event,
    Emitter<Vip> emit,
  ) async {
    if (event.connected) {
      try {
        CustomerInfo customerInfo = await Purchases.getCustomerInfo();
        bool isVip = customerInfo.entitlements.active.isNotEmpty;

        Offerings offerings = await Purchases.getOfferings();

        emit(Vip(
          isVip: isVip,
          hasInternet: event.connected,
          offering: offerings.getOffering('monthly_subsctiption_cv'),
        ));
      } catch (e) {
        logger(e);
        emit(Vip(hasInternet: event.connected));
      }
    } else {
      emit(Vip());
    }
  }
}
