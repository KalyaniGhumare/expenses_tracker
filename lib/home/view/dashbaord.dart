import 'package:flutter/material.dart';
import 'package:flutter_widget/home/view/brand_model.dart';
import 'package:flutter_widget/home/view/web_screen.dart';
import 'package:flutter_widget/intro/colors.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<BrandModel> brandName = List();

  @override
  void initState() {
    prepareList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*
          * TODO
          * Show BottomSheet on click on Button
          * */
    // RaisedButton(
    //   color: primaryColor,
    //   onPressed: () {
    //     openBottomSheet();
    //   },
    //   child: Text(
    //     "Show BottomSheet",
    //     style: TextStyle(color: Colors.white),
    //   ),
    // ),

    return Container(
      child: GridView.builder(
          // separatorBuilder: (context, index) {
          //   return Divider(color: primaryColor, thickness: 2.0);
          // },
          itemCount: brandName.length,
          itemBuilder: (context, index) {
            String url = brandName[index].url;
            String name = brandName[index].name;
            String link = brandName[index].link;
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
              child: Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0, /*vertical: 10*/
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  WebScreen(brandName: name, brandUrl: link)));
                        },
                        child: Image.asset(
                          url,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                          height: 160,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        name,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
    );
  }

  openBottomSheet() {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.grey,
            height: 400.0,
            // width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                Text("Text1"),
                Text("Text1"),
                Text("Text1"),
                Text("Text1"),
                Text("Text1"),
                Text("Text1"),
                Text("Text1"),
              ],
            ),
          );
        });
  }

  void prepareList() {
    // Add Data into List

    // 1st Amazon
    BrandModel model = BrandModel(
        name: "Amazon",
        url: "assets/imag1.png",
        link: "https://www.amazon.in/");
    brandName.add(model);

    // 2 FlipCard
    BrandModel model2 = BrandModel(
        name: "Flipkart",
        url: "assets/download.jpeg",
        link:
            "https://www.flipkart.com/big-diwali-sale-store?gclid=CjwKCAiAv4n9BRA9EiwA30WND-Z5z8Gv3km5JgRKay7cDI69vtACwmdsxA6gkdeOWR0pbQJn3_dJ8RoCPRMQAvD_BwE&ef_id=CjwKCAiAv4n9BRA9EiwA30WND-Z5z8Gv3km5JgRKay7cDI69vtACwmdsxA6gkdeOWR0pbQJn3_dJ8RoCPRMQAvD_BwE:G:s&s_kwcid=AL!739!3!475954120751!e!!g!!flipkart&gclsrc=aw.ds&&semcmpid=sem_8024046704_brand_city_goog");
    brandName.add(model2);

    // 3 Facebook
    BrandModel model3 = BrandModel(
        name: "Facebook",
        url: "assets/facebook.jpeg",
        link: "https://www.facebook.com/");
    brandName.add(model3);

    // 4 Google
    BrandModel model4 = BrandModel(
        name: "Google",
        url: "assets/google.png",
        link: "https://www.google.com/");
    brandName.add(model4);

    // 5 JioMart
    BrandModel model5 = BrandModel(
        name: "Jio Mart",
        url: "assets/download2.jpeg",
        link:
            "https://www.jiomart.com/?gclid=CjwKCAiAv4n9BRA9EiwA30WND0TnbDs_GeYqoIzsn1hWG29tIjrCeezyWPDuk_38QdN_41J-Dg4-gxoC8aAQAvD_BwE");
    brandName.add(model5);
  }
}
