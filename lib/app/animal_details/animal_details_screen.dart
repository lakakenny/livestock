import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livestock/app/animal_details/bloc/bloc.dart';
import 'package:livestock/app/animal_details/widgets/animal_details_header.dart';
import 'package:livestock/app/animal_details/widgets/history_card.dart';
import 'package:livestock/app/animal_details/widgets/history_header.dart';
import 'package:livestock/src/ui/widgets/livestock_number_box.dart';

class AnimalDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: HistoryHeader(),
          ),
          BlocBuilder<AnimalHistoryBloc, AnimalHistoryState>(
            builder: (BuildContext context, AnimalHistoryState state) {
              if(state is HistoryUpdated) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    return HistoryCard(historyRecord: state.history[index],);
                  },
                    childCount: state.history.length,
                  ),
                );
              } else {
                return SliverToBoxAdapter(child: Container());
              }
            }
          ),
        ],
      ),
    );
  }

  static Widget _buildAppBar(BuildContext context) {
    return AppBar(
      brightness: Brightness.dark,
      bottom: AnimalDetailsHeader(),
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ),
      titleSpacing: 0.0,
      title: BlocBuilder<AnimalDetailsBloc, AnimalDetailsState>(
          builder: (BuildContext context, AnimalDetailsState state) {
        return (state is AnimalDetailsState)
            ? LivestockNumberBox(
                animalNumber: state.animalNumber.toString(),
              )
            : Text('Livestock');
      }),
    );
  }
}
