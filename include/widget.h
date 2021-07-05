#ifndef __WIDGET_H__
#define __WIDGET_H__

#include <QSize>
#include <QWidget>
#include <QVBoxLayout>
#include <QQuickWidget>


class Widget : public QWidget {
	Q_OBJECT
	Q_PROPERTY (QSize size READ getSize NOTIFY sizeChanged)
public:
	Widget(QWidget *parent = nullptr);
	Q_INVOKABLE QSize getSize()  { return mSize; }
	Q_INVOKABLE bool takeAPrint(QString);


signals:
	void sizeChanged();

private:
	void build();
	void configure();
	void setLayouts();

	void setSize(QSize);

	QQuickWidget *mQWidget;
	QVBoxLayout *mVboxLayout;
	QSize mSize;

};

#endif
