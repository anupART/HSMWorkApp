import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:workapp/Screens/BottomNavBar/bottom_nav.dart';
import '../../Components/Charts/bar_graph/bar_graph.dart';
import '../../Components/Charts/pie_chart.dart';
import '../../Components/Charts/piechart_project.dart';
import '../../Styles/Color/appTheme.dart';
import '../Drawer/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var sw = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        drawer: NavigationDrawerClass(),
        bottomNavigationBar: BottomNav(),
        appBar: AppBar(
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 50,
              width: Get.size.width,
              child: const Center(
                child: Text(
                  "HSM Work Manager",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'RobotoSlab',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 150,
                      decoration:  BoxDecoration(
                        color: Colors.white,
                        // border: Border.only(
                        //   bo
                        //     width: 2),
                      ),
                    ),
                    Container(
                      width: Get.size.width,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          const SizedBox(height: 140),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildInfoCard(context, "Task", "Total Task : 10",
                                  const PieChartClass()),
                              _buildInfoCard(context, "Project",
                                  "Total Project : 3", const PieChartProjctClass()),
                            ],
                          ),
                          const SizedBox(height: 30),
                          _buildTaskHoursCard(context),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 55,
                  left: 20,
                  child: Container(
                    height: 185,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: AppColors.unselectedButtonColor,
                          width: 2),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 170,
                            width: 115,
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Full Name",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "Designation",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: sw / 2.5,
                                child: const Text(
                                  textAlign: TextAlign.justify,
                                  "\"Take your victories, whatever they may be, cherish them, use them, but don't settle for them.\"",
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 4,
                                  style: TextStyle(
                                      fontFamily: 'RobotoSlab',
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildInfoCard(
      BuildContext context, String title, String subtitle, Widget chart) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 30, sigmaX: 30),
        child: Container(
          height: 220,
          width: MediaQuery.of(context).size.width / 2.3,
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.backgroundColorDark),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'RobotoSlab',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 170,
                width: MediaQuery.of(context).size.width / 2.5,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          subtitle,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'RobotoSlab',
                            fontSize: 14,
                          ),
                        ),
                        const Divider(),
                        Expanded(child: chart),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildTaskHoursCard(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 30, sigmaX: 30),
        child: Container(
          height: 400,
          width: MediaQuery.of(context).size.width / 1.1,
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.backgroundColorDark),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Task and Hours",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'RobotoSlab',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 330,
                width: MediaQuery.of(context).size.width / 1.2,
                child: MyBarGraph(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
