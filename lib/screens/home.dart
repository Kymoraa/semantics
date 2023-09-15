import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semantics_widget/data/data.dart';
import 'package:semantics_widget/utils/colors.dart';
import 'package:semantics_widget/widgets/cake_details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List favouriteCakes = [];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          BuildAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 20.0,
                top: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BuildExploreRow(),
                  CakeGridView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// App Bar
class BuildAppBar extends StatelessWidget {
  const BuildAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Semantics(
        button: true,
        label: 'Navigation drawer icon',
        onTapHint: 'View navigation drawer items',
        onTap: () {},
        child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            "assets/icons/menu.svg",
            height: 40,
            width: 40,
          ),
        ),
      ),
      title: Semantics(
        header: true,
        child: Text(
          "Jackie's Cakes",
          style: GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.headlineSmall,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 15.0,
            top: 5.0,
            bottom: 5.0,
          ),
          child: Semantics(
            button: true,
            label: 'Account',
            onTapHint: 'View account page',
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: kBlackColor,
              ),
              padding: const EdgeInsets.all(7.5),
              child: const Icon(
                CupertinoIcons.person,
                size: 23.0,
                color: kWhiteColor,
              ),
            ),
          ),
        ),
      ],
      elevation: 0.0,
      floating: true,
    );
  }
}

// Explore and Cart Row
class BuildExploreRow extends StatelessWidget {
  const BuildExploreRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10),
            child: Semantics(
              label: 'Explore available cakes',
              excludeSemantics: true,
              child: Text(
                'Explore',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.headlineSmall,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        Semantics(
          button: true,
          label: 'Shopping cart icon',
          onTapHint: 'view cart items',
          onTap: () {},
          excludeSemantics: true,
          child: IconButton(
            icon: const Icon(
              CupertinoIcons.shopping_cart,
              size: 27,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

// GridView of cake Items
class CakeGridView extends StatefulWidget {
  const CakeGridView({
    super.key,
  });

  @override
  State<CakeGridView> createState() => _CakeGridViewState();
}

class _CakeGridViewState extends State<CakeGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (95.0 / 185.0),
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: cakes.length,
      itemBuilder: (context, index) {
        final isFavourite = favouriteCakes.contains(cakes[index].cakeName);
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => CakeDetailsScreen(
                cakeName: cakes[index].cakeName,
                cakeImageUrl: cakes[index].cakeImageUrl,
                currentPrice: cakes[index].currentPrice,
              ),
            );
          },
          child: Semantics(
            button: true,
            label: 'Cupcake flavor is ${cakes[index].cakeName}',
            onTapHint: 'view ${cakes[index].cakeName} details',
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => CakeDetailsScreen(
                  cakeName: cakes[index].cakeName,
                  cakeImageUrl: cakes[index].cakeImageUrl,
                  currentPrice: cakes[index].currentPrice,
                ),
              );
            },
            container: true,
            child: Container(
              height: 250,
              margin: const EdgeInsets.only(bottom: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: kGreyColor,
                    blurRadius: 5.0,
                    offset: Offset(0, 5), // shadow direction: bottom right
                  ),
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 0.65,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15.0),
                              topLeft: Radius.circular(15.0),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              alignment: FractionalOffset.topCenter,
                              image: NetworkImage(cakes[index].cakeImageUrl),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Semantics(
                            container: true,
                            button: true,
                            onTapHint: isFavourite
                                ? 'remove ${cakes[index].cakeName} from favourites list'
                                : 'add ${cakes[index].cakeName} to favourites list',
                            onTap: () {
                              setState(() {
                                if (isFavourite) {
                                  favouriteCakes.remove(cakes[index].cakeName);
                                  var snackBar = SnackBar(
                                    content: Text('${cakes[index].cakeName} has been removed from favourites'),
                                    backgroundColor: CupertinoColors.black,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                } else {
                                  favouriteCakes.add(cakes[index].cakeName);
                                  var snackBar = SnackBar(
                                    content: Text('${cakes[index].cakeName} has been added to favourites'),
                                    backgroundColor: CupertinoColors.black,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                              });
                            },
                            excludeSemantics: true,
                            child: IconButton(
                              icon: Icon(
                                CupertinoIcons.heart_circle_fill,
                                size: 30,
                                color: isFavourite ? kRedColor : kWhiteColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (isFavourite) {
                                    favouriteCakes.remove(cakes[index].cakeName);
                                    var snackBar = SnackBar(
                                      content: Text('${cakes[index].cakeName} has been removed from favourites'),
                                      backgroundColor: CupertinoColors.black,
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  } else {
                                    favouriteCakes.add(cakes[index].cakeName);
                                    var snackBar = SnackBar(
                                      content: Text('${cakes[index].cakeName} has been added to favourites'),
                                      backgroundColor: CupertinoColors.black,
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ExcludeSemantics(
                    child: Text(
                      cakes[index].cakeName,
                      style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
