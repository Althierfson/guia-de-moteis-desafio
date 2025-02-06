import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:guia_moteis_desafio/modules/moteis/presentation/pages/gonow_page.dart';
import 'package:guia_moteis_desafio/modules/moteis/presentation/widgets/toggle_moteis_now_or_other_day.dart';

class MoteisHomePage extends StatefulWidget {
  const MoteisHomePage({super.key});

  @override
  State<MoteisHomePage> createState() => _MoteisHomePageState();
}

class _MoteisHomePageState extends State<MoteisHomePage> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            )),
        title: ToggleMoteisNowOrOtherDay(
          select: (index) {
            setState(() {
              selectIndex = index;
            });
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: selectIndex == 0 ? GonowPage(bloc: Modular.get()) : Container(),
    );
  }
}
