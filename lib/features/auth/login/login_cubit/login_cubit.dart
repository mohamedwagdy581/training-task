import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/network/dio_helper.dart';
import '../../../../core/storage/cache_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.dio) : super(LoginInitial());

  final Dio dio;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());

    try {
      final response = await DioHelper.postData(
        url: 'auth/login',
        data: {"username": email, "password": password},
      );

      // Save Token
      await CacheHelper.saveString(
        key: kAccessToken,
        value: response.data[kAccessToken],
      );

      // refreshToken
      if (response.data[kRefreshToken] != null) {
        await CacheHelper.saveString(
          key: kRefreshToken,
          value: response.data[kRefreshToken],
        );
      }

      emit(LoginSuccessState());
    } catch (error) {
      emit(LoginFailureState(error.toString()));
    }
  }
}
