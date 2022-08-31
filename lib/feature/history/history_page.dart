import 'package:cattrivia/feature/history/history_cubit.dart';
import 'package:cattrivia/service/cat_trivia_service.dart';
import 'package:cattrivia/utils/di_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const History());
}

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() {
    return _HistoryPageState();
  }
}

class _HistoryPageState extends State<History> {
  late HistoryCubit _historyCubit;

  @override
  void initState() {
    super.initState();
    setState(
      () {
        _historyCubit = HistoryCubit(getIt<CatTriviaService>())..fetchHistory();
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
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: EdgeInsets.only(right: 80),
              child: Text(
                'History',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder(
        bloc: _historyCubit,
        builder: (context, HistoryState state) {
          return state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: state.cattrivias.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      state.cattrivias[index].fact,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Text(
                                        'Create: ' +
                                            DateFormat('dd MMMM  HH:mm')
                                                .format(DateTime.now()),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
