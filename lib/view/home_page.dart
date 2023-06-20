import 'package:finalexamflutter/view/color.dart';
import 'package:finalexamflutter/view/task.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        Scaffold(
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5)),
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/image/profile.jpg"),
                                radius: 30,
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: RichText(
                              text: const TextSpan(
                            text: 'Hello,  ',
                            style: const TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            //   children: [
                            //   TextSpan(
                            //       // text: '$name',
                            //       style: const TextStyle(
                            //           color: Colors.blue,
                            //           fontWeight: FontWeight.bold))
                            // ]
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TaskPage()));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 64,
                                width: 64,
                                padding: EdgeInsets.symmetric(),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.amber),
                                child: Icon(Icons.bookmark_add_outlined,
                                    color: Colors.white),
                              ),
                              const Text('Task')
                            ],
                          ),
                        ),
                        if ("depthead" != "depthead") ...[
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 64,
                                width: 64,
                                padding: EdgeInsets.symmetric(),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.amber),
                                child:
                                    const Icon(Icons.book, color: Colors.white),
                              ),
                              const Text('Task')
                            ],
                          ),
                        ]
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              'Hari Ini',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GridView.count(
                          childAspectRatio: 16 / 9,
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 8,
                          children: List.generate(
                            4,
                            (index) {
                              return Container(
                                height: 150,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: backgroundss,
                                  borderRadius: BorderRadius.circular(10),
                                  // boxShadow: [
                                  //   const BoxShadow(
                                  //     color: Colors.black,
                                  //     blurRadius: 10,
                                  //     spreadRadius: 2,
                                  //   )
                                  // ])
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Memperbaiki mesin cetak',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          'Karyawan 1',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        Spacer(),
                                        Status()
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    //     Row(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Card(
                    //           elevation: 9,
                    //           shape: BeveledRectangleBorder(
                    //             borderRadius: BorderRadius.circular(6),
                    //           ),
                    //           // margin: const EdgeInsets.all(50),
                    //           child: Container(
                    //               margin: EdgeInsets.all(20),
                    //               child: Column(
                    //                 children: [
                    //                   const Text(
                    //                     'Memperbaiki mesin cetak',
                    //                     style: TextStyle(
                    //                         fontSize: 10,
                    //                         fontWeight: FontWeight.bold),
                    //                   ),
                    //                   Row(
                    //                     children: [
                    //                       const Icon(
                    //                         Icons.circle,
                    //                         color: Colors.blue,
                    //                       ),
                    //                       const Text(''),
                    //                       // Container(
                    //                       //   child: Row(),
                    //                       // )
                    //                     ],
                    //                   )
                    //                 ],
                    //               )),
                    //         ),
                    //       ],
                    //     )
                    //   ],
                    // )
                  ],
                )),
          ),
        ),
      ]),
    );
  }
}

class Status extends StatelessWidget {
  const Status({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            100,
          ),
          color: Colors.white),
      child: Row(
        children: [
          Container(
            height: 7,
            width: 7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: Colors.blue),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'dont',
            style: TextStyle(color: Colors.black, fontSize: 12),
          )
        ],
      ),
    );
  }
}
