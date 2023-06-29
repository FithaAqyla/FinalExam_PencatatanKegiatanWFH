import 'package:finalexamflutter/controller/home_controller.dart';
import 'package:finalexamflutter/view/color.dart';
import 'package:finalexamflutter/view/login.dart';
import 'package:finalexamflutter/view/profile.dart';
import 'package:finalexamflutter/view/task.dart';
import 'package:finalexamflutter/widgets/task_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  void initState() {
    super.initState();
    homeController.initial().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          header(context),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                menus(context),
                const SizedBox(height: 16),
                todays(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget todays() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.calendar_month),
            Text(
              'Hari Ini',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        GridView.count(
          childAspectRatio: 20 / 9,
          crossAxisCount: 2,
          shrinkWrap: true,
          mainAxisSpacing: 4,
          crossAxisSpacing: 8,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            homeController.data?.tasks.take(4).length ?? 0,
            (index) {
              final item = homeController.data!.tasks[index];
              return TaskCard(
                item: item,
                isDeptHead: homeController.data?.user.role == 1,
                maxTitleLines: 2,
                onBack: () {
                  homeController.initial();
                  setState(() {});
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget menus(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<Widget>(
                builder: (context) => const TaskPage(),
              ),
            );
          },
          child: Column(
            children: [
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.amber,
                ),
                child: const Icon(
                  Icons.my_library_books_outlined,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text('Task')
            ],
          ),
        ),
        if (homeController.data?.user.role == 1) ...[
          const SizedBox(
            width: 8,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                child: Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.amber,
                  ),
                  child: const Icon(
                    Icons.person_2_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              const Text('Profile')
            ],
          ),
        ]
      ],
    );
  }

  Widget header(BuildContext context) {
    return Container(
      color: backgroundss,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: MediaQuery.of(context).padding.top + 16,
        bottom: 16,
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/image/profile.jpg'),
            radius: 30,
          ),
          const SizedBox(width: 16),
          Text(
            'Hello, ${homeController.data?.user.name ?? 'Guest'}',
            style: const TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              homeController.logout().then((value) {
                if (value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ),
                  );
                }
              });
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
