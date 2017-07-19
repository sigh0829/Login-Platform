import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    signal submitTextAuthentication(string text)

    // this function is our QML slot
    function setTextAuthentication(text){
        console.log("setTextField: " + text)
        username.text = text
    }

    id:root
    visible: true
    width: 1240
    height: 780
    title: qsTr("Login Platform")




    MainForm {

        radius: 0
        border.width: 2
        anchors.rightMargin: -39
        anchors.bottomMargin: -52
        anchors.leftMargin: 39
        anchors.topMargin: 52
        anchors.fill: root

        Rectangle {
            id: clock
            x: 39
            y: 222
            width: 361
            height: 181
            color: "#00000000"
            border.width: 2

            Label {
                id: time
                x: 33
                y: 59
                width: 295
                height: 64
                color: "#4c4105"
                text: qsTr("00 : 00 : 00")
                font.pointSize: 40


            }
            Label {
                id: timeYear
                x: 75
                y: 125
                width: 215
                height: 40
                color: "#1717df"
                text: qsTr("")
                font.pointSize: 15
            }



            Timer {
                   id: textTimer
                   interval: 1000
                   repeat: true
                   running: true
                   triggeredOnStart: true
                   onTriggered:{

                       function set_time(){
                           var date = new Date();
                           var hour = date.getHours();
                           var minute = date.getMinutes();
                           var second = date.getSeconds();
                           var hours,minutes,seconds;

                           var month = date.getMonth();
                           var year = date.getFullYear().toString().substr(-2);
                           var day = date.getDay();
                           var monthNames =  ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                                              "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                           var dayName = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday",
                                             "Sunday"];
                           if(hour < 10){
                               hours = "0"+hour;
                           }else{
                               hours = hour;
                           }
                           if(minute < 10){
                               minutes = "0"+minute;
                           }else{
                               minutes = minute;
                           }
                           if(second < 10){
                               seconds = "0"+second;
                           }else{
                               seconds = second;
                           }

                           timeYear.text = dayName[day] + ","+monthNames[month] + " "+ year;
                           time.text = hours + " : " + minutes + " : " + seconds;
                       }


                        set_time()

                   }
               }



        }
    }


    Rectangle{

        id:login
        width: 400
        height: 200
        color:"transparent"
        x:root.width / 2 + 190
        y:root.height /2 - 120

            TextField {
                id:username
                placeholderText: "User Name";
                font.pointSize: 15;
                anchors{
                    top: login.top;
                    topMargin: 5;
                    left: login.left;
                    leftMargin: 5;
                }
            }

            TextField {
                id:password
                placeholderText: "Password"
                font.pointSize: 15;
                anchors{
                    top: login.top;
                    topMargin: 40;
                    left: login.left;
                    leftMargin: 5;
                }
            }




            Button {
                id:send
                text: "Login"
                width: 100
                height: 30
                anchors{
                    top: login.top;
                    topMargin: 80;
                    left: login.left;
                    leftMargin: 5;
                }
                onClicked: {
                    console.log("Login Click")
                    // emit the submitTextField signal
                    submitTextAuthentication(username.text + "|" + password.text)
                }


            }
        }







}
