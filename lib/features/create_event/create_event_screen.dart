import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/widgets/custom_form_field.dart';
import 'package:evently/features/create_event/widget/tab_widget.dart';
import 'package:evently/models/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

import '../../core/utiles/firebase_functions.dart';
import '../../core/widgets/custom_elveted_buttom.dart';
import '../../models/event_category.dart';

class CreateEventScreen extends StatefulWidget {
  static const routeName = '/create-event';

  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int selectedTab = 0;
  DateTime? selectedDate;

  TimeOfDay? selectedTime;

  List<EventsCategory> eventsCategories = [
    EventsCategory(
        eventCategoryName: 'All',
        eventCategoryIcon: Icons.sports,
        eventCategoryImage: AppAssets.cardExhibition),
    EventsCategory(
      eventCategoryName: 'BookClub',
      eventCategoryIcon: Icons.sports,
      eventCategoryImage: AppAssets.cardWorkshop,
    ),
    EventsCategory(
      eventCategoryName: 'Sports',
      eventCategoryIcon: Icons.sports,
      eventCategoryImage: AppAssets.cardSport,
    ),
    EventsCategory(
      eventCategoryName: 'Meeting',
      eventCategoryIcon: Icons.sports,
      eventCategoryImage: AppAssets.cardMeeting,
    ),
    EventsCategory(
      eventCategoryName: 'Birthday',
      eventCategoryIcon: Icons.sports,
      eventCategoryImage: AppAssets.cardBirthday,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.primaryColor,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Create Event',
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: DefaultTabController(
        length: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Container(
                            height: size.size.height * 0.26,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    image: AssetImage(
                                        eventsCategories[selectedTab]
                                            .eventCategoryImage),
                                    fit: BoxFit.fill)),
                          ),
                          DefaultTabController(
                            length: 5,
                            child: TabBar(
                                dividerColor: Colors.transparent,
                                indicatorColor: Colors.transparent,
                                isScrollable: true,
                                tabAlignment: TabAlignment.start,
                                tabs: eventsCategories
                                    .map((element) => TabWidget(
                                          eventCategory: element,
                                          isSelected: selectedTab ==
                                              eventsCategories.indexOf(element),
                                        ))
                                    .toList(),
                                onTap: (index) {
                                  setState(() {
                                    selectedTab = index;
                                  });
                                }),
                          ),
                          Text(
                            'Title',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          CustomFormField(
                            controller: titleController,
                            labelText: 'Event Title',
                            prefixIcon: const Icon(
                              Icons.event,
                            ),
                          ),
                          Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          CustomFormField(
                            controller: descriptionController,
                            labelText: 'Event Description',
                            maxLines: 5, // Set maxLines
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.calendar_month_outlined),
                              Text(
                                'Event Date',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  selectEventData(context);
                                },
                                child: Text(
                                  selectedDate != null
                                      ? DateFormat('dd MMM yyy ')
                                          .format(selectedDate!)
                                      : 'Choose Date ',
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.access_time),
                              Text(
                                'Choose Time',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  selectEventTime(context);
                                },
                                child: Text(
                                  selectedTime != null
                                      ? selectedTime!.format(context)
                                      : 'Choose Time',
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: AppColors.primaryColor, width: 1)),
                            child: Row(
                              spacing: 10,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {},
                                  elevation: 0,
                                  backgroundColor: AppColors.primaryColor,
                                  child: Icon(
                                    Icons.my_location_rounded,
                                    color: AppColors.white,
                                  ),
                                ),
                                Text(
                                  'Choose Event Location',
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              CustomElevatedButton(
                  title: 'Add Event',
                  backGroundColor: AppColors.primaryColor,
                  textColor: AppColors.white,
                  borderRadius: 20,
                  onPressed: () {
                    var data = EventDataModel(
                      eventTitle: titleController.text,
                      eventDescription: descriptionController.text,
                      eventCategory:
                          eventsCategories[selectedTab].eventCategoryName,
                      eventImage:
                          eventsCategories[selectedTab].eventCategoryImage,
                      eventDate: selectedDate ?? DateTime.now(),
                      eventTime: selectedTime ?? TimeOfDay.now(),
                    );
                    if (formKey.currentState!.validate()) {
                      EasyLoading.show();
                      if (selectedDate != null && selectedTime != null) {
                        FirebaseFunctions.createNewEvent(data).then((value) {
                          EasyLoading.dismiss();
                        });
                      }
                    }
                  }),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  selectEventData(BuildContext context) async {
    DateTime? newData = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (newData != null) {
      setState(() {
        selectedDate = newData;
      });
      // print(selectedDate);
    }
  }

  selectEventTime(BuildContext context) async {
    TimeOfDay? newTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
      });
      //print(selectedTime);
    }
  }
}
