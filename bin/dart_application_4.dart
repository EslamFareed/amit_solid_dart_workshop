//? SOLID

//! ------------------------------------------

//? Single Resposibility

//! XXXXXXXXXXXXXXXXXXX

// Instance User
// Login
// save user to database
// send email
// class UserWrong {
//   int? id;
//   String? name;
//   //! 1
//   void saveUserToDatabase() {
//     // Todo save user to data base
//   }
//   //! 2
//   void sendEmailVerification(){
//     // Todo Send email
//   }
//   //! 3
//   void login(){
//     // Todo send email,password check if login success from data basse
//   }
// }

// //! Correct SRP

// class User {
//   String? name;
//   int? id;
// }

// class LoginRepository{
//     void login(User user){
//       // Todo login
//     }
// }

// class CreateUserRepository{
//   void saveUserToDatabase(User user){
//     // Todo
//   }
// }

// class SendEmailRepo{
//   void sendEmailVerify(User user){
//     //TOdo
//   }
// }

//! ------------------------------------------

//? Open closed
//? open for extension (extends/inherit)
//? closed for modification

//! Wrong
// class RectangleWrong {
//   double? width;
//   double? height;
//   double area() {
//     return width! * height!;
//   }
// }
// class CircleWrong {
//   double? r;
//   double area() {
//     return r! * 3.14 * r!;
//   }
// }

//! Correct
// abstract class ShapeCalcArea {
//   double area();
// }
// class Rectangle implements ShapeCalcArea {
//   double? width;
//   double? height;
//   @override
//   double area() {
//     return width! * height!;
//   }
// }
// class Circle implements ShapeCalcArea {
//   double? r;
//   @override
//   double area() {
//     return r! * 3.14 * r!;
//   }
// }

//! ------------------------------------------

//? Liskov subtitution

// void main(){
//   //! 1 - declare as Animal
//   //! 2 - init is a Dog
//   Animal anim = Dog();
//   anim.makeSound();

//   Animal anim2 = Cat();
//   anim2.makeSound();
// }

// class Animal {
//   void makeSound() {
//     print("Make sound!!!!");
//   }
// }

// class Dog extends Animal{
//   @override
//   void makeSound() {
//     print("Dog Sound!!");
//   }
// }

// class Cat extends Animal{
//   @override
//   void makeSound() {
//     print("Cat Sound");
//   }
// }

// class Rectangle {
//   double? width;
//   double? height;

//   double calcArea() {
//     return width! * height!;
//   }
// }

// class Square extends Rectangle {
//   double? side;

//   @override
//   double calcArea() {
//     return side! * side!;
//   }
// }

// void main() {
//   Shape sh = Rectangle();

//   // instance from class => Constructor
// }

// abstract class Shape {
//   double area();
// }

// class Rectangle implements Shape {
//   double? width;
//   double? height;

//   @override
//   double area() {
//     return width! * height!;
//   }
// }

// class Square implements Shape {
//   double? side;
//   @override
//   double area() {
//     return side! * side!;
//   }
// }

// void main() {
//   Employee dev = Developer();
//   print(dev is Employee);

//   Employee acc = Accountant();
//   // acc.work();
// }

// // Type new instance
// abstract class Employee {
//   void work();
// }

// class Developer implements Employee {
//   @override
//   void work() {
//     print("Workinggggg as Developer");
//   }
// }

// class Accountant implements Employee {
//   @override
//   void work() {
//     print("Workinggggg as Accountant");
//   }
// }

//! ------------------------------------------

//? Interface Segregation

//? interface => abstract class contains abstract method

//! interface
// abstract class Shape {
//   double calcArea();
//   double calcPerimeter();
// }

// abstract class ShapeCalcArea {
//   double calcArea();
// }

// abstract class ShapeCalcPerimeter {
//   double calcPerimeter();
// }

// class Rectangle implements ShapeCalcArea, ShapeCalcPerimeter {
//   double? width;
//   double? height;

//   @override
//   double calcArea() {
//     return width! * height!;
//   }

//   @override
//   double calcPerimeter() {
//     return 2 * (width! + height!);
//   }
// }

//Todo
// abstract class SleepingInterface {
//   void sleep();
// }

// abstract class WorkingInterface {
//   void work();
// }

// class Human implements WorkingInterface, SleepingInterface {
//   void work() => print("I do a lot of work");
//   void sleep() => print("I need 10 hours per night...");
// }

// class Robot implements WorkingInterface {
//   void work() => print("I always work");
// }

//! ------------------------------------------

//? Dependency Inversion

// MessagingService Interface
abstract class MessagingService {
  void sendMessage(String message);
}

class EmailService implements MessagingService {
  @override
  void sendMessage(String message) {
    print("Sending email: $message");
  }
}

class SmsService implements MessagingService {
  @override
  void sendMessage(String message) {
    print("Sending Sms: $message");
  }
}

class WhatsAppService implements MessagingService {
  @override
  void sendMessage(String message) {
    print("Sending WhatsApp: $message");
  }
}

class User {
  MessagingService service;
  User(this.service);

  void sendMessage(String message) {
    service.sendMessage(message);
  }
}

void main() {
  User newUser = User(EmailService());
  newUser.sendMessage("Hello new User");

  User newUser1 = User(SmsService());
  newUser1.sendMessage("Hello new User 1");

  User user3 = User(WhatsAppService());
  user3.sendMessage("Hello from user 3");
}
