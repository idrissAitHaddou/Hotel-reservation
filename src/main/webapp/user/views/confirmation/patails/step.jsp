<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="flex">
  <div class="pt-24 pb-10 w-full bg-[#F5F3F0]">
    <nav aria-label="Progress">
      <ol role="list" class="flex w-full justify-center items-center">
        <li class="relative pr-16 sm:pr-20">
          <!-- Completed Step -->
          <div class="absolute inset-0 flex items-center" aria-hidden="true">
            <div class="h-0.5 w-full bg-[#FF8D53]"></div>
          </div>
          <a href="#" class="relative w-8 h-8 flex items-center justify-center bg-[#FF8D53] rounded-full hover:bg-indigo-900">
            <!-- Heroicon name: solid/check -->
            <svg class="w-5 h-5 text-white" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
            </svg>
            <span class="sr-only">Step 1</span>
          </a>
          <h2 class="absolute text-xs md:text-sm ">Search</h2>
        </li>
        <li class="relative pr-16 sm:pr-20">
          <!-- Completed Step -->
          <div class="absolute inset-0 flex items-center" aria-hidden="true">
            <div class="h-0.5 w-full bg-[#FF8D53]"></div>
          </div>
          <a href="#" class="relative w-8 h-8 flex items-center justify-center bg-[#FF8D53] rounded-full hover:bg-indigo-900">
            <!-- Heroicon name: solid/check -->
            <svg class="w-5 h-5 text-white" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
            </svg>
            <span class="sr-only">Step 1</span>
          </a>
          <h2 class="absolute text-xs md:text-sm ">Booking</h2>
        </li>

        <li class="relative pr-16 sm:pr-20">
          <!-- Current Step -->
          <div class="absolute inset-0 flex items-center" aria-hidden="true">
            <div class="h-0.5 w-full bg-[#FF8D53]"></div>
          </div>
          <a href="#" class="relative w-8 h-8 flex items-center justify-center bg-[#FF8D53] rounded-full hover:bg-indigo-900">
            <!-- Heroicon name: solid/check -->
            <svg class="w-5 h-5 text-white" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
            </svg>
            <span class="sr-only">Step 1</span>
          </a>
          <h2 class="absolute -ml-2 text-xs md:text-sm">Checkout</h2>
        </li>


        <li class="relative">
          <!-- Upcoming Step -->
          <div class="absolute inset-0 flex items-center" aria-hidden="true">
            <div class="h-0.5 w-full bg-gray-200"></div>
          </div>
          <a href="#" class="relative w-8 h-8 flex items-center justify-center bg-white border-2 border-[#FF8D53] rounded-full" aria-current="step">
            <span class="h-2.5 w-2.5 bg-[#FF8D53] rounded-full" aria-hidden="true"></span>
            <span class="sr-only">Step 3</span>

          </a>
          <h2 class="absolute -ml-6 text-xs md:text-sm">Confirmation</h2>
        </li>
      </ol>
    </nav>
  </div>
</div>