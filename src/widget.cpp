#include "widget.h"

#include <QRect>
#include <QApplication>
#include <QDesktopWidget>
#include <QStringList>
#include <QMessageBox>
#include <QQmlContext>
#include <QQmlError>
#include <QFile>
#include <QList>
#include <QUrl>

#include <QQuickItem>
#include <QPrinter>
#include <QPainter>
#include <QImage>
#include <QDebug>

#include <QLabel>

#include <QFontDatabase>

#ifdef ANDROID
	#include <QAndroidJniObject>
	#include <QtAndroid>
	#include <thread>
#endif

widget::widget(QWidget *parent) : QWidget(parent) {
	build();
	configure();
	setLayouts();

	//toastMessage("test");
	qDebug() << "appending font " << QFontDatabase::addApplicationFont(":/font1.otf");
	qDebug() << "appending font " << QFontDatabase::addApplicationFont(":/font2.ttf");
	qDebug() << "appending font " << QFontDatabase::addApplicationFont(":/font3.ttf");
	qDebug() << "appending font " << QFontDatabase::addApplicationFont(":/font4.ttf");
	qDebug() << "appending font " << QFontDatabase::addApplicationFont(":/font5.ttf");
}


void widget::build() {
	mVboxLayout = new QVBoxLayout(this);
	mQWidget = new QQuickWidget(this);
}


void widget::configure() {
	QRect rect = QApplication::desktop()->screenGeometry();
	setSize(QSize(rect.width(), rect.height()*.95));


	QQmlContext *obj = mQWidget->rootContext();
	obj->setContextProperty("widget", this);
	mQWidget->setSource(QUrl(QStringLiteral("qrc:/main.qml")));
	
	QList<QQmlError> errors = mQWidget->errors();
	if (errors.count() > 0) {
		QStringList errorsString;
		for (QQmlError error : errors)
			errorsString += tr("<h1>%1</h1><p>%2:%3 %4</p><br>")
				.arg(error.url().toString())
				.arg(error.line())
				.arg(error.column())
				.arg(error.description());
		QMessageBox::warning(this, "something is wrong", errorsString.join("<br>"));
		QFile file_log("/sdcard/qml_errors.log");
                file_log.open(QIODevice::WriteOnly | QIODevice::Text);
                file_log.write(errorsString.join("\n").toStdString().c_str());
                file_log.flush();                                                                         file_log.close();
                QWidget::close();
	}


}

void widget::setLayouts() {
	mVboxLayout->addWidget(mQWidget);
	mVboxLayout->setMargin(0);
	QWidget::setLayout(mVboxLayout);
}


bool widget::takeAPrint(QString filename) {
	QSize tsize = mSize;
	setSize(QSize(200*5, 275*5));
	QPrinter printer;
	printer.setOutputFormat(QPrinter::PdfFormat);
	printer.setOutputFileName(filename);
	printer.setPageSize(QPageSize(mSize/2));
	printer.setPageMargins(QMarginsF(0,0,0,0));

	QPainter paint;
	qDebug() << "begin saving";
	if (! paint.begin(&printer)) {
		qDebug() << "can't start saving";
		return false;
	}

	QPixmap pixmap = mQWidget->grab();
	QRect rect = QRect(0,0, mSize.width(), mSize.height());
	paint.drawPixmap(rect, pixmap, rect);
	qDebug() << "end saving" << paint.end();
	setSize(tsize);
	return true;
}

void widget::setSize(QSize size) {
	mSize = size;
	mQWidget->setFixedSize(mSize);
	setFixedSize(mSize);
	emit sizeChanged();
}

QString widget::getDirOut() {
#ifdef ANDROID
	getPermission();
	return "/sdcard";
#else
	return "/tmp";
#endif
}


void widget::toastMessage(QString msg) {
#ifdef ANDROID
	QtAndroid::runOnAndroidThread([msg] {
		QAndroidJniObject txt = QAndroidJniObject::fromString(msg);
		QAndroidJniObject toast = QAndroidJniObject::callStaticObjectMethod(
				"android/widget/Toast", "makeText",
				"(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;",
					QtAndroid::androidActivity().object(),
					txt.object(),
					jint(1));
		toast.callMethod<void>("show");
	});
#else
	QMessageBox::information(this, "information", msg);
#endif

}

#ifdef ANDROID
void widget::getPermission() {
	QString w = "android.permission.WRITE_EXTERNAL_STORAGE";
	QString r = "android.permission.READ_EXTERNAL_STORAGE";
	while (QtAndroid::checkPermission(w) == QtAndroid::PermissionResult::Denied)
			QtAndroid::requestPermissionsSync({w});
	while (QtAndroid::checkPermission(w) == QtAndroid::PermissionResult::Denied)
			QtAndroid::requestPermissionsSync({w});

}
#endif
