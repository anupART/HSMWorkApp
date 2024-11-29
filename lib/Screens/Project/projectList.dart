import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workapp/Screens/Project/projectDetails.dart';
import '../../Styles/Color/appTheme.dart';
import '../BottomNavBar/bottom_nav.dart';
import '../Drawer/navigation_drawer.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({Key? key}) : super(key: key);

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  bool _isExpanded = false;
  List<Project> projects = [
    Project(
      title: "Project 1",
      startDate: "01 July 2024",
      deadline: "31 December 2024",
      progress: 0.3,
      images: [
        'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaOjCZSoaBhZyODYeQMDCOTICHfz_tia5ay8I_k3k&s',
      ],
    ),
    Project(
      title: "Make an AAPPA",
      startDate: "01 July 2024",
      deadline: "31 December 2024",
      progress: 0.3,
      images: [
        'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaOjCZSoaBhZyODYeQMDCOTICHfz_tia5ay8I_k3k&s',
      ],
    ),
    Project(
      title: "Project 2",
      startDate: "01 August 2024",
      deadline: "30 November 2024",
      progress: 0.5,
      images: [
        'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaOjCZSoaBhZyODYeQMDCOTICHfz_tia5ay8I_k3k&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTY4PolCRZG_SUGHzrbMdWczrLPDLPFjmAlXQ&s'
      ],
    ),
    Project(
      title: "Web Project",
      startDate: "01 June 2024",
      deadline: "31 October 2024",
      progress: 0.7,
      images: [
        'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaOjCZSoaBhZyODYeQMDCOTICHfz_tia5ay8I_k3k&s',
        'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg'
      ],
    ),
  ];

  List<Project> filteredProjects = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProjects = projects;
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      filteredProjects = projects;
      // if (_searchController.text.isEmpty) {
      //   _isExpanded = false;
      // }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  NavigationDrawerClass(),
      bottomNavigationBar: BottomNav(),
      appBar: AppBar(
        titleSpacing: 0,
        title: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Project",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'RobotoSlab',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: AppColors.backgroundColorDark,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          color: AppColors.backgroundColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 0.5,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _isExpanded
                        ? Container(
                            height: 40,
                            color: AppColors.cardColor,
                            alignment: Alignment.center,
                            child: const Text(
                              'Tap to Close Search Bar',
                              style: TextStyle(
                                fontFamily: 'RobotoSlab',
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          )
                        : Container(
                            height: 35,
                            color: AppColors.buttonColor,
                            alignment: Alignment.center,
                            child: const Text(
                              'Tap to Search Projects',
                              style: TextStyle(
                                fontFamily: 'RobotoSlab',
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _isExpanded ? 60 : 0,
                  padding: const EdgeInsets.all(10),
                  color: AppColors.backgroundColor,
                  child: _isExpanded
                      ? Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                onChanged: (value) {
                                  setState(() {
                                    filteredProjects = projects
                                        .where((project) => project.title
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                        .toList();

                                  });
                                },

                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search),
                                  fillColor: AppColors.backgroundColor,
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed:  _clearSearch,
                                  ),
                                  hintText: 'Search projects...',
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
                const SizedBox(height: 10),
                // const Divider(color: AppColors.cardColor, thickness: 2),
                ...filteredProjects.map((project) {
                  return SizedBox(
                    height: 280,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(ProjectScreen(project: projects[0].title),
                            transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 200));
                      },
                      child: Container(
                        height: 100,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColorDark,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadowColor.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.title,
                              style: const TextStyle(
                                fontFamily: 'RobotoSlab',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Stack(
                              children: [
                                Positioned(
                                  child: Container(
                                      height: 190,
                                      width:
                                        Get.size.width / 1.1,
                                      decoration: BoxDecoration(
                                        color: AppColors.buttonColor,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade500,
                                              blurRadius: 15,
                                              offset: const Offset(4, 4),
                                              spreadRadius: 1),
                                          const BoxShadow(
                                              color: Colors.white,
                                              blurRadius: 15,
                                              offset: Offset(-4, -4),
                                              spreadRadius: 1),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const SizedBox(
                                              height: 100,
                                            ),
                                            LinearProgressIndicator(
                                              backgroundColor: Colors.white,
                                              value: project.progress,
                                              color: Colors.black,
                                              valueColor:
                                                  const AlwaysStoppedAnimation<
                                                      Color>(AppColors.cardColor),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Project Category",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'RobotoSlab',
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    Text(
                                                      "Software development",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'RobotoSlab',
                                                          fontSize: 13,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    for (int i = 0;
                                                        i < project.images.length;
                                                        i++)
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                            vertical: 0),
                                                        child: Align(
                                                          widthFactor: 0.5,
                                                          child: CircleAvatar(
                                                            radius: 15,
                                                            backgroundColor: AppColors
                                                                .backgroundColorDark,
                                                            child: CircleAvatar(
                                                              radius: 10,
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                      project.images[
                                                                          i]),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    const CircleAvatar(
                                                      backgroundColor: AppColors
                                                          .backgroundColorDark,
                                                      radius: 12,
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Container(
                                    height: 100,
                                    width:
                                        Get.size.width / 1.1,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: const Border(
                                            right: BorderSide(
                                              color:
                                                  AppColors.backgroundColorDark,
                                              width: 2.0,
                                            ),
                                            left: BorderSide(
                                              color:
                                                  AppColors.backgroundColorDark,
                                              width: 2.0,
                                            ),
                                            top: BorderSide(
                                              color:
                                                  AppColors.backgroundColorDark,
                                              width: 2.0,
                                            )),
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _buildDateContainer(
                                              "Start Date", project.startDate),
                                          _buildDateContainer(
                                              "Deadline", project.deadline),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateContainer(String label, String date) {
    return Container(
      height: 50,
      width: 130,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.cardColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            date,
            style: const TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class Project {
  final String title;
  final String startDate;
  final String deadline;
  final double progress;
  final List<String> images;

  Project({
    required this.title,
    required this.startDate,
    required this.deadline,
    required this.progress,
    required this.images,
  });
}
