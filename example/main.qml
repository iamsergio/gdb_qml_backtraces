import QtQuick 2.5

Rectangle {
    color: "red"
    width: 500
    height: 500

    property int someIndirection: 0
    property int someIndirection2: 0

    Text {
        text: "click to crash"
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            someIndirection = 1;
        }
    }

    onSomeIndirectionChanged: {
        if (someIndirection > 0)
            someIndirection2 = 1;
    }

    onSomeIndirection2Changed: {
        if (someIndirection2 > 0)
            _controller.crash();
    }
}
