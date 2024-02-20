#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[]) {
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    QCoreApplication::setApplicationName(QString::fromUtf8(PROJECT_NAME));
    QCoreApplication::setOrganizationName("QtProject");
    QCoreApplication::setApplicationVersion(QString::fromUtf8(PROJECT_VERSION));

    QQmlApplicationEngine engine;

    engine.addImportPath(":/astrodynamic.com/imports");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("QtQuickQuests_Module", "Main");

    return app.exec();
}
