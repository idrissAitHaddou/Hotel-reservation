<!-- Main modal -->
<div id="booking-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full">
  <div class="relative p-4 w-full h-full md:h-auto">
    <!-- Modal content -->
    <div class="w-3/5 mx-auto relative bg-white rounded-lg shadow">
      <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white" data-modal-toggle="booking-modal">
        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
        <span class="sr-only">Close modal</span>
      </button>
      <div class="py-6 px-6 lg:px-8">
        <h3 class="mb-4 text-xl font-medium text-gray-900 dark:text-white">Booking details</h3>
        <form class="space-y-6" action="#">
          <div class="mb-6 flex md:flex-row flex-col justify-between">
            <div class="w-full">
              <label for="username-success" class="block mb-2 text-sm font-medium text-green-700 dark:text-green-500">Number</label>
              <input type="number" id="username-success" class="bg-green-50 border border-green-500 text-green-900 placeholder-green-700 text-sm rounded-lg focus:ring-green-500 focus:border-green-500 block w-full p-2.5 dark:bg-green-100 dark:border-green-400" placeholder="Bonnie Green">
              <p class="mt-2 text-sm text-green-600 dark:text-green-500"><span class="font-medium">Great!</span> Number is available</p>
            </div>
            <div class="w-full ml-2">
              <label for="username-success" class="block mb-2 text-sm font-medium text-green-700 dark:text-green-500">Floor number</label>
              <input type="text" id="usernam-success" class="bg-green-50 border border-green-500 text-green-900 placeholder-green-700 text-sm rounded-lg focus:ring-green-500 focus:border-green-500 block w-full p-2.5 dark:bg-green-100 dark:border-green-400" placeholder="Bonnie Green">
              <p class="mt-2 text-sm text-green-600 dark:text-green-500"><span class="font-medium">Great!</span> Floor number is valid</p>
            </div>
            <div class="w-full ml-2">
              <label for="usendfame-success" class="block mb-2 text-sm font-medium text-green-700 dark:text-green-500">Type</label>
              <select id="usendfame-success" class="bg-green-50 border border-green-500 text-green-900 placeholder-green-700 text-sm rounded-lg focus:ring-green-500 focus:border-green-500 block w-full p-2.5 dark:bg-green-100 dark:border-green-400" placeholder="Bonnie Green">
                <option value="" disabled selected>--SELECT TYPE--</option>
                <option value="">Single room</option>
                <option value="">Double room</option>
                <option value="">Triple room</option>
                <option value="">Suite</option>
              </select>
              <p class="mt-2 text-sm text-green-600 dark:text-green-500"><span class="font-medium">Alright!</span> Username available!</p>
            </div>
          </div>
          <div>
            <label for="username-error" class="block mb-2 text-sm font-medium text-red-700 dark:text-red-500">Your name</label>
            <input type="text" id="username-error" class="bg-red-50 border border-red-500 text-red-900 placeholder-red-700 text-sm rounded-lg focus:ring-red-500 focus:border-red-500 block w-full p-2.5 dark:bg-red-100 dark:border-red-400" placeholder="Bonnie Green">
            <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span class="font-medium">Oops!</span> Username already taken!</p>
          </div>
          <div class="flex justify-end">
            <button type="button" data-modal-toggle="booking-modal" class="mr-3 flex py-2 px-3 bg-gray-400 rounded-lg text-white">
              Back
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
