import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/product_model.dart';
import '../../services/categories_service.dart';

part 'get_data_cate_state.dart';

class GetDataCateCubit extends Cubit<GetDataCateState> {
  GetDataCateCubit() : super(GetDataCateInitial());


  Future<void> getDataCate({required String categoryName })async{
    emit(GetDataCateLoading());
    try {
      List<ProductModel> products= await CategoriesService().getCategoriesProducts(categoryName: categoryName);
      emit(GetDataCateDone(products: products));
    } on Exception catch (e) {
      emit(GetDataCateError(error: e.toString()));
    }

  }
}
