import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memorydirective/data/datasource/auth_datasource_provider.dart';
import 'package:memorydirective/data/data.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref){
  final datasource = ref.read(authDataSourceProvider);
  return AuthRepositoryImpl(datasource);

});