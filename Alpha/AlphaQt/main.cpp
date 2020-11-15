#include<QApplication>
#include<QPushButton>
int main(int argc, char **argv)
{
    QApplication app(argc,argv);


   QWidget window;
   window.setFixedSize(100,100);
   QPushButton button("hello world",&window);
   button.setGeometry(10, 10, 80,30);
    window.show();


    return app.exec();
}
