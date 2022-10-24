<!-- Main modal -->
<div id="add-rooms-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full">
  <div class="relative p-4 w-full h-full md:h-auto">
    <!-- Modal content -->
    <div class="w-full md:w-3/5 mx-auto relative bg-white rounded-lg shadow">
      <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white" data-modal-toggle="add-rooms-modal">
        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
        <span class="sr-only">Close modal</span>
      </button>
      <div class="py-6 px-6 lg:px-8">
        <h3 class="mb-4 text-xl font-medium text-gray-900 dark:text-white">Add room</h3>
        <form class="space-y-6" action="room/store" method="post">
          <div class="mb-6 flex md:flex-row flex-col justify-between gap-6">
            <div class="w-full">
              <label for="number_room" class="block mb-2 text-sm font-medium text-grey-800 ">Room Number</label>
              <div class="mt-1 sm:mt-0 sm:col-span-2">
                <input id="number_room" name="room_number" min="1" step="1" type="number" autocomplete="number" placeholder="number of the room" class="block max-w-lg w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm border-gray-300 rounded-md">
              </div>
            </div>
            <div class="w-full">
              <label for="floor_number" class="block mb-2 text-sm font-medium text-grey-800 ">Floor Number</label>
              <div class="mt-1 sm:mt-0 sm:col-span-2">
                <input id="floor_number" name="floor_number" min="1" step="1" type="number" autocomplete="number" placeholder="number of the room" class="block max-w-lg w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm border-gray-300 rounded-md">
              </div>
            </div>
            <div class="w-full">
              <label for="type_room" class="block mb-2 text-sm font-medium text-grey-800 ">Select the Type of the room</label>
              <div class="mt-1 sm:mt-0 sm:col-span-2">
                <select id="type_room" name="type_room" class="block max-w-lg w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm border-gray-300 rounded-md">
                  <option value=" " disabled selected>--SELECT TYPE--</option>
                  <option value="SINGLE">Single room</option>
                  <option value="DOUBLE">Double room</option>
                  <option value="TRIPLE">Triple room</option>
                  <option value="SUITE">Suite</option>
                </select>
              </div>
            </div>
          </div>
          <label for="file-upload" class="block text-base font-medium text-gray-700 sm:mt-px sm:pt-2"> Upload Images </label>
          <div class="mt-1 sm:mt-0 sm:col-span-2">
            <div class="max-w-lg flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-md">
              <div class="space-y-1 text-center">
                <svg class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48" aria-hidden="true">
                  <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                </svg>
                <div class="flex text-sm text-gray-600">
                  <label for="file-upload" class="relative cursor-pointer bg-white rounded-md font-medium text-indigo-600 hover:text-indigo-500 focus-within:outline-none focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-indigo-500">
                    <span>Upload a file</span>
                    <input id="file-upload" name="file-upload" type="file" class="sr-only">
                  </label>
                  <p class="pl-1">or drag and drop</p>
                </div>
                <p class="text-xs text-gray-500">PNG, JPG, GIF up to 10MB</p>
              </div>
            </div>
          </div>
          <div class="flex justify-end">
            <button type="button" data-modal-toggle="add-rooms-modal" class="mr-3 flex py-2 px-3 bg-gray-400 rounded-lg text-white">
              Cancel
            </button>
            <button type="submit" class="flex py-2 px-3 bg-blue-400 rounded-lg text-white">
              Add Room
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
