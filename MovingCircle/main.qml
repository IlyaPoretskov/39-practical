import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 400
    height: 200
    title: qsTr("Moving Circle")

    Rectangle {
        id: canvas
        anchors.fill: parent
        color: "lightgray"

        // левый прямоугольник с кнопкой для перемещения шара
        Rectangle {
            id: leftRectangle
            width: 100
            height: 100
            color: "blue"
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 20

            // текст внутри левого прямоугольника
            Text {
                anchors.centerIn: parent
                text: "move"
                color: "white"
            }

            // область мыши для левого прямоугольника
            MouseArea {
                id: leftMouseArea
                anchors.fill: parent
                onClicked: {
                    // если мяч не достиг правого прямоугольника, переместить его вправо
                    if (ball.x + ball.width < rightRectangle.x) {
                        ball.x += 30;
                    } else {
                        state = "ReturnState"; // иначе, вернуть мяч в начальное положение
                    }
                }
            }
        }

        // правый прямоугольник с кнопкой для возвращения шара
        Rectangle {
            id: rightRectangle
            width: 100
            height: 100
            color: "red"
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 20

            // текст внутри правого прямоугольника
            Text {
                anchors.centerIn: parent
                text: "return"
                color: "white"
            }

            // область мыши для правого прямоугольника
            MouseArea {
                id: rightMouseArea
                anchors.fill: parent
                onClicked: {
                    state = "ReturnState"; // установить состояние возвращения при клике
                }
            }
        }

        // сам шар
        Rectangle {
            id: ball
            width: 40
            height: 40
            color: "green"
            radius: 20
            anchors.verticalCenter: parent.verticalCenter
            x: leftRectangle.x + leftRectangle.width + 20
        }

        // определения состояний
        states: [
            State {
                name: "InitialState"
                PropertyChanges {
                    target: ball
                    x: leftRectangle.x + leftRectangle.width + 20
                }
            },
            State {
                name: "ReturnState"
                PropertyChanges {
                    target: ball
                    x: leftRectangle.x + leftRectangle.width + 20
                }
            }
        ]

        // переходы между состояниями
        transitions: [
            Transition {
                from: "*"
                to: "ReturnState"
                reversible: true
                NumberAnimation {
                    properties: "x"
                    duration: 1000
                    easing.type: Easing.OutBounce
                }
            }
        ]
    }
}

