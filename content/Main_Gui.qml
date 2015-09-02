import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.XmlListModel 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.0
import QtQuick.Extras 1.4

Rectangle {
    id:rootmaster
    anchors.fill: parent
    color: "#161616"
    //property string currentFeed: rssFeeds.get(0).feed
    property bool isPortrait: Screen.primaryOrientation === Qt.PortraitOrientation
    //property bool loading: feedModel.status === XmlListModel.Loading
    property Component viewControl: ControlView {}
    readonly property color lightBackgroundColor: "#cccccc"
    readonly property color darkBackgroundColor: "#161616"
    property bool isScreenPortrait: height > width
    property color lightFontColor: "#222"
    property color darkFontColor: "#e7e7e7"
    property int index_item: 0
    function toPixels(percentage) {

        return percentage * Math.min(rootmaster.width, rootmaster.height);
    }
    Text {
          id: textSingleton
    }
    //////////////////////// List view content left
    /*ListView {
        id: categories
        property int itemWidth: 190
        width: isPortrait ? rootmaster.width : itemWidth
        height: isPortrait ? itemWidth : rootmaster.height
        orientation: isPortrait ? ListView.Horizontal : ListView.Vertical
        anchors.top: rootmaster.top
        model: rssFeeds
        delegate: CategoryDelegate { itemSize: categories.itemWidth }
        spacing: 3
    }
    ScrollBar {
        id: listScrollBar

        orientation: isPortrait ? Qt.Horizontal : Qt.Vertical
        height: isPortrait ? 8 : categories.height;
        width: isPortrait ? categories.width : 8
        scrollArea: categories;
        anchors.right: categories.right
    }
    RssFeeds { id: rssFeeds }*/

//////////////////////// List view content right
    XmlListModel {
        id: feedModel

        source: "http://" + rootmaster.currentFeed
        //query: "/rss/channel/item[child::media:content]"
        //namespaceDeclarations: "declare namespace media = 'http://search.yahoo.com/mrss/';"
        query: "/rss/channel/item"
        XmlRole { name: "title"; query: "title/string()" }
        // Remove any links from the description
        XmlRole { name: "description"; query: "fn:replace(description/string(), '\&lt;a href=.*\/a\&gt;', '')" }
        //XmlRole { name: "image_m"; query: "media:content/@url/string()" }
        XmlRole { name: "link"; query: "link/string()" }
        XmlRole { name: "pubDate"; query: "pubDate/string()" }
        onSourceChanged: {
            console.log("source change HHH: ",count);
        }


    }

//    Rectangle{
//        id: master_content
//        visible: true
//        color: "#161616"
//        anchors.fill: rootmaster
    FontLoader {
        id: openSans
        source: "../fonts/OpenSans-Regular.ttf"
     }
        property var abcMap: {
            "xổ số Miền Nam": viewControl,
            "xổ số Miền Trung": viewControl,
            "xổ số Miền Bắc": viewControl,
            "xổ số An Giang": viewControl,
            "xổ số Bình Dương": viewControl,
            "xổ số Bình Định": viewControl,
            "xổ số Bạc Liêu": viewControl,
            "xổ số Bình Phước": viewControl,
            "xổ số Bến Tre": viewControl
        }


        StackView {
            id: stackView
            anchors.fill: rootmaster
            x:200
            y:100
            initialItem: ListView {
                model: ListModel{
                    ListElement {
                        title: "xổ số Miền Nam"


                    }
                    ListElement {
                        title: "xổ số Miền Trung"

                    }
                    ListElement {
                        title: "xổ số Miền Bắc"
                    }
                    ListElement {
                        title: "xổ số An Giang"
                    }
                    ListElement {
                        title: "xổ số Bình Dương"
                    }
                    ListElement {
                        title: "xổ số Bình Định"
                    }
                    ListElement {
                        title: "xổ số Bạc Liêu"
                    }
                    ListElement {
                        title: "xổ số Bình Phước"
                    }
                    ListElement {
                        title: "xổ số Bến Tre"
                    }
                }
                delegate: Button{
                    width: stackView.width
                    height: rootmaster.height * 0.125
                    text: title

                    style: BlackButtonStyle {
                        fontColor: rootmaster.darkFontColor
                        rightAlignedIconSource: "qrc:/images/icon-go.png"
                    }

                    onClicked: {
                        console.log("dang bam phim: ",stackView.depth);
                        if (stackView.depth == 1) {

                            // Only push the control view if we haven't already pushed it...
                            //stackView.push({item: abcMap[title]});
                            console.log("list item is: ",stackView.push({item: abcMap[title]}));
                            console.log("my item is: ",stackView.get(0));
                            stackView.currentItem.forceActiveFocus();

                        }
                    }
                }
            }

        }


   // }

}

