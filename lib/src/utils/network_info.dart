import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfo {
  NetworkInfo({required this.dataConnectionChecker});
  final InternetConnectionChecker dataConnectionChecker;

  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfo(dataConnectionChecker: InternetConnectionChecker());
});
