import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/card.state.dart';
import 'package:memory_game/bloc/card_bloc.dart';
import 'package:memory_game/bloc/card_event.dart';
import 'package:memory_game/constants/color_constant.dart';
import 'package:memory_game/constants/text_constant.dart';
import 'package:memory_game/constants/text_style_constant.dart';
import 'package:memory_game/list_cards.dart';
import 'package:memory_game/widgets/card_questionmark_image_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackGroundColor,
      appBar: AppBar(
        centerTitle: false,
        actions: [
          BlocBuilder<CardBloc, CardState>(builder: (context, state) {
            if (state is CardInitialState) {
              BlocProvider.of<CardBloc>(context).add(GetCardDataEvent());
              return CircularProgressIndicator();
            } else if (state is CardLoadedState) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child:
                    Text("Score: ${state.resultCount}", style: kScoreTextStyle),
              );
            }
            return Container();
          })
        ],
        title: kAppBarTitleText,
      ),
      body: BlocBuilder<CardBloc, CardState>(builder: (context, state) {
        if (state is CardInitialState) {
          BlocProvider.of<CardBloc>(context).add(GetCardDataEvent());
          return CircularProgressIndicator();
        } else if (state is CardLoadedState) {
          return GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio:
                    MediaQuery.of(context).size.aspectRatio + 0.35,
                mainAxisSpacing: 10,
                crossAxisCount: 2),
            children: cardList.map((card) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<CardBloc>(context)
                            .add(CardUpdateEvent(card));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: (state).card != null &&
                                state.isAddedList.contains(card)
                            ? Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(card.imageUrl))
                            : Container(
                                color: kCardContainerColor,
                                child: cardQuestionMarkImage()),
                      ),
                    )),
              );
            }).toList(),
          );
        } else
          return Container();
      }),
    );
  }
}
