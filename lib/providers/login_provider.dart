import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memorydirective/data/repositories/auth_repository_provider.dart';
import 'package:memorydirective/data/data.dart';

final loginProvider = FutureProvider.autoDispose<bool>((ref) async {
  final repository = ref.read(authRepositoryProvider);
  return repository.googleSignIn();
});