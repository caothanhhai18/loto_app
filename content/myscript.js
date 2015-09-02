    function timeSinceEvent(pubDate) {
        var result = pubDate;

        // We need to modify the pubDate read from the RSS feed
        // so the JavaScript Date object can interpret it
        var d = pubDate.replace(',','').split(' ');
        if (d.length !== 6)
            return result;

        var date = new Date([d[0], d[2], d[1], d[3], d[4], 'GMT' + d[5]].join(' '));

        if (!isNaN(date.getDate())) {
            var age = new Date() - date;
            var minutes = Math.floor(Number(age) / 60000);
            if (minutes < 1440) {
                if (minutes < 2)
                    result = qsTr("Just now");
                else if (minutes < 60)
                    result = '' + minutes + ' ' + qsTr("minutes ago")
                else if (minutes < 120)
                    result = qsTr("1 hour ago");
                else
                    result = '' + Math.floor(minutes/60) + ' ' + qsTr("hours ago");
            }
            else {
                result = date.toDateString();
            }
        }
        console.log("my box HHHH: ",result);
        return result;
    }

function do_final_result(input_string,id){
    var size = input_string.length;
    var result= "" ;
    var i;
    if (id === 8){
       for(i=0;i<size;i++){
            result += input_string[i];
       }
    }else{
        for(i=0;i<size - 1;i++){
             result += input_string[i];
        }
    }
    console.log(id,"is: ",result);
    //return result;
}

function extract_string(input_string) {
 console.log("my des hh is : ",input_string)
 var d = input_string.replace(/\n/g,"");
 var e = d.replace(/ /g,"");
 var f = e.split(":");
 var spec = f[1].split("");
 do_final_result(spec,0);
 var one = f[2].split("");
 do_final_result(one,1);
 var two = f[3].split("");
 do_final_result(two,2);
 var three = f[4].split("");
 do_final_result(three,3);
 var four = f[5].split("");
 do_final_result(four,4);
 var five = f[6].split("");
 do_final_result(five,5);
 var six = f[7].split("");
 do_final_result(six,6);
 var seven = f[8].split("");
 do_final_result(seven,7);
 var eight = f[9].split("");
 do_final_result(eight,8);
}
function analy_data(select_data){
 var spec_input ;
    spec_input += select_data;
 console.log("sum string: ",spec_input);

}
