#ifndef __WIDGET_H__
#define __WIDGET_H__

#include <QSize>
#include <QWidget>
#include <QVBoxLayout>
#include <QQuickWidget>


class widget : public QWidget {
	Q_OBJECT
	Q_PROPERTY (QSize size READ getSize NOTIFY sizeChanged)
public:
	widget(QWidget *parent = nullptr);
	Q_INVOKABLE QSize getSize()  { return mSize; }
	Q_INVOKABLE bool takeAPrint(QString);
	Q_INVOKABLE void toastMessage(QString);
	Q_INVOKABLE QString getDirOut();

signals:
	void sizeChanged();

private:
	void build();
	void configure();
	void setLayouts();

#ifdef ANDROID
	void getPermission();
#endif

	void setSize(QSize);

	QQuickWidget *mQWidget;
	QVBoxLayout *mVboxLayout;
	QSize mSize;

};

#endif
