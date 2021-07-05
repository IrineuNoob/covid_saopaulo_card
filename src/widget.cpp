#include "Widget.h"

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

Widget::Widget(QWidget *parent) : QWidget(parent) {
	build();
	configure();
	setLayouts();

	qDebug() << "appending font " << QFontDatabase::addApplicationFont(":/font1.otf");
	qDebug() << "appending font " << QFontDatabase::addApplicationFont(":/font2.ttf");
	qDebug() << "appending font " << QFontDatabase::addApplicationFont(":/font3.ttf");
	qDebug() << "appending font " << QFontDatabase::addApplicationFont(":/font4.ttf");
	qDebug() << "appending font " << QFontDatabase::addApplicationFont(":/font5.ttf");
	QFontDatabase font;
	qDebug() << "______families___ " << font.families();
}


void Widget::build() {
	mVboxLayout = new QVBoxLayout(this);
	mQWidget = new QQuickWidget(this);
}


void Widget::configure() {
	QRect rect = QApplication::desktop()->screenGeometry();
	mSize = QSize(rect.width(), rect.height()*.95);
	emit sizeChanged();

	mQWidget->setFixedSize(mSize);
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

void Widget::setLayouts() {
	mVboxLayout->addWidget(mQWidget);
	mVboxLayout->setMargin(0);
	QWidget::setLayout(mVboxLayout);
}


bool Widget::takeAPrint(QString filename) {
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

void Widget::setSize(QSize size) {
	mSize = size;
	mQWidget->setFixedSize(mSize);
	emit sizeChanged();
}
