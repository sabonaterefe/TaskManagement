import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/res/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/res/assets/app_icons.dart';
import 'package:task_manager/utils/utils.dart';
import 'package:task_manager/view model/controller/home_controller.dart';
import 'package:task_manager/view/common widgets/back_button.dart';
import 'package:task_manager/view/home page/components/progress_task.dart';
import 'package:task_manager/view/home page/components/search_field.dart';
import 'package:task_manager/view/new task/new_task.dart';
import 'package:task_manager/model/quote.dart';
import 'package:task_manager/view model/services/quote_service.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(HomeController());
  final QuoteService quoteService = QuoteService();
  late Future<Quote> futureQuote;

  @override
  void initState() {
    super.initState();
    fetchNewQuote(); // Fetch a new quote on initialization
  }

  void fetchNewQuote() {
    futureQuote = quoteService.fetchRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      floatingActionButton: GestureDetector(
        onTap: () => NewTask(MediaQuery.sizeOf(context)),
        child: Container(
          height: 65,
          width: 65,
          margin: const EdgeInsets.only(right: 20, bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            gradient: const LinearGradient(colors: [
              Colors.pinkAccent,
              Colors.purpleAccent,
            ]),
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    AppIcon.menu,
                    color: Colors.white,
                    height: 30,
                    width: 30,
                  ),
                  Column(
                    children: [
                      Obx(
                        () => Text(
                          'Hi, ${controller.name}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Text(
                        Utils.formatDate(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const CustomBackButton(
                    height: 40,
                    width: 40,
                    radius: 40,
                    widget: Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: FlutterLogo(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            SearchField(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Obx(() => controller.hasData.value
                  ? RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                          text: 'Progress  ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: '(${controller.taskCount}) ',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ]),
                    )
                  : const SizedBox()),
            ),
            const SizedBox(height: 15),
            ProgressTask(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Obx(() => controller.hasData.value
                  ? const Text(
                      'Tasks',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    )
                  : const SizedBox()),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    if (controller.list[index].show == 'yes') {
                      return Column(
                        children: [
                          Container(
                            height: 70,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.pinkAccent,
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  'Create ${controller.list[index].title} for\n${controller.list[index].category}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const Spacer(),
                                const CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.purpleAccent,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Display the random quote here
            FutureBuilder<Quote>(
              future: futureQuote,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final quote = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '"${quote.text}"\n- ${quote.author}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
