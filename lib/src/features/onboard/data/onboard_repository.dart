import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/onboard.dart';

abstract interface class OnboardRepository {
  const OnboardRepository();

  bool isOnBoard();
  Future<void> removeOnboard();
  Future<Onboard> getOnboard();
}

final class OnboardRepositoryImpl implements OnboardRepository {
  OnboardRepositoryImpl({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  bool isOnBoard() {
    return _prefs.getBool(Keys.onboard) ?? true;
  }

  @override
  Future<void> removeOnboard() async {
    await _prefs.setBool(Keys.onboard, false);
  }

  @override
  Future<Onboard> getOnboard() async {
    final firebaseDB = FirebaseFirestore.instance;
    final querySnapshot = await firebaseDB.collection('onboard').get();
    return Onboard.fromJson(querySnapshot.docs[0].data());
  }
}
