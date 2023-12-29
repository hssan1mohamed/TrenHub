part of 'get_data_cubit.dart';

@immutable
abstract class GetDataState {}

class GetDataInitial extends GetDataState {}
class GetDataLoading extends GetDataState {}
class GetDataDone extends GetDataState {
  final List<dynamic> cates;

  GetDataDone({required this.cates});
}
class GetDataError extends GetDataState {
  final String error ;

  GetDataError({required this.error});
}
