part of 'get_body_data_cubit.dart';

@immutable
abstract class GetBodyDataState {}

class GetBodyDataInitial extends GetBodyDataState {}
class GetBodyDataLoading extends GetBodyDataState {}
class GetBodyDataDone extends GetBodyDataState {
 final  List<ProductModel> products;

  GetBodyDataDone({required this.products});
}
class GetBodyDataError extends GetBodyDataState {
  final String error;

  GetBodyDataError({required this.error});
}