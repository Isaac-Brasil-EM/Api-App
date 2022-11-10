import 'package:api_fetch/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _success() {
    return RefreshIndicator(
        onRefresh: () {
          return controller.start();
        },
        child: ScrollablePositionedList.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: controller.alunos.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                child: ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child:
                          Text(controller.alunos[index].matricula.toString()),
                    ),
                  ),
                  title: Text(
                    controller.alunos[index].nome,
                  ),
                  subtitle: Text(
                    controller.alunos[index].cpf,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start();
        },
        child: Text('Tentar Novamente'),
      ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.success:
        return _success();
      default:
        _start();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alunos'),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         controller.start();
          //       },
          //       icon: Icon(Icons.refresh_sharp))
          // ],
        ),
        body: AnimatedBuilder(
            animation: controller.state,
            builder: (context, child) {
              return stateManagement(controller.state.value);
            }));
  }
}
