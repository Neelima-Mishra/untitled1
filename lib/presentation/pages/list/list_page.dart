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
      body: BlocProvider(
                 create: (context) => _bloc..add(const GetListTop(page: 1)),
                 child: BlocConsumer<ListBloc, ListState>(
                   listener: (context, state) {},
                   builder: (context, state) {
                     if (state is ListInitial) {
                       return Container();
                     } else if (state is ListLoading) {
                       return fullscreenLoader();
                     } else if (state is ListLoaded) {
                       return SingleChildScrollView(
                         child: Column(
                           children: [
                             listOfData(state.list.deals!),
                           ],
                         ),
                       );
                     } else if (state is ListEmpty) {
                       return noDataFound();
                     } else {
                       return Container();
                     }
                   },
                 ),
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

  Widget listOfData(List<Deal> deals) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: SizedBox(
              height: 170,
              width: double.infinity,
              child: detailsOfRow(deals[index]),
            ),
          ),
        );
      },
      itemCount: deals.length,
    );
  }


  Widget detailsOfRow(Deal deals) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
         Row(
          children: [
            CommonImageAsset(
              image: deals.imageMedium!,
              height: 100,
              width: 100,
            ),
            Text(deals.store!=null?deals.store!.name!:""),
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            iconDetails(deals),
          ],
        ),
      ],
    );
  }

  Widget iconDetails(Deal deals) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Icon(Icons.thumb_up),
           Text(deals.commentsCount.toString()),
          const Icon(Icons.message),
           Text(deals.commentsCount.toString()),
          const Icon(Icons.alarm),
          Text(DateFormat('dd-MMMM-yy').format(deals.createdAt!)),
          const Spacer(),
          const InkWell(
            child: Text("AtOther", style: TextStyle(color: Colors.blue),),
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
