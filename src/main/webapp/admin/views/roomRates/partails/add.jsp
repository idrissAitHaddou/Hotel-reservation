<button hidden id="btnToogleRoomRates" type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white" data-modal-toggle="add-room-rate-modal"></button>
<!-- Main modal -->
<div id="add-room-rate-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full">
  <div class="relative p-4 w-full h-full md:h-auto">
    <!-- Modal content -->
    <div class="w-3/5 mx-auto relative bg-white rounded-lg shadow">
      <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white" data-modal-toggle="add-room-rate-modal">
        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
        <span class="sr-only">Close modal</span>
      </button>
      <div class="py-6 px-6 lg:px-8">
        <h3 class="mb-4 text-xl font-medium text-gray-900 dark:text-white">Add room rates</h3>
        <form class="space-y-6" action="javascript:addRoomRates()" method="post">
          <div class="mb-6 flex md:flex-row flex-col justify-between gap-6">
            <div class="w-full">
              <label for="number_room" class="block mb-2 text-sm font-medium text-grey-800 ">Select the room</label>
              <div class="mt-1 sm:mt-0 sm:col-span-2">
                <select id="number_room" name="room_id" class="block max-w-lg w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm border-gray-300 rounded-md">
                </select>
              </div>
            </div>
            <div class="w-full">
              <label for="rate" class="block mb-2 text-sm font-medium text-grey-800 ">Rate for the room</label>
              <div class="mt-1 sm:mt-0 sm:col-span-2">
                <input id="rate" min="0" step="0.05" name="rate" type="number" autocomplete="number" placeholder="Rate for the room" class="block max-w-lg w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm border-gray-300 rounded-md">
              </div>
            </div>
          </div>
          <div class="mb-6 flex md:flex-row flex-col justify-between gap-6">
            <div class="w-full">
              <label for="start_date" class="block mb-2 text-sm font-medium text-grey-800 ">Start date</label>
              <div class="mt-1 sm:mt-0 sm:col-span-2">
                <input id="start_date" name="start_date" type="date" autocomplete="number" placeholder="start date of the rate" class="block max-w-lg w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm border-gray-300 rounded-md">
              </div>
            </div>
            <div class="w-full">
              <label for="end_date" class="block mb-2 text-sm font-medium text-grey-800 ">End date</label>
              <div class="mt-1 sm:mt-0 sm:col-span-2">
                <input id="end_date" name="end_date"  type="date" autocomplete="date" placeholder="end date of the rate" class="block max-w-lg w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm border-gray-300 rounded-md">
              </div>
            </div>
          </div>
          <div class="flex justify-end">
            <button type="button" data-modal-toggle="add-room-rate-modal" class="mr-3 flex py-2 px-3 bg-gray-400 rounded-lg text-white">
              Cancel
            </button>
            <button type="submit" class="flex py-2 px-3 bg-blue-400 rounded-lg text-white">
              <svg id="loadingAdd" role="status" class="inline mt-1 mr-3 w-4 h-4 text-white animate-spin" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="#E5E7EB"/>
                <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="currentColor"/>
              </svg>
              Add rate
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>