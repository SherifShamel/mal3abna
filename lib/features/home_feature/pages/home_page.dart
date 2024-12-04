import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal3abna/core/config/application_theme_manager.dart';
import 'package:mal3abna/core/config/page_route_names.dart';
import 'package:mal3abna/data/players_data.dart';
import 'package:mal3abna/features/home_feature/widgets/home_player_widget.dart';
import 'package:mal3abna/features/home_feature/widgets/my_floating_button.dart';
import 'package:mal3abna/models/player_model.dart';
import 'package:mal3abna/provider/my_shared_preferences_data.dart';
import 'package:mal3abna/provider/players_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController();
    final data = ref.watch(selectedPlayersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pick The Players",
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Add Player"),
                    content: TextFormField(
                      onChanged: (value) {

                      },
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),

      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          GridView.builder(
            itemCount: playersList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) => GamePlayerWidget(
              pageController: pageController,
              playerModel: playersList[index],
            ),
          ),
          GridView.builder(
            itemCount: playersList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) => GamePlayerWidget(
              pageController: pageController,
              playerModel: playersList[index],
            ),
          ),
        ],
      ),
      floatingActionButton: MyFloatingButton(data: data),
    );
  }
}

