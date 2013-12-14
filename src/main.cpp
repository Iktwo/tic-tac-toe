#include <QGuiApplication>
#include <QQuickView>
#include <QQmlEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view;
    QObject::connect(view.engine(), SIGNAL(quit()), QCoreApplication::instance(), SLOT(quit()));

    view.setResizeMode(QQuickView::SizeRootObjectToView);

    view.setSource(QUrl("qrc:/qml/qml/main.qml"));
    view.show();

    return app.exec();
}
