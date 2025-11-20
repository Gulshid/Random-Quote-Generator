import 'dart:math';

import 'package:flutter/material.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen>
    with SingleTickerProviderStateMixin {
  final List<Map<String, String>> quotes = [
    {
      'text': 'The only way to do great work is to love what you do.',
      'author': 'Steve Jobs',
    },
    {
      'text': 'Innovation distinguishes between a leader and a follower.',
      'author': 'Steve Jobs',
    },
    {
      'text': 'Life is what happens when you\'re busy making other plans.',
      'author': 'John Lennon',
    },
    {
      'text':
          'The future belongs to those who believe in the beauty of their dreams.',
      'author': 'Eleanor Roosevelt',
    },
    {
      'text':
          'It is during our darkest moments that we must focus to see the light.',
      'author': 'Aristotle',
    },
    {
      'text': 'Be yourself; everyone else is already taken.',
      'author': 'Oscar Wilde',
    },
    {
      'text': 'The only impossible journey is the one you never begin.',
      'author': 'Tony Robbins',
    },
    {
      'text': 'In the middle of difficulty lies opportunity.',
      'author': 'Albert Einstein',
    },
    {
      'text':
          'Success is not final, failure is not fatal: it is the courage to continue that counts.',
      'author': 'Winston Churchill',
    },
    {
      'text': 'Believe you can and you\'re halfway there.',
      'author': 'Theodore Roosevelt',
    },
    {
      'text':
          'The best time to plant a tree was 20 years ago. The second best time is now.',
      'author': 'Chinese Proverb',
    },
    {
      'text':
          'Your time is limited, don\'t waste it living someone else\'s life.',
      'author': 'Steve Jobs',
    },
    {
      'text': 'The way to get started is to quit talking and begin doing.',
      'author': 'Walt Disney',
    },
    {
      'text': 'Don\'t watch the clock; do what it does. Keep going.',
      'author': 'Sam Levenson',
    },
    {
      'text':
          'The only limit to our realization of tomorrow is our doubts of today.',
      'author': 'Franklin D. Roosevelt',
    },
  ];

  late Map<String, String> currentQuote;
  final Random random = Random();
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    currentQuote = quotes[random.nextInt(quotes.length)];
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _generateNewQuote() {
    setState(() {
      _controller.reset();
      Map<String, String> newQuote;
      do {
        newQuote = quotes[random.nextInt(quotes.length)];
      } while (newQuote == currentQuote && quotes.length > 1);
      currentQuote = newQuote;
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Quote Generator',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    padding: const EdgeInsets.all(32.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.format_quote,
                          size: 48,
                          color: Colors.blue[300],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          currentQuote['text']!,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: 60,
                          height: 2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.blue[300]!, Colors.blue[500]!],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '— ${currentQuote['author']}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _generateNewQuote,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 3,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.refresh),
                      SizedBox(width: 8),
                      Text(
                        'New Quote',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
