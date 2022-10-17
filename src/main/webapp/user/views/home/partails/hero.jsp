
<div class="relative flex justify-between items-center bg-cover bg-bottom p-10 md:py-32 md:px-16" style="background-image:url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/128422/hero-2.jpg');">

    <form class="bg-smoke-dark p-6 md:p-10 rounded md:w-1/2 shadow-lg">

        <h1 class="font-serif text-2xl md:text-3xl leading-tight text-center font-normal text-white mb-8">Find your room today, your welcome</h1>

        <div class="flex flex-wrap items-end -mx-3">
            <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                <label class="block uppercase tracking-wide text-white text-xs font-bold mb-2" for="grid-city">Start date</label>
                <input class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-grey" id="grid-city" type="date" placeholder="Santorini">

            </div>
            <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                <label class="block uppercase tracking-wide text-white text-xs font-bold mb-2" for="grid-city">End date</label>
                <input class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-grey" id="gridd-city" type="date" placeholder="Santorini">
            </div>
            <div class="w-full md:w-1/3 px-3 md:mb-0">
                <button class="font-bold leading-tight bg-red hover:bg-red-light border border-red hover:border-red-light w-full text-white uppercase tracking-wide py-3 px-4 rounded">Search</button>
            </div>
        </div>

    </form>
    <img class="hidden md:block absolute rounded-lg -rotate-12 top-18 right-24 w-80 h-80" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/128422/hero-2.jpg">

</div>

<div class="flex justify-center gap-12">
    <jsp:include page="roomCart.jsp"/>
    <jsp:include page="roomCart.jsp"/>
    <jsp:include page="roomCart.jsp"/>
    <jsp:include page="roomCart.jsp"/>
</div>