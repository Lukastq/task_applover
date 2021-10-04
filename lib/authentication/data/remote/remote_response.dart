import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_response.freezed.dart';

@freezed
class RemoteResponse<T> with _$RemoteResponse<T> {
  const RemoteResponse._();
  const factory RemoteResponse.data({T? data}) = _Data<T>;
  const factory RemoteResponse.error({int? errorCode}) = _Error<T>;
  const factory RemoteResponse.noInternetConnection() = _NoInternetConnection<T>;
}
