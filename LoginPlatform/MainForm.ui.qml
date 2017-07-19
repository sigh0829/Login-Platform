import QtQuick 2.5

Rectangle {

    id:mainForm
    width: root.width
    height: root.height
    anchors.fill: root


    Image {
        id: image1
        width: mainForm.width
        height: mainForm.height
        source: "images/backgroud.jpg"
        anchors.fill: mainForm
    }
	
}
