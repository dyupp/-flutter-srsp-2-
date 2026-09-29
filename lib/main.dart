import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SRSP 2',
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // Переменная для переключения между image1.jpg и image2.jpg
  bool _isFirstImage = true;

  /*
   * КОММЕНТАРИИ К СВОЙСТВУ BoxFit (Задание 1, пункт 7-8):
   * BoxFit.fill      - Растягивает картинку под размер контейнера, искажая пропорции.
   * BoxFit.contain   - Вписывает всё изображение целиком с сохранением пропорций (могут быть пустые поля).
   * BoxFit.cover     - Заполняет всю область контейнера с сохранением пропорций, обрезая лишние края.
   * BoxFit.fitWidth  - Масштабирует картинку по ширине контейнера.
   * BoxFit.fitHeight - Масштабирует картинку по высоте контейнера.
   * BoxFit.none      - Отображает изображение в оригинальном разрешении без масштабирования.
   * BoxFit.scaleDown - Уменьшает изображение, если оно больше контейнера, но не увеличивает маленькие.
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SRSP 2: Images & Buttons'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // Пункт 9: Виджет Stack с картинкой, темным оверлеем и текстом
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  width: 320,
                  height: 200,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Фоновое изображение
                      Image.asset(
                        _isFirstImage
                            ? 'assets/image1.jpg'
                            : 'assets/image2.jpg',
                        fit: BoxFit.cover,
                      ),

                      // Полупрозрачный черный контейнер
                      Container(
                        color: Colors.black.withOpacity(0.45),
                      ),

                      // Текст поверх контейнера
                      const Center(
                        child: Text(
                          'Welcome to Flutter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Пункт 10: ElevatedButton (Show SnackBar)
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello! This is SnackBar!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text(
                  'Show SnackBar',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Пункт 11: TextButton (Go to Second Screen)
            SizedBox(
              width: 200,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Go to Second Screen',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Пункт 12: OutlinedButton (Toggle Image)
            SizedBox(
              width: 200,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black, width: 1.5),
                ),
                onPressed: () {
                  setState(() {
                    _isFirstImage = !_isFirstImage;
                  });
                },
                child: const Text(
                  'Toggle Image',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// Второй экран для перехода по TextButton
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'This is the Second Screen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}