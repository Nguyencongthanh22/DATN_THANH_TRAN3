import 'package:flutter/material.dart';

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
  int _currentValue = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _currentValue.toString());
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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          onPressed: _decrement,
          icon: Icon(Icons.remove),
        ),
        Container(
          width: 50,
          alignment: Alignment.center,
          child: Text(
            '$_currentValue',
            style: TextStyle(fontSize: 20),
          ),
        ),
        IconButton(
          onPressed: _increment,
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
