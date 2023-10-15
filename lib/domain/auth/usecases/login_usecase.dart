import 'package:equatable/equatable.dart';

import '../../../app/core/usecase/usecase.dart';
import '../repos/auth_repo.dart';

class LoginUsecase extends BaseUsecase<Future<bool>, LoginParams> {
  final AuthRepo _authRepo;

  LoginUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;

  @override
  Future<bool> call(params) async {
    return await _authRepo.login(
        email: params.email, password: params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
