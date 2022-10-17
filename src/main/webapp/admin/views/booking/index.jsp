<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<jsp:include page="partails/details.jsp"/>
<div class="p-6">
  <nav class="flex justify-between mb-8" aria-label="Breadcrumb">
    <ol class="inline-flex items-center space-x-1 md:space-x-3">
      <li class="inline-flex items-center">
        <a href="#" class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white">
          <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path></svg>
          Home
        </a>
      </li>
      <li>
        <div class="flex items-center">
          <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
          <a href="#" class="ml-1 text-sm font-medium text-gray-700 hover:text-gray-900 md:ml-2 dark:text-gray-400 dark:hover:text-white">Booking</a>
        </div>
      </li>
    </ol>

  </nav>
  <div class="overflow-x-auto relative sm:rounded-lg">
    <table class="w-full text-sm text-left">
      <thead class="bg-white text-xs text-gray-700 uppercase">
      <tr>
        <th scope="col" class="py-3 px-6">
          Matriculate
        </th>
        <th scope="col" class="py-3 px-6">
          Email
        </th>
        <th scope="col" class="py-3 px-6">
          billet
        </th>
        <th scope="col" class="py-3 px-6">
          date start
        </th>
        <th scope="col" class="py-3 px-6">
          date end
        </th>
        <th scope="col" class="py-3 px-6 md:block hidden">
          Actions
        </th>
      </tr>
      </thead>
      <tbody>
      <tr class="bg-white border-b hover:bg-gray-50">
        <th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap">
          Apple MacBook Pro 17"
        </th>
        <td class="py-4 px-6">
          Sliver
        </td>
        <td class="py-4 px-6">
          Laptop
        </td>
        <td class="py-4 px-6">
          22-10-2022
        </td>
        <td class="py-4 px-6">
          22-10-2022
        </td>
        <td class="py-4 px-6 text-right flex md:flex hidden">
          <button >
            <svg width="18px" height="18px" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
              <path fill="#FF0000" d="M13 18H5a2 2 0 0 1-2-2V7a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v9a2 2 0 0 1-2 2zm3-15a1 1 0 0 1-1 1H3a1 1 0 0 1 0-2h3V1a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v1h3a1 1 0 0 1 1 1z"></path>
            </svg>
          </button>
          <button class="bg-red-600 px-3 py-2 rounded-lg text-white" type="button" data-modal-toggle="booking-modal">
           view
          </button>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>
