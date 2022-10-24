<!-- Main modal -->
<div id="edit-extra-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full">
  <div class="relative p-4 w-full h-full md:h-auto">
    <!-- Modal content -->
    <div class="w-3/5 mx-auto relative bg-white rounded-lg shadow">
      <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white" onclick="closeModal('edit-extra-modal')">
        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
        <span class="sr-only">Close modal</span>
      </button>
      <div class="py-6 px-6 lg:px-8">
        <h3 class="mb-4 text-xl font-medium text-gray-900 dark:text-white">Edit extras</h3>
        <form class="space-y-6" action="extra/update" method="post">
          <div class="mb-6 flex md:flex-row flex-col justify-between gap-6">
            <input type="hidden" id="id_extra-edit" name="id_extra"/>
            <div class="w-full">
              <label for="type_extra-edit" class="block mb-2 text-sm font-medium text-grey-800 ">Name extra</label>
              <div class="mt-1 sm:mt-0 sm:col-span-2">
                <input id="type_extra-edit" name="type_extra" type="text" placeholder="Name extra" class="block max-w-lg w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm border-gray-300 rounded-md">
              </div>
            </div>
            <div class="w-full">
              <label for="rate-edit" class="block mb-2 text-sm font-medium text-grey-800 ">Rate extra</label>
              <div class="mt-1 sm:mt-0 sm:col-span-2">
                <input id="rate-edit" min="0" step="0.05" name="rate" type="number" autocomplete="number" placeholder="Rate for the room" class="block max-w-lg w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm border-gray-300 rounded-md">
              </div>
            </div>
          </div>

          <div class="flex justify-end">
            <button type="button" onclick="closeModal('edit-extra-modal')" class="mr-3 flex py-2 px-3 bg-gray-400 rounded-lg text-white">
              Cancel
            </button>
            <button type="submit" class="flex py-2 px-3 bg-blue-400 rounded-lg text-white">
              Update rate
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
