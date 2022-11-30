fetchBookingRoom()

function fetchBookingRoom() {
    const roomData = window.location.href.split("?")[1]
    const dates = roomData.split("&")


            $("#check-availability").hide()
    $.ajax({
        url: "/booking-data?" + roomData,
        type: "GET",
        data: {},
        success: function (response) {
            const res = JSON.parse(response);
            if (res.status === "success") {
                if (res.data.length > 0) {
                    extraData();
                    const data = res.data[0]
                    console.log(data)
                    $("#imgBooking").attr("src", "/assets/uploads/rooms/" + data.images[0].src)
                    $("#room-id").html(data.room_number);
                    const start = dates[1].split("=")[1]
                    const end = dates[2].split("=")[1]
                    const date1 = new Date(start);
                    const date2 = new Date(end);
                    const diffTime = Math.abs(date2 - date1);
                    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
                    $("#check-in").html(start);
                    $("#check-out").html(end);
                    $("#days").html(diffDays);
                    $("#total").html("$" + (data.average * diffDays));
                    $("#check-availability").show()
                }else{
                    const url = window.location.href;
                    console.log('no data')
                    const roomId = url.split("?")[1].split("&")[0].split("=")[1]
                    toastError("Sorry This Room  Unavailable")
                    const html = '<div class="flex flex-col items-center justify-center">this room is not available <a href="http://localhost:8080/room-details?room='+roomId+'">try another reservation</a> </div>'
                    $("#check-availability").html(html)
                    $("#check-availability").show()
                }
            }else{
                const url = window.location.href;
                console.log('no data??')
                const roomId = url.split("?")[1].split("&")[0].split("=")[1]
                toastError("Sorry This Room  Unavailable")
                const html = '<div class="flex flex-col items-center justify-center">this room is not available <a href="http://localhost:8080/room-details?room='+roomId+'">try another reservation</a> </div>'
                $("#check-availability").html(html)
                $("#check-availability").show()
            }
        },
        error: function (error) {
            const url = window.location.href;
            console.log('no data')
            const roomId = url.split("?")[1].split("&")[0].split("=")[1]
            toastError("Sorry This Room  Unavailable")
            const html = '<div class="flex flex-col items-center justify-center">this room is not available <a class=" underline text-blue-400" href="http://localhost:8080/room-details?room='+roomId+'">try another reservation</a> </div>'
            $("#check-availability").html(html)
            $("#check-availability").show()
            console.error(error)
        }
    })
}

function extraData() {
    $.ajax({
        url: "/admin/extra/get",
        type: "GET",
        data: {},
        success: function (response) {
            const extras = JSON.parse(response);
            console.log(extras)
            if (extras.length > 0) {

                $("#extra-data").hide()
                let html = ""
                let i = 0;
                for (const extra of extras) {
                    html += '<li><label for="extra-'+extra.id_extra+'" class="flex justify-between items-center text-sm p-2 rounded text-[#8E8E8E] border hover:bg-green-100"><span class=""><input id="extra-'+i+'" type="checkbox" name="extra-'+i+'" value="'+extra.id_extra+'" class="rounded-full text-green-600 border-green-600 border-green-600 focus:outline-none focus:border-none focus:ring-0 "><label for="extra-'+extra.id_extra+'">'+extra.type_extra+'</label></span><span>$'+extra.rate+'</span><span class=""><i class="far fa-question-circle"></i></span></label></li>'
                    i++;
                }
                $("#extra-data").html(html)
                $("#extra-data").show()
            }
        },
        error: function (error) {
            console.error(error)
        }
    })
}

function timeCheckIn(e) {
    const time = e.value.split("-");
    $("#check-in-time").html(time[0]);
    $("#check-out-time").html(time[1]);
}

function submitBookingForm(){
    const arrExtras = []
    let  i = 0
    let doc = document.getElementById("extra-"+i)
    while(doc != null){
        if(doc.checked){
            arrExtras.push(doc.value)
        }
        i++;
        doc = document.getElementById("extra-"+i)
    }
    const extras = arrExtras.join(",");
    const firstname = document.getElementById("firstname");
    const lastname = document.getElementById("lastname");
    const email = document.getElementById("email");
    const tel = document.getElementById("tel");
    const about = document.getElementById("about");
    const Url = new URL(window.location.href);
    const roomId = Url.searchParams.get("room");
    const startDate = Url.searchParams.get("start");
    const endDate = Url.searchParams.get("end");
    console.log("firstname: "+firstname.value)
    console.log("lastname: "+lastname.value)
    console.log("email: "+email.value)
    console.log("tel: "+tel.value)
    console.log("about: "+about.value)
    console.log("extras: "+extras)
    console.log("room_id: "+roomId)
    console.log("start_date: "+startDate)
    console.log("end_date: "+endDate)
    console.log("person-number : "+endDate)
    const data = new FormData();
    data.append("firstname",firstname.value)
    data.append("lastname",lastname.value)
    data.append("email",email.value)
    data.append("tel",tel.value)
    data.append("about",about.value)
    data.append("extras",extras)
    data.append("room_id",roomId)
    data.append("start_date",startDate)
    data.append("end_date",endDate)
    const xhr = new XMLHttpRequest();

    xhr.open("POST", "/booking/room");
    // What to do when server responds
    xhr.onload = function () {
        const res = JSON.parse(this.response);
        console.log(res)
        if(res.status == "success"){
            console.log("redirect...")
            window.location.href = "/checkout?"+`matricule=${res.matricule}&start=${startDate}&end=${endDate}&room=${roomId}`
        }else{
            console.log("Sorry This Room  Unavailable")
        }
    };
    xhr.send(data);
    return false;
}