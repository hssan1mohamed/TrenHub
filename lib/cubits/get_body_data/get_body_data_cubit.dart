import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_test/models/product_model.dart';

import '../../services/get_all_product_service.dart';

part 'get_body_data_state.dart';

class GetBodyDataCubit extends Cubit<GetBodyDataState> {
  GetBodyDataCubit() : super(GetBodyDataInitial());

Future<void> getBodyData()async{
  emit(GetBodyDataLoading());
  try {
    List<ProductModel> products=await AllProductsService().getAllProducts();
    emit(GetBodyDataDone(products: products));
  } on Exception catch (e) {
    emit(GetBodyDataError(error: e.toString()));
  }

}
}
