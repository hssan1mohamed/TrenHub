part of 'get_data_cate_cubit.dart';

@immutable
abstract class GetDataCateState {}

class GetDataCateInitial extends GetDataCateState {}
class GetDataCateLoading extends GetDataCateState {}
class GetDataCateDone extends GetDataCateState {
  final List<ProductModel> products;

  GetDataCateDone({required this.products});
}
class GetDataCateError extends GetDataCateState {
  final String error;

  GetDataCateError({required this.error});
}