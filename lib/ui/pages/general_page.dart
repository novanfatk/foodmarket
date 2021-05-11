part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onBackButtononPressed;
  final Widget child;
  final Color backcolor;

  GeneralPage({
    this.title = "Title",
    this.subtitle = "subtitle",
    this.onBackButtononPressed,
    this.child,
    this.backcolor, Color backColor,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          SafeArea(child: Container(color: backcolor ?? Colors.white)),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        width: double.infinity,
                        height: 100,
                        color: Colors.white,
                        child: Row(
                          children: [
                            onBackButtononPressed != null
                                ? GestureDetector(
                                    onTap: () {
                                      if (onBackButtononPressed != null) {
                                        onBackButtononPressed();
                                      }
                                    },
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      margin: EdgeInsets.only(right: 26),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/back_arrow.png'))),
                                    ),
                                  )
                                : SizedBox(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  title,
                                  style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  subtitle,
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        )),
                    Container(
                      height: defaultMargin,
                      width: double.infinity,
                      color: "FAFAFC".toColor(),
                    ),
                    child ?? SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
