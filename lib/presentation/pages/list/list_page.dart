import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../app/di.dart';
import '../../../bloc/list/list_bloc.dart';
import '../../../bloc/list/list_event.dart';
import '../../../bloc/list/list_state.dart';
import '../../../domain/models/list_model.dart';
import '../../../resource/assets_manager.dart';
import '../../../resource/routes_manager.dart';
import '../../common_component/common_image_assets.dart';

class ListPage extends StatelessWidget {
  final ListBloc _bloc = instance<ListBloc>();

  ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          listOfData(),
        ],
      ),
    //   body: Stack(
    //     children: [
    //       BlocProvider(
    //         create: (context) => _bloc..add(const GetListTop(page: 1)),
    //         child: BlocConsumer<ListBloc, ListState>(
    //           listener: (context, state) {},
    //           builder: (context, state) {
    //             if (state is ListInitial) {
    //               return Container();
    //             } else if (state is ListLoading) {
    //               return fullscreenLoader();
    //             } else if (state is ListLoaded) {
    //               return Column(
    //                 children: [
    //                   listOfData(state.list),
    //                 ],
    //               );
    //             } else if (state is ListEmpty) {
    //               return noDataFound();
    //             } else {
    //               return Container();
    //             }
    //           },
    //         ),
    //       )
    //     ],
    //   ),
    // );
    );
  }

  Widget fullscreenLoader() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.blue,
      ),
    );
  }

  Widget listOfData(/*List<TopData> listNearBy*/) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: SizedBox(
              height: 170,
              width: double.infinity,
              child: detailsOfRow(),
            ),
          ),
        );
      },
      itemCount: 1,
    );
  }


  Widget detailsOfRow(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          children: [
            CommonImageAsset(
              image: ImageManager.icLogo,
              height: 40,
              width: 40,
            ),
            Text("This  is Calling Api"),
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            iconDetails(),
          ],
        ),
      ],
    );
  }

  Widget iconDetails(){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Icon(Icons.thumb_up),
          const Text("26"),
          const Icon(Icons.message),
          const Text("26"),
          const Icon(Icons.alarm),
          Text(DateFormat('dd-MMMM-yy').format(DateTime.now())),
          const Spacer(),
          const InkWell(
            child: Text("AtOther",style: TextStyle(color: Colors.blue),),
          )
        ],
      ),
    );
  }
  Widget noDataFound() {
    return const Center(
      child: Text("No Data Found"),
    );
  }
}
