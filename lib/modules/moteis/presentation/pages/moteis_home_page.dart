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

  List<Widget> children = [GonowPage(bloc: Modular.get()), Container()];

  final PageController _controller = PageController();

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
            _controller.jumpToPage(index);
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
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: children,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 100,
        height: 35,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.map_outlined,
                color: Color(0xffd60b0e),
              ),
              Text(
                "mapa",
                style: TextStyle(color: Color(0xffd60b0e)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
