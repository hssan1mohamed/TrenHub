import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_test/Screens/category_screen.dart';
import 'package:store_test/cubits/get_data_cubit/get_data_cubit.dart';
import 'package:store_test/widgets/showSnackBar.dart';
import '../helper/lists.dart';

class CateWidget extends StatelessWidget {
  const CateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetDataCubit>(context).getCateData();
    return BlocBuilder<GetDataCubit, GetDataState>(
      builder: (context, state) {
        List<dynamic>? cate;
        if (state is GetDataDone) {
          cate = state.cates;
        } else if (state is GetDataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetDataError) {
          showSnackBar(context, state.error);
        }

        return cate == null
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cate!.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryScreen(
                                        title: cate![i],
                                      ))),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors
                                      .white, // Set your desired border color here
                                  width: 4.0, // Set the width of the border
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: getRandomColor(),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(0, 1),
                                  ),
                                ]),
                            child: Text(cate![i],
                                style: const TextStyle(fontSize: 20)),
                          ),
                        ),
                      );
                    }),
              );
      },
    );
  }
}
