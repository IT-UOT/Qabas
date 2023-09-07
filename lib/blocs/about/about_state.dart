part of 'about_cubit.dart';

@freezed
class AboutState with _$AboutState {
  const factory AboutState.initial() = _Initial;
  const factory AboutState.loading() = _Loading;
  const factory AboutState.loaded(AboutModel? about) = _Loaded;
  const factory AboutState.error(String message) = _Error;
}
