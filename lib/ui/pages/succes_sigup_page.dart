part of 'pages.dart';

class SuccessSigupPgaes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: IllustrationPage(
          title: 'Yeey! completed',
          subtitle:
              'now you are able to order\n some foods as a self reward',
          picturePath: 'assets/images/food_wishes.png',
          buttonTap1: () {},
          buttonTitle1: 'Find Foods',
         
        ));
  }
}
