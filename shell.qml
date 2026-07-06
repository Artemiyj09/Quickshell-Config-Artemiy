import Quickshell
import Quickshell.Wayland
import QtQuick
import Quickshell.Hyprland
import QtQuick.Layouts
import Quickshell.Io
import QtMultimedia
import QtQuick.Controls
import Quickshell.Bluetooth
import QtQuick.Window


ShellRoot {



//DATE //UTILISE THE MOUSEAREA PRESSED AND RELEASED https://doc.qt.io/qt-6/qml-qtquick-mousearea.html#clicked-signal
PanelWindow {
	id:c1
	// Theme - Defining once to use everywhere Dark/light background & text, including misc colors
	property color dbg:"#242424"
	property color lbg: "#bcbaa8"
	property color dbgt: "#bcbaa8"
	property color lbgt: "#242424"
	property color active: '#474948'
	property color relic: "#AFACE1"
	property string fontFamily: "Adwaita Sans"

	property bool date: false
	property bool hoverc: false

		anchors.top: true
		margins.top: 8
		anchors.right: true
    	margins.right: 125
		implicitHeight: 35
		implicitWidth: 80
		color: "transparent"

MouseArea {
	anchors.fill: parent 
	hoverEnabled: true 	    
	cursorShape: Qt.PointingHandCursor
	onEntered: {
		c1.date = true; c1.hoverc = true
	}
	onExited: {
		c1.date = false; c1.hoverc = false
	}
}

		Rectangle {
		anchors.fill: parent
		color: c2.lbg // Makes the rectangle invisible
		radius: 5
	

	Text{
		id: date
		color: c1.hoverc ? c1.active : c1.lbgt
		scale: c1.hoverc ? 1.05 : 1

Behavior on scale { NumberAnimation { duration: 500; easing.type: Easing.OutQuad}}
Behavior on color { ColorAnimation { duration: 200 }}



	text: Qt.formatDateTime(new Date(), "dd-MM")

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: date.text = Qt.formatDateTime(new Date(), "dd-MM")
    }
		anchors.centerIn: parent

		font {  
		pixelSize: 20
        bold: true
        family: c1.fontFamily
		}
	}
}}

//fulldatedropbox
PanelWindow {
id:dbx

	property color dbg:"#242424"
	property color lbg: "#bcbaa8"
	property color dbgt: "#bcbaa8"
	property color lbgt: "#242424"
	property color diomedes: "#E2AA95"
	property string fontFamily: "Adwaita Sans"
	property color active: '#474948'

//c1.date is the correct variable

	implicitWidth: 120
	implicitHeight: 24

Behavior on implicitHeight { NumberAnimation { duration: 3000 }}

anchors.right: true
anchors.top: true
margins.top: 43
margins.right: 105
color: "transparent"



Rectangle {
    id: dbxRect
    color: dbx.lbg
    bottomLeftRadius: 10
    bottomRightRadius: 10

    // Live-bound to width — recalculates every frame as width animates
    topLeftRadius: width > 80 ? 10 : 0
    topRightRadius: width > 80 ? 10 : 0

    Behavior on topLeftRadius { NumberAnimation { duration: 150; easing.type: Easing.OutCubic } }
    Behavior on topRightRadius { NumberAnimation { duration: 150; easing.type: Easing.OutCubic } }

    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter


	MouseArea {
	anchors.fill: parent 
	hoverEnabled: true 	    
	cursorShape: Qt.PointingHandCursor
	onEntered: {
		c1.date = true; c1.hoverc = true
	}
	onExited: {
		c1.date = false; c1.hoverc = false
	}
}

    state: c1.date ? "expanded" : "collapsed"

    states: [
        State {
            name: "collapsed"
            PropertyChanges { target: dbxRect; height: 0; width: 45 }
            PropertyChanges { target: dateText; font.pixelSize: 1; opacity: 0; scale: 0.85 }
        },
        State {
            name: "expanded"
            PropertyChanges { target: dbxRect; height: 24; width: 120 }
            PropertyChanges { target: dateText; font.pixelSize: 16; opacity: 1; scale: 1 }
        }
    ]

    transitions: [
        Transition {
            from: "collapsed"; to: "expanded"
            SequentialAnimation {
                NumberAnimation { target: dbxRect; property: "height"; duration: 300; easing.type: Easing.OutCirc }
                PauseAnimation { duration: 50 }
                NumberAnimation { target: dbxRect; property: "width"; duration: 200; easing.type: Easing.OutCirc }
                PauseAnimation { duration: 50 }
                NumberAnimation { target: dateText; property: "font.pixelSize"; duration: 100; easing.type: Easing.OutQuart }
                ParallelAnimation {
                    NumberAnimation { target: dateText; property: "opacity"; duration: 100; easing.type: Easing.OutCubic }
                    NumberAnimation { target: dateText; property: "scale"; duration: 100; easing.type: Easing.OutBack }
                }
            }
        },
        Transition {
            from: "expanded"; to: "collapsed"
            SequentialAnimation {
                ParallelAnimation {
                    NumberAnimation { target: dateText; property: "opacity"; duration: 100; easing.type: Easing.InCubic }
                    NumberAnimation { target: dateText; property: "scale"; duration: 100; easing.type: Easing.InCubic }
                }
                NumberAnimation { target: dateText; property: "font.pixelSize"; duration: 100; easing.type: Easing.OutQuart }
                PauseAnimation { duration: 150 }
                NumberAnimation { target: dbxRect; property: "width"; duration: 200; easing.type: Easing.OutCirc }
                PauseAnimation { duration: 150 }
                NumberAnimation { target: dbxRect; property: "height"; duration: 300; easing.type: Easing.OutCirc }
            }
        }
    ]

    Text {
        id: dateText
	text: Qt.formatDateTime(new Date(), "ddd, dd MMM yy")
		
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        transformOrigin: Item.Center
        font {
            bold: true
            family: c1.fontFamily
        }
        color: dbx.lbgt

 Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: date.text = Qt.formatDateTime(new Date(), "ddd, dd MMM yy")
    }

    }
}}



//TIME
PanelWindow {
	id:c2
	color: "transparent"
	// Theme - Defining once to use everywhere Dark/light background & text, including misc colors
	property color dbg:"#242424"
	property color lbg: "#bcbaa8"
	property color dbgt: "#bcbaa8"
	property color lbgt: "#242424"
	property color diomedes: "#E2AA95"
	property string fontFamily: "Adwaita Sans"

		anchors.top: true
		margins.top: 8
		anchors.right: true
    	margins.right: 27
		implicitHeight: 35
		implicitWidth: 80

		Rectangle {
		anchors.fill: parent
		color: c2.lbg // Makes the rectangle invisible
		radius: 5
	}

MouseArea {
        anchors.fill: parent // Makes the whole rectangle clickable
        
        // This runs when you click it
        onClicked: {
            command: ("nem")
        }
    }

	Text{
		id: clock
		color: c2.lbgt

	text: Qt.formatDateTime(new Date(), "hh:mm")

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "hh:mm")
    }
		anchors.centerIn: parent

		font {  
		pixelSize: 20
        bold: true
        family: c2.fontFamily
		}
}

}
//seperatorR

PanelWindow {
	id:sepR
	// Theme - Defining once to use everywhere Dark/light background & text, including misc colors
	property color dbg:'#2F2F2F'
	property color lbg: "#E2AA95"
	property color dbgt: "#2F2F2F"
	property color lbgt: "#BCBAA8"
	property color diomedes: "#E2AA95"
	property string fontFamily: "Adwaita Sans"

	anchors.top: true
	margins.top: 11 
	anchors.right: true
	margins.right: 112
	implicitHeight: 30
	implicitWidth: 8
	color: "transparent"

Rectangle {
		anchors.fill: parent
		color: sepR.dbg // Makes the rectangle invisible
		radius: 12

Rectangle {

		anchors.verticalCenter: parent.verticalCenter
		height: 20
		anchors.horizontalCenter: parent.horizontalCenter
		implicitWidth: 2
		radius: 2
		color: sepR.lbg // Makes the rectangle invisible
}


}}


//WORKSPACEMENU, I want it to extend to the right with animation.
PanelWindow {
	id:wsb
	// Theme - Defining once to use everywhere Dark/light background & text, including misc colors
	property color dbg:"#2F2F2F"
	property color lbg: "#A8A69D"
	property color dbgt: "#A8A69D"
	property color lbgt: "#2F2F2F"
	property color relic: "#AFACE1"
	property string fontFamily: "Adwaita Sans"

	property bool expanded: false //starts as false
	

		anchors.top: true
		margins.top: 8
		anchors.left: true
		margins.left: 27
		implicitHeight: 35
		implicitWidth: 150
		color: "transparent"


		
//THIS IS THE EXTENDED BIT, THE TRAY.
Rectangle {
		anchors.left: parent.left
		color: wsb.dbg 
		height: wsb.expanded ? 32 : 34
		anchors.verticalCenter: parent.verticalCenter
		width: wsb.expanded ? 140 : 34
		radius: 4
		Behavior on width { NumberAnimation { duration: 300; easing.type: Easing.OutCubic }}
		Behavior on height { NumberAnimation { duration: 300; easing.type: Easing.OutCubic }}

MouseArea {
		anchors.fill: parent
		hoverEnabled: true
		onEntered: {
			wsb.expanded = true
		}
		onExited: {
			wsb.expanded = false
		}
		}

RowLayout { 
	anchors.verticalCenter: parent.verticalCenter
	anchors.left: parent.left
	anchors.leftMargin: wsb.expanded ? 48 : -100
	Behavior on anchors.leftMargin { NumberAnimation { duration: 400; easing.type: Easing.OutCirc}}
	spacing: 10
	Layout.fillWidth: true

	Repeater {
		
		model: 3
//Repeating rectangle, the button for the workspaces
//main rectangle
Rectangle {
			width: 18
			height: 18					
			radius: isActive ? 3 : 8
			Behavior on radius { NumberAnimation { duration: 200; easing.type: Easing.OutQuad}}
			color: isActive ? wsb.relic : (isOccupied ? wsb.dbgt : wsb.lbg)

			property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
			property bool isOccupied: Hyprland.workspaces.values.some(w => w.id === (index + 1))

			Behavior on color { ColorAnimation { duration: 200 } }

			MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onClicked: {
        console.log("clicked workspace", index + 1)
        Hyprland.dispatch("hl.dsp.focus({ workspace = " + (index + 1) + " })")
	}}}}}}

	// originalbutton

Rectangle {
	height: 35
	width: 35
	color: wsb.dbg
	radius: 4
	Text {
	text: ""
	y: -1.5
	x: 8
	color: wsb.relic
	anchors.horizontalCenter: parent.horizontalCenter
	font.pixelSize: 25
	scale: wsb.expanded ? 0.95 : 1.1
	Behavior on scale { NumberAnimation { duration: 400; easing.type: Easing.OutBack }}
			}

	MouseArea {
		anchors.fill: parent
		hoverEnabled: true
		onEntered: {
			wsb.expanded = true
		}
		onExited: {
			wsb.expanded = false
		}
		}
	}		
}

//seperatorL

PanelWindow {
	id:sepL
	// Theme - Defining once to use everywhere Dark/light background & text, including misc colors
	property color dbg:'#2F2F2F'
	property color lbg: "#AFACE1"
	property color dbgt: "#2F2F2F"
	property color lbgt: "#BCBAA8"
	property color diomedes: "#E2AA95"
	property color odysseus: "#DB7881"
	property string fontFamily: "Adwaita Sans"

		anchors.top: true
		margins.top: 11 
		anchors.left: true
	margins.left: wsb.expanded ? 170 : 65
		implicitHeight: 30
		implicitWidth: 8
		color: "transparent"

Rectangle {
		anchors.fill: parent
		color: sepL.dbg // Makes the rectangle invisible
		radius: 12

Rectangle {

		anchors.verticalCenter: parent.verticalCenter
		height: 20
		anchors.horizontalCenter: parent.horizontalCenter
		implicitWidth: 2
		radius: 2
		color: sepL.lbg // Makes the rectangle invisible
}}}

PanelWindow { 
	id: sb

	property color diomedes: "#E2AA95"
	property color dbg: "#2F2F2F"
	property bool searchbutton: false


	anchors.top: true
	anchors.right: true
	implicitWidth: 35
	implicitHeight: 35
	margins.top: 8
	margins.right: 210
	color: "transparent"





Rectangle {
	anchors.fill: parent
	radius: 4
	color: sb.dbg
MouseArea {
	anchors.fill: parent
	hoverEnabled: true
	onEntered: {
		sb.searchbutton = true
	}
	onExited: {
		sb.searchbutton = false
	}
	onClicked: {
		wsb.expanded = true
	}
	onDoubleClicked: {
		wsb.expanded = false
	}
	}

Text {
	text: ""
	x: 8
	font.pixelSize: 28
	scale: sb.searchbutton ? 1.15 : 1
	Behavior on scale { NumberAnimation { duration: 500; easing.type: Easing.OutBack }}
	y: -4
	color: sb.diomedes

}}}






}//DONT TOUCH THIS IS THE SHELL ROOT CLOSED BRACKET
