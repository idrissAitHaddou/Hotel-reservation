function formCheckAvailability(){
    const startDate = document.getElementById("start-date").value;
    const endDate = document.getElementById("end-date").value;
    const data = new FormData();
    data.append("start-date",startDate)
    data.append("end-date",endDate)

    console.log(endDate,startDate)

    // (B) AJAX
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "/check-availability-room");
    // What to do when server responds
    xhr.onload = function () { console.log(this.response); };
    xhr.send(data);

    // (C) PREVENT HTML FORM SUBMIT
    return false;
}
