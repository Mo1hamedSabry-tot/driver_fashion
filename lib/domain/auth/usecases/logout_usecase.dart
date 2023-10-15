import '../../../app/core/usecase/usecase.dart';
import '../repos/auth_repo.dart';

class LogoutUsecase implements BaseUsecase<Future<bool>, NoParams> {
  final AuthRepo _authRepo;

  LogoutUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;

  @override
  Future<bool> call(NoParams params) async {
    return await _authRepo.logout();
  }
}
