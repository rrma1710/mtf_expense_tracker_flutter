import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              _buildBalanceCard(),
              const SizedBox(height: 16),
              _buildCategoriesCard(),
              const SizedBox(height: 16),
              _buildStatisticCard(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      // Bottom Navigation
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home, color: Colors.grey),
            Icon(Icons.bar_chart, color: Colors.grey),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 58, 124, 60),
        child: const Icon(Icons.add, size: 32, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF214946),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: const Text(
              'September 2025',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Transform.scale(
                scaleX: -1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(10),
                  child: const Icon(Icons.play_arrow),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(10),
                child: const Icon(Icons.play_arrow),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.calendar_today),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBalanceCard() {
    final double balance = 2548.0;
    final double expense = 500.0;
    final double percent = (expense / (balance + expense)).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF232933),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${balance.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$ ${expense.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth * percent;
                  return Container(
                    width: width,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Balance', style: TextStyle(color: Colors.white70)),
              Text('Expense', style: TextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesCard() {
    final List<Map<String, dynamic>> items = [
      {'label': 'Groceries', 'icon': Icons.shopping_cart},
      {'label': 'Food & Drinks', 'icon': Icons.fastfood},
      {'label': 'Entertainment', 'icon': Icons.movie},
      {'label': 'Fitness', 'icon': Icons.fitness_center},
      {'label': 'Transportation', 'icon': Icons.directions_car},
      {'label': 'Insurance', 'icon': Icons.security},
      {'label': 'Shopping', 'icon': Icons.shopping_bag},
      {'label': 'Other', 'icon': Icons.more_horiz},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categories',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              for (int i = 0; i < items.length; i += 2)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCategoryItem(items[i]),
                    if (i + 1 < items.length) _buildCategoryItem(items[i + 1]),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(Map<String, dynamic> item) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(item['icon'], size: 20),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(item['label'], style: const TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statistic',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                barGroups: _makeSampleBarGroups(),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const labels = [
                          'Jan',
                          'Feb',
                          'Mar',
                          'Apr',
                          'May',
                          'Jun',
                        ];
                        if (value.toInt() >= 0 &&
                            value.toInt() < labels.length) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(labels[value.toInt()]),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: true),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(Icons.square, size: 12, color: Colors.redAccent),
              SizedBox(width: 4),
              Text('expenses', style: TextStyle(fontSize: 12)),
              SizedBox(width: 12),
              Icon(Icons.square, size: 12, color: Colors.blue),
              SizedBox(width: 4),
              Text('income', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> _makeSampleBarGroups() {
    final incomes = [3000.0, 2500.0, 4000.0, 4500.0, 5000.0, 4800.0];
    final expenses = [1500.0, 1800.0, 2000.0, 2800.0, 3200.0, 3000.0];

    return List.generate(incomes.length, (i) {
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(toY: expenses[i], color: Colors.redAccent, width: 12),
          BarChartRodData(toY: incomes[i], color: Colors.blue, width: 12),
        ],
        barsSpace: 6,
      );
    });
  }
}
