part of 'pages.dart';

class ShoesPage extends StatefulWidget {
  @override
  _ShoesPageState createState() => _ShoesPageState();
}

class _ShoesPageState extends State<ShoesPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    return ListView(
      children: [
        Column(
          children: [
            //header
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Shoes Market',
                        style: blackFontStyle1,
                      ),
                      Text(
                        'Lets get some foods',
                        style:
                            greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(
                              (context.bloc<UserCubit>().state as UserLoaded)
                                  .user
                                  .picturePath),
                          fit: BoxFit.cover,
                        )),
                  )
                ],
              ),
            ),
            //list of shoes
            Container(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<ShoesCubit, ShoesState>(
                builder: (_, state) => (state is ShoesLoaded)
                    ? ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: state.shoes
                                .map((e) => Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        defaultMargin, 0, defaultMargin, 16),
                                    child: GestureDetector(
                                        onTap: () {
                                          Get.to(ShoesDetail(
                                            transaction: Transaction(
                                                shoes: e,
                                                user: (context
                                                        .bloc<UserCubit>()
                                                        .state as UserLoaded)
                                                    .user),
                                            onBackButtononPresses: () {
                                              Get.back();
                                            },
                                          ));
                                        },
                                        child: ShoesCard(e))))
                                .toList(),
                          )
                        ],
                      )
                    : Center(child: loadingIndicator),
              ),
            ),
            //lsit of shoes (tabs)
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CostumTapBar(
                    titles: ['New Taste', 'Popular', 'Recomended'],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<ShoesCubit, ShoesState>(builder: (_, state) {
                    if (state is ShoesLoaded) {
                      List<Shoes> shoes = state.shoes
                          .where((element) =>
                              element.types.contains((selectedIndex == 0)
                                  ? ShoesType.new_food
                                  : (selectedIndex == 1)
                                      ? ShoesType.popular
                                      : ShoesType.recommended))
                          .toList();

                      return Column(
                        children: shoes
                            .map((e) => Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      defaultMargin, 0, defaultMargin, 16),
                                  child: ShoesList(
                                      shoes: e, itemWidth: listItemWidth),
                                ))
                            .toList(),
                      );
                    } else {
                      return Center(child: loadingIndicator);
                    }
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            )
          ],
        )
      ],
    );
  }
}
