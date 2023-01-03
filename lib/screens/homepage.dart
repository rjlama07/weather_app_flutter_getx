import 'package:flutter/material.dart';
import 'package:weatheria/widget/reuseable_row.dart';
import 'package:weatheria/widget/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Kathmandu, Nepal",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Monday, 24 Aug",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const Icon(Icons.menu)
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const SearchBar(),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: Column(
                  children: [
                    Image.network(
                      "https://openweathermap.org/img/w/10d.png",
                      height: MediaQuery.of(context).size.height * 0.2,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      "30°",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "Cloudy",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    )
                  ],
                )),
                const SizedBox(
                  height: 80,
                ),
                const ReuseableRow(title: "Humidity", info: "20"),
                const ReuseableRow(title: "Humidity", info: "20"),
                const ReuseableRow(title: "Humidity", info: "20")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
