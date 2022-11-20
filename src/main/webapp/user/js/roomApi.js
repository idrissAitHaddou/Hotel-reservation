fetchRooms()
function fetchRooms() {
    console.log(window.location.href.split("=")[1])
    $.ajax({
        url : "/admin/room/one/details",
        type : "GET",
        data:{
            id: window.location.href.split("=")[1]

        },
        success : function (response){
            const dataRoom = JSON.parse(response)[0]
            console.log(response)
            const arrImages = dataRoom.images
            let btn = "";
            let image = "<div class='duration-700 ease-in-out absolute inset-0  transition-all transform translate-x-0 z-30' data-carousel-item=''><img src='/assets/uploads/rooms/" + arrImages[0].src + "' class='absolute block md:w-2/3 w-full md:px-12 px-6 rounded -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2' alt='...'></div>"
            btn += '<button type="button" class="w-3 h-3 rounded-full bg-white dark:bg-gray-800" aria-current="true" aria-label="Slide '+0+'" data-carousel-slide-to="'+0+'"></button>'
            for (let i = 1; i < arrImages.length; i++) {
                image += "<div class='duration-700 ease-in-out absolute inset-0  transition-all transform translate-x-0 z-"+i*10+"' data-carousel-item='active'><img src='/assets/uploads/rooms/" + arrImages[i].src + "' class='absolute block md:w-2/3 w-full md:px-12 px-6 rounded -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2' alt='...'></div>"
                btn += '<button type="button" class="w-3 h-3 rounded-full bg-white/50 dark:bg-gray-800/50 hover:bg-white dark:hover:bg-gray-800" aria-current="false" aria-label="Slide '+i+'" data-carousel-slide-to="'+i+'"></button>'


            }
            $("#image-slider").html(image)
            $("#button-slider").html(btn)
        },
        error : function (error){
            console.error(error)
        }
    })
}


