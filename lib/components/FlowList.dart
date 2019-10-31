import 'package:flutter/material.dart';

class FlowList extends StatefulWidget {
  FlowList({Key key}) : super(key: key);

  @override
  _FlowListState createState() => _FlowListState();
}

class _FlowListState extends State<FlowList> {
  final List _dataList = List.generate(20, (i) => i);
  bool isPerformingRequest = false;
  ScrollController _scrollController = ScrollController();

  Future<Null> _refresh() async {
    _getMoreData(true);
    return;
  }

  Future<List<int>> fakeRequest(int from, int to) async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(to - from, (i) => i + from);
    });
  }

  _getMoreData(refresh) async {
    if (isPerformingRequest) {
      return;
    }
    setState(() => isPerformingRequest = true);
    List<int> newEntries = await fakeRequest(_dataList.length, _dataList.length + 20);
    if (newEntries.isEmpty) {
      double edge = 50.0;
      double offsetFromBottom = _scrollController.position.maxScrollExtent - _scrollController.position.pixels;
      if (offsetFromBottom < edge) {
        _scrollController.animateTo(
            _scrollController.offset - (edge -offsetFromBottom),
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOut);
      }
    }
    setState(() {
      if (refresh) {
        _dataList.clear();
      }
      _dataList.addAll(newEntries);
      isPerformingRequest = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        _getMoreData(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(2.0),
        child: RefreshIndicator(
          onRefresh: _refresh,
          backgroundColor: Colors.blue,
          child: ListView.builder(
            itemCount: _dataList.length + 1,
            itemBuilder: (context, index) {
              if (index == _dataList.length) {
                return _buildProgressIndicator(isPerformingRequest);
              }
              return Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('${_dataList[index]}'),
              );
            },
            controller: _scrollController,
          )
        ),
      ),
    );
  }
}

Widget _buildProgressIndicator(isPerformingRequest) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Opacity(
        opacity: isPerformingRequest ? 1.0 : 0.0,
        child: CircularProgressIndicator(),
      ),
    ),
  );
}
