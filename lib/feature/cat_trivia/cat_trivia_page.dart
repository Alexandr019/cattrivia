import 'package:cattrivia/feature/cat_trivia/cat_trivia_cubit.dart';
import 'package:cattrivia/feature/history/history_page.dart';
import 'package:cattrivia/service/cat_trivia_service.dart';
import 'package:cattrivia/utils/di_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CatTriviaPage extends StatefulWidget {
  const CatTriviaPage({Key? key}) : super(key: key);

  @override
  _CatTriviaPageState createState() {
    return _CatTriviaPageState();
  }
}

class _CatTriviaPageState extends State<CatTriviaPage> {
  late CatTriviaCubit _catTriviaCubit;

  @override
  void initState() {
    super.initState();
    setState(
      () {
        _catTriviaCubit = CatTriviaCubit(getIt<CatTriviaService>())
          ..fetchCatTrivia();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.pets_outlined, color: Colors.black),
            SizedBox(width: 10),
            Text(
              'Cat Trivia',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder(
        bloc: _catTriviaCubit,
        builder: (context, CatTriviaState state) {
          return state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              offset: const Offset(
                                0.0,
                                10.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: -6.0,
                            ),
                          ],
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2),
                              BlendMode.multiply,
                            ),
                            image: NetworkImage(
                                '${'https://cataas.com/cat'}?${DateTime.now().millisecondsSinceEpoch.toString()}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        children: const [
                          Text(
                            'Interesting fact about cat',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Row(
                        children: [
                          Text(
                            DateFormat('dd MMMM  HH:mm').format(DateTime.now()),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          state.cattrivias!.fact,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 5,
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const History()));
                                    },
                                    icon: const Icon(
                                      Icons.history,
                                      color: Colors.black,
                                      size: 50,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width: 190,
                                    height: 60,
                                    margin: const EdgeInsets.only(left: 70),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.black,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(25),
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'Another fact!',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        super.widget),
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
