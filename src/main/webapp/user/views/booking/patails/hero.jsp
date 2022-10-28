
<div class="relative opacity-100 flex flex-col justify-between items-center bg-cover bg-bottom p-10 md:py-32 md:px-16">

    <div class="w-full mr-0" style="position: absolute;top: 0;left: 0;right: 0;bottom: 0;z-index: -1;background-image:url('/assets/images/bg.jpg');background-repeat:no-repeat;background-size: cover;filter: contrast(60%);">

    </div>
    <div class="h-96 md:h-64" style="filter:none;">
        <h1 class="flex justify-center text-center mt-16 md:mt-0 mb-5 font-bold text-white">
            Welcome to
            <svg class="mx-2" width="24" height="24" viewBox="0 0 24 24" fill="#fff" xmlns="http://www.w3.org/2000/svg"><path d="m8.654 7.867 2.684-5.448a.75.75 0 0 1 1.346 0l2.683 5.448 6.011.869a.75.75 0 0 1 .416 1.279l-4.347 4.236 1.026 5.986a.75.75 0 0 1-1.089.79l-4.488-2.364a6.5 6.5 0 0 0-9.068-7.09l-1.6-1.558a.75.75 0 0 1 .416-1.28l6.01-.868Z" fill="#fff"/><path d="M12 17.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0ZM3.5 17a.5.5 0 0 0 0 1h4.793l-1.647 1.646a.5.5 0 0 0 .708.708l2.5-2.5a.5.5 0 0 0 0-.708l-2.5-2.5a.5.5 0 0 0-.708.708L8.293 17H3.5Z" fill="#fff"/></svg>
            Hotel
        </h1>
        <h1 class="text-center font-black text-3xl md:text-5xl text-white">A best pace to stay</h1>
        <div class="relative rotate-180 flex justify-center my-6 h-24 mt-20">
            <label class="switch scale-50">
                <div class="round border border-white rounded-full" style="filter: contrast(30%);">
                    <input class="hidden" name="onoff" id="onoff" type="checkbox">
                    <div class="back">
                        <label for="onoff" class="but"><span class="on">0</span><span class="off">I</span></label>
                    </div>
                </div>
            </label>
        </div>
    </div>
    <form action="javascript:fetchRoomByDates()" class="absolute border-2 border-orange -bottom-16 bg-white p-4 rounded w-full md:w-1/2 shadow-lg">
        <div class="flex flex-wrap items-end -mx-3">
            <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                <label for="start-date" class="block uppercase tracking-wide text-gray-500 text-xs font-bold mb-2" >Start date</label>
                <input  id="start-date" name="start_date" type="date" placeholder="start date" class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-grey">

            </div>
            <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                <label for="end-date" class="block uppercase tracking-wide text-gray-500 text-xs font-bold mb-2">End date</label>
                <input  id="end-date" name="end_date" type="date" placeholder="Santorini" class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-grey">
            </div>
            <div class="w-full md:w-1/3 px-3 md:mb-0">
                <button type="submit" class="font-bold leading-tight bg-orange-500 hover:bg-orange-light border border-orange w-full text-white uppercase tracking-wide py-3 px-4 rounded">Search</button>
            </div>
        </div>
    </form>
</div>