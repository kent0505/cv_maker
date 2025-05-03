part of 'vip_bloc.dart';

@immutable
sealed class VipEvent {}

final class CheckVip extends VipEvent {}

class ChangeVip extends VipEvent {
  ChangeVip({required this.connected});

  final bool connected;
}
