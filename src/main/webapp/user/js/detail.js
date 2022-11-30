function getRoomDetails(){
    const url = window.location.href;
    const roomId = url.split("=").at(-1)
    const data = new FormData();
    data.append("idRoom",roomId)
    // (B) AJAX
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "/get-room-details");

}
function formCheckAvailability(){
    const startDate = document.getElementById("start-date").value;
    const endDate = document.getElementById("end-date").value;
    const roomId = window.location.href.split("=").at(-1)
    const data = new FormData();
    data.append("start_date",startDate)
    data.append("end_date",endDate)
    data.append("idRoom",roomId)
    // (B) AJAX
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "/check-availability-room");
    // What to do when server responds
    xhr.onload = function () {
        if(JSON.parse(this.response).message == "success"){
            console.log("redirect...")
            window.location.href = "/booking?"+`room=${roomId}&start=${startDate}&end=${endDate}`
        }else{
            toastError("Sorry This Room  Unavailable")
        }
    };
    xhr.send(data);

    // (C) PREVENT HTML FORM SUBMIT
    return false;
}
