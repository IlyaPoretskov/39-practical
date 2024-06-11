import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 300
    height: 200
    title: qsTr("Phone Number Validator")

    Column {
        anchors.centerIn: parent

        TextField {
            id: inputField
            placeholderText: "Enter phone number"
            width: 250
            onTextChanged: validateInput()
        }

        Text {
            id: validationResult
            text: "Not Ok"
            color: "red"
        }
    }

    function validateInput() {
        var regex = /^\+{1}[0-9]{11}$/;
        if (regex.test(inputField.text)) {
            validationResult.text = "Ok"
            validationResult.color = "green"
        } else {
            validationResult.text = "Not Ok"
            validationResult.color = "red"
        }
    }
}
