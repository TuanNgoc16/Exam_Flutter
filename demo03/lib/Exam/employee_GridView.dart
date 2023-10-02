import 'package:flutter/material.dart';

class Employee {
  String avatarUrl;
  String name;
  int age;
  String position;

  Employee({required this.avatarUrl, required this.name, required this.age, required this.position});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmployeeList(),
    );
  }
}

class EmployeeList extends StatelessWidget {
  List<Employee> employees = [
    Employee(avatarUrl: 'assets/employee1.jpg', name: 'Alice', age: 30, position: 'Quản lý'),
    Employee(avatarUrl: 'assets/employee2.jpg', name: 'Bob', age: 35, position: 'Kỹ sư'),
    Employee(avatarUrl: 'assets/employee3.jpg', name: 'Charlie', age: 25, position: 'Nhân viên bán hàng'),
    Employee(avatarUrl: 'assets/employee4.jpg', name: 'Charlie2', age: 28, position: 'Nhân viên văn phòng'),
    Employee(avatarUrl: 'assets/employee1.jpg', name: 'Alice', age: 30, position: 'Quản lý'),
    Employee(avatarUrl: 'assets/employee2.jpg', name: 'Bob', age: 35, position: 'Kỹ sư'),
    Employee(avatarUrl: 'assets/employee3.jpg', name: 'Charlie', age: 25, position: 'Nhân viên bán hàng'),
    Employee(avatarUrl: 'assets/employee4.jpg', name: 'Charlie2', age: 28, position: 'Nhân viên văn phòng'),
    // Add more employees as needed
  ];

  Widget _buildEmployeeCard(Employee employee, int index, BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(employee.avatarUrl),
        ),
        title: Text(employee.name),
        subtitle: Text('Tuổi: ${employee.age}, Chức vụ: ${employee.position}'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmployeeDetails(employee: employee),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách nhân viên'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: employees.length,
        itemBuilder: (context, index) {
          return _buildEmployeeCard(employees[index], index, context);
        },
      ),
    );
  }
}

class EmployeeDetails extends StatelessWidget {
  final Employee employee;

  EmployeeDetails({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin nhân viên'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(employee.avatarUrl),
              radius: 20.0,
            ),
            SizedBox(height:6.0),
            Text(
              'Tên: ${employee.name}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 1.0),
            Text('Tuổi: ${employee.age}'),
            SizedBox(height: 1.0),
            Text('Chức vụ: ${employee.position}'),
          ],
        ),
      ),
    );
  }
}
