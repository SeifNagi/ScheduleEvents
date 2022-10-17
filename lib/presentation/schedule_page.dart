import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import '../../presentation/styles/colors.dart';
import '../../presentation/widgets/image_with_title.dart';
import '../../presentation/widgets/rounded_container.dart';
import '../../presentation/widgets/rounded_image.dart';
import '../../presentation/widgets/text.dart';
import 'package:timelines/timelines.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  ScrollController controllerOne = ScrollController();

  String day = DateFormat('d').format(DateTime.now());
  String dayName = DateFormat('EEEE ').format(DateTime.now());
  String month = DateFormat('MMM yyyy').format(DateTime.now());
  double _scrollPosition = 0;
  _scrollListener() {
    setState(() {
      _scrollPosition = controllerOne.position.pixels - 00;
    });
  }

  void initState() {
    controllerOne.addListener(_scrollListener);

    super.initState();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<ScheduleCubit, ScheduleStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List data = ScheduleCubit.get(context).apiData;
        return Scaffold(
            backgroundColor: whiteColor,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: whiteColor,
              leading: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        color: blackColor,
                      ),
                    )),
              ),
              title: Text(
                'Schedule',
                style: TextStyle(color: blackColor),
              ),
            ),
            body: Column(children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: height / 18,
                    width: width / 10,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      border: Border.all(
                        width: 1,
                        color: orangeColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Icon(
                      Icons.calendar_today_outlined,
                      color: orangeColor,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      day,
                      style: const TextStyle(
                          fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dayName,
                            style: Theme.of(context).textTheme.subtitle1),
                        Text(
                          month,
                        )
                      ]),
                ),
              ]),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: height,
                    child: ListView.builder(
                      itemCount: data.length,
                      controller: controllerOne,
                      itemBuilder: (context, index) =>
                          FixedTimeline.tileBuilder(
                        mainAxisSize: MainAxisSize.max,
                        builder: TimelineTileBuilder.connectedFromStyle(
                          nodePositionBuilder: (context, index) => 0.15,
                          contentsAlign: ContentsAlign.reverse,
                          firstConnectorStyle: ConnectorStyle.transparent,
                          lastConnectorStyle: ConnectorStyle.transparent,
                          oppositeContentsBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                      color: whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: greyColor,
                                          blurRadius: 5.0,
                                          spreadRadius: 2.0,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Stack(children: [
                                            RoundedImage(
                                              photoPath: data[index]
                                                  ['featuredImage'],
                                              width: width,
                                              height: 243,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  RoundedContainer(
                                                    borderRadius: 15,
                                                    widget: ImageWithText(
                                                      imagePath: data[index]
                                                          ['tag']['icon'],
                                                      textData: data[index]
                                                          ['tag']['title'],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 110,
                                                  ),
                                                  RoundedContainer(
                                                    widget: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3.0),
                                                      child: ImageWithText(
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle2,
                                                          textData: data[index][
                                                                      'spots'] ==
                                                                  0
                                                              ? 'Unlimited spots'
                                                              : '${data[index]['spots']} spots left'),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ]),
                                          CustomizedText(
                                              textcontent: DateFormat(
                                                      'EEEE, MMM d yyyy . h:mm a')
                                                  .format(DateTime.parse(
                                                      data[index]['date'])),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1),
                                          CustomizedText(
                                              textcontent:
                                                  '${data[index]['title']}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2),
                                          CustomizedText(
                                              textcontent:
                                                  '${data[index]['placeName']}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1),
                                          data[index]['finish_date'] == null
                                              ? CustomizedText(
                                                  textcontent: 'now',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2)
                                              : CustomizedText(
                                                  textcontent:
                                                      '${DateTime.parse(data[index]['finish_date']).difference(DateTime.parse(data[index]['date'])).inDays} days left',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 5.0, bottom: 5.0),
                                                height: 30,
                                                width: width / 3,
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: data[index]
                                                            ['users']
                                                        .length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int count) {
                                                      return RowSuper(
                                                          outerDistance: -5,
                                                          children: [
                                                            RoundedImage(
                                                                photoPath: data[
                                                                            index]
                                                                        [
                                                                        'users'][count]
                                                                    [
                                                                    'profile_picture'])
                                                          ]);
                                                    }),
                                              ),
                                              data[index]['price'] == 0
                                                  ? CustomizedText(
                                                      textcontent: 'Free',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline1)
                                                  : CustomizedText(
                                                      textcontent:
                                                          'AED ${data[index]['price']}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline1),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          itemCount: data.length,
                          contentsBuilder: (context, index) => TimelineNode(
                            indicatorPosition: 0.1,
                            indicator: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: orangeColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CustomizedText(
                                        textcontent: DateFormat('dd').format(
                                            DateTime.parse(
                                                data[index]['date'])),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                      CustomizedText(
                                        overflow: TextOverflow.fade,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        textcontent: DateFormat('E').format(
                                          DateTime.parse(
                                            data[index]['date'],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            startConnector: SolidLineConnector(
                              thickness: 1.5,
                              color: lightGreyColor,
                            ),
                            endConnector: SolidLineConnector(
                              thickness: 1.5,
                              color: lightGreyColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]));
      },
    );
  }
}
/*Text(month = DateFormat('MMM,yyyy')
                              .format(DateTime.parse(data[index]['date']))),
                          Text(day = DateFormat('d')
                              .format(DateTime.parse(data[index]['date']))),
                          Text(dayName = DateFormat('EEEE')
                              .format(DateTime.parse(data[index]['date']))),
                              
                              
                              ListView.builder(
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Text(data[index]['date']),
                                ) */
