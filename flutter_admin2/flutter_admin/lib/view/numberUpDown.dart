import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Number Up Down'),
        ),
        body: Center(
          child: NumberUpDown(
            min: 0,
            max: 100,
            onChanged: (value) {
              print('Current value: $value');
            },
          ),
        ),
      ),
    );
  }
}

class NumberUpDown extends StatefulWidget {
  final int min;
  final int max;
  final Function(int) onChanged;

  NumberUpDown(
      {Key? key, this.min = 0, this.max = 100, required this.onChanged})
      : super(key: key);

  @override
  State<NumberUpDown> createState() => _NumberUpDownState();
}

class _NumberUpDownState extends State<NumberUpDown> {
  late TextEditingController _controller;
  int _currentValue = 1;
  bool _isEditing = false;

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _currentValue.toString());
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection =
            TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
      }
    });
  }

  void _increment() {
    if (_currentValue < widget.max) {
      setState(() {
        _currentValue++;
        _controller.text = _currentValue.toString();
        widget.onChanged(_currentValue);
      });
    }
  }

  void _decrement() {
    if (_currentValue > widget.min) {
      setState(() {
        _currentValue--;
        _controller.text = _currentValue.toString();
        widget.onChanged(_currentValue);
      });
    }
  }

  void _onChanged(String value) {
    int? newValue = int.tryParse(value);
    if (newValue != null && newValue >= widget.min && newValue <= widget.max) {
      setState(() {
        _currentValue = newValue;
        widget.onChanged(_currentValue);
      });
    } else if (newValue != null) {
      setState(() {
        _controller.text = _currentValue.toString();
      });
    }
  }

  void _onTap() {
    if (_currentValue == 1 && !_isEditing) {
      setState(() {
        _controller.text = '';
        _isEditing = true;
        FocusScope.of(context).requestFocus(_focusNode);
      });
    }
  }

  void _onEditingComplete() {
    if (_controller.text.isEmpty) {
      setState(() {
        _controller.text = _currentValue.toString();
        _isEditing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2), // Viền màu đen
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              onPressed: _decrement,
              icon: Icon(Icons.remove),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.black), // Viền bên trái
                  right: BorderSide(color: Colors.black), // Viền bên phải
                ),
              ),
              width: 50,
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: _onChanged,
                onTap: _onTap,
                onEditingComplete: _onEditingComplete,
                style: TextStyle(fontSize: 20),
                inputFormatters: [
                  // Optional: You can add input formatters here if needed
                ],
              ),
            ),
            IconButton(
              onPressed: _increment,
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }
}
