import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'package:intl/intl.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> product = [
    Product(
      imagePtah:
          "https://cdn.salla.sa/BllAD/ay7UjChWVI9DvYWbKKEtsKOkna7KJsvrF4pHbqGZ.png",
      size: 35,
      prise: 250,
      details:
          "انبوبة 35لتر معدن غاز طبيعي 100% ومن اجود انواع الغاز بدون رواثب والغاز قابل للاشتعال ☺",
      name: "استوانة غاز 35 لتر",
      switchAnboba: true,
    ),
    Product(
      imagePtah:
          "https://sc02.alicdn.com/kf/HTB1H_RnRVXXXXXBXXXXq6xXFXXXU/200316307/HTB1H_RnRVXXXXXBXXXXq6xXFXXXU.jpg_.webp",
      size: 50,
      prise: 500,
      details:
          "انبوبة 35لتر معدن غاز طبيعي 100% ومن اجود انواع الغاز بدون رواثب والغاز قابل للاشتعال ☺",
      name: "استوانة غاز 50 لتر",
      switchAnboba: false,
    ),
    Product(
      imagePtah:
          "https://sc04.alicdn.com/kf/Hbc903a03172647edac6304a6a0bf90073.jpg",
      size: 75,
      prise: 750,
      details:
          "انبوبة 35لتر معدن غاز طبيعي 100% ومن اجود انواع الغاز بدون رواثب والغاز قابل للاشتعال ☺",
      name: "استوانة غاز 75 لتر",
      switchAnboba: true,
    ),
  ];

  int count = 0;
  final _pageController = PageController();
  late bool isDate = false;
  var time = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text(
          "Details Product",
          style: TextStyle(color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.green,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              itemCount: product.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(product[index].imagePtah),
                            fit: BoxFit.contain,
                          ),
                          color: Colors.white),
                    ),
                    Container(
                      margin: const EdgeInsets.all(25),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade50,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product[index].name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Prise : ${product[index].prise.toString()} \$",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              product[index].details,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Approved",
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                        elevation: 0,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Icon(
                                        Icons.home,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.lock_outline,
                                      color: Colors.grey.shade500,
                                    ),
                                    countBotton(
                                        onTap: () {
                                          setState(() {
                                            if (count <= 0) {
                                              count = 0;
                                            } else {
                                              count--;
                                            }
                                          });
                                        },
                                        title: "-"),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        count.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    countBotton(
                                        onTap: () {
                                          setState(() {
                                            count++;
                                          });
                                        },
                                        title: "+"),
                                  ],
                                )
                              ],
                            ),
                            ListTile(
                              title: const Text(
                                "Express Delivery",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                              trailing: CupertinoSwitch(
                                  activeColor: Colors.orange,
                                  value: product[index].switchAnboba,
                                  onChanged: (value) {}),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MaterialButton(
                                    child: Text(
                                      isDate == false
                                          ? "اختر التاريخ"
                                          : "تعديل التاريخ",
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                          color: Colors.green,
                                          width: 1,
                                        )),
                                    minWidth: 50,
                                    elevation: 0,
                                    onPressed: () async {
                                      await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.utc(2000),
                                              lastDate: DateTime.utc(2040))
                                          .then((value) {
                                        setState(() {
                                          time =
                                              DateFormat.yMMMd().format(value!);
                                          isDate = true;
                                        });
                                      });
                                    }),
                                Text(
                                  time.toString(),
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const Center(
                              child: Text(
                                "العنوان: مصر/الجيزة / البدراشين / سقارة  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "اشتري الان",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    elevation: 0,
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width - 40,
                                        50)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInBack,
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(),
                  ),
                  IconButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.easeInBack,
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget countBotton(
      {required GestureTapCallback onTap, required String title}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 35,
        height: 35,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                // blurRadius: 10,
                color: Colors.grey.shade200)
          ],
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
