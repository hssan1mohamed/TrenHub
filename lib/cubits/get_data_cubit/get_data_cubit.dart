import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_test/models/product_model.dart';
import 'package:store_test/services/all_categories_service.dart';
import 'package:store_test/services/get_all_product_service.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit() : super(GetDataInitial());

   Future<void> getCateData()async{
     emit(GetDataLoading());
    try {
      List<dynamic> cates=  await AllCategoriesService().getAllCateogires();
      emit(GetDataDone(cates: cates));
    } on Exception catch (e) {
      emit(GetDataError(error: e.toString()));
    }
  }


}
