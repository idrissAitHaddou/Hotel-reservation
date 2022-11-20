
<% String realPath = request.getServletPath()!=null?request.getServletPath():""; %>
<% HttpSession isSession = request.getSession(); %>
<% String email = isSession.getAttribute("sessionsAdmin").toString(); %>
<!-- Sidebar -->
<aside class="aside-bar h-full w-56 flex-col space-y-10 items-center justify-start relative bg-white text-white">
    <div class="hidden lg:flex lg:flex-shrink-0">
        <div class="flex flex-col w-64">
            <!-- Sidebar component, swap this element with another sidebar if you like -->
            <div class="flex flex-col min-h-0 border-r border-gray-200 bg-bgWhite">
                <div class="flex flex-col pt-5 pb-4 overflow-y-auto">
                    <nav class="mt-1 flex-1" aria-label="Sidebar">
                        <div class="px-2">
                            <div class="flex items-center text-gray-600 mb-4">
                               <a href="/admin/profile"><button type="button" class="inline-flex flex-col justify-center items-left p-2 text-sm rounded cursor-pointer">
                                    <div class="relative mb-2">
                                        <img class="w-8 h-8 rounded-full mr-6" src="/assets/images/profileImg.svg" alt="">
                                        <span class="top-0 left-7 absolute  w-2.5 h-2.5 bg-green-400 border-1 border-white dark:border-gray-800 rounded-full"></span>
                                    </div>
                                    <span class="text-xs"><%= email %></span>
                                </button></a>
                            </div>
                            <ul>
                                <li>
                                    <a href="/admin/dashboard"class="text-gray-600 <% if(!realPath.equals("/admin/dashboard")) out.print("hover:bg-blue-100"); %> group flex items-center justify-between px-2 py-2 font-medium rounded-md">
                                        <span class="font-medium text-sm <% if(realPath.equals("/admin/dashboard")) out.print("text-blue-400"); %>">
                                            Dashboard
                                        </span>
                                        <span class="">
                                            <svg class="<% if(realPath.equals("/admin/dashboard")) out.print("text-blue-400 "); %> mr-3 h-4 w-4" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true"><path d="M18.672 11H17v6c0 .445-.194 1-1 1h-4v-6H8v6H4c-.806 0-1-.555-1-1v-6H1.328c-.598 0-.47-.324-.06-.748L9.292 2.22c.195-.202.451-.302.708-.312.257.01.513.109.708.312l8.023 8.031c.411.425.539.749-.059.749z"/></svg>
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/booking"
                                       class="text-gray-600 <% if(!realPath.equals("/admin/booking")) out.print("hover:bg-blue-100"); %>group flex items-center justify-between px-2 py-2 text-base font-medium rounded-md">
                                        <!-- Hero icon name: outline/calendar -->
                                        <span class="font-medium text-sm <% if(realPath.equals("/admin/booking")) out.print("text-blue-400"); %>">
                                        Bookings
                                        </span>
                                            <span class="text-gray-500">
                                            <svg class="<% if(realPath.equals("/admin/booking")) out.print("text-blue-400"); %> mr-3 h-4 w-4" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M19.688 4.857c-.104-1.326-1.142-2.449-2.493-2.55C15.74 2.203 13.558 2 12 2c-1.558 0-3.74.204-5.195.408-1.35.102-2.39 1.123-2.493 2.45C4.208 6.49 4 9.652 4 12c0 2.245.208 5.408.312 7.143.104 1.326 1.143 2.449 2.493 2.55C8.26 21.797 10.442 22 12 22c1.558 0 3.74-.204 5.195-.306 1.35-.102 2.39-1.225 2.493-2.551C19.792 17.51 20 14.347 20 12c0-2.347-.208-5.408-.312-7.143ZM8.883 9.143H12c.416 0 .831.306.831.816s-.311.817-.831.817H8.883c-.415 0-.831-.307-.831-.817s.416-.816.831-.816Zm6.234 5.714H8.883c-.415 0-.831-.306-.831-.816s.312-.816.831-.816h6.234c.415 0 .831.306.831.816s-.415.816-.831.816Z" fill="currentColor"/></svg>
                                        </span>

                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/rooms"
                                       class="text-gray-600 <% if(!realPath.equals("/admin/rooms")) out.print("hover:bg-blue-100"); %> group flex items-center justify-between px-2 py-2 text-base font-medium rounded-md">
                                        <!-- Hero icon name: outline/calendar -->
                                        <span class="font-medium text-sm <% if(realPath.equals("/admin/rooms")) out.print("text-blue-400"); %>">
                                            Rooms
                                        </span>
                                        <span class="text-gray-500">
                                        <svg class="<% if(realPath.equals("/admin/rooms")) out.print("text-blue-400"); %> mr-3 h-4 w-4" width="24" height="24" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M432 224V96a16 16 0 0 0-16-16H96a16 16 0 0 0-16 16v128a48 48 0 0 0-48 48v160h36v-32h376v32h36V272a48 48 0 0 0-48-48Zm-192 0H120v-32a16 16 0 0 1 16-16h88a16 16 0 0 1 16 16Zm32-32a16 16 0 0 1 16-16h88a16 16 0 0 1 16 16v32H272Z" fill="currentColor"/></svg>
                                        </span>

                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/rooms-rates"
                                       class="text-gray-600 <% if(!realPath.equals("/admin/rooms-rates")) out.print("hover:bg-blue-100"); %> group flex items-center justify-between px-2 py-2 text-base font-medium rounded-md">
                                        <!-- Hero icon name: outline/calendar -->
                                        <span class="font-medium text-sm <% if(realPath.equals("/admin/rooms-rates")) out.print("text-blue-400"); %>">
                                            Rooms Rates
                                        </span>
                                        <span class="text-gray-500">
                                          <svg class="<% if(realPath.equals("/admin/rooms-rates")) out.print("text-blue-400"); %> mr-3 h-4 w-4" width="24" height="24" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M288 16 0 304l176 176 288-288V16Zm80 128a32 32 0 1 1 32-32 32 32 0 0 1-32 32Z" fill="currentColor"/><path fill="currentColor" d="M480 64v144L216.9 471.1 242 496l270-272V64h-32z"/></svg>
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/extras"
                                       class="text-gray-600 <% if(!realPath.equals("/admin/extras")) out.print("hover:bg-blue-100"); %> group flex items-center justify-between px-2 py-2 text-base font-medium rounded-md">
                                        <!-- Hero icon name: outline/calendar -->
                                        <span class="font-medium text-sm <% if(realPath.equals("/admin/extras")) out.print("text-blue-400"); %>">
                                            Extras
                                        </span>
                                        <span class="text-gray-500">
                                           <svg class="<% if(realPath.equals("/admin/extras")) out.print("text-blue-400"); %> mr-3 h-4 w-4" width="24" height="24" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M400 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zm-32 252c0 6.6-5.4 12-12 12h-92v92c0 6.6-5.4 12-12 12h-56c-6.6 0-12-5.4-12-12v-92H92c-6.6 0-12-5.4-12-12v-56c0-6.6 5.4-12 12-12h92v-92c0-6.6 5.4-12 12-12h56c6.6 0 12 5.4 12 12v92h92c6.6 0 12 5.4 12 12v56z" fill="currentColor"/></svg>
                                        </span>
                                    </a>
                                </li>
                            </ul>

                            <a href="/admin/promotion"
                               class="text-gray-600 <% if(!realPath.equals("/admin/promotion")) out.print("hover:bg-blue-100"); %> group flex items-center justify-between px-2 py-2 text-base font-medium rounded-md">
                                <!-- Hero icon name: outline/calendar -->
                                <span class="font-medium text-sm <% if(realPath.equals("/admin/promotion")) out.print("text-blue-400"); %>">
                                        Promotion
                                    </span>
                                <span class="text-gray-500">
                                    </span>
                                <svg class="<% if(realPath.equals("/admin/promotion")) out.print("text-blue-400"); %> mr-3 h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512.005 512.005" style="enable-background:new 0 0 512.005 512.005" xml:space="preserve"><path d="M373.333 39.683c-27.307 0-49.621 20.693-52.715 47.189l-216.661 54.165c-6.848-21.568-26.816-37.355-50.624-37.355C23.915 103.683 0 127.619 0 157.016v192c0 29.397 23.915 53.333 53.333 53.333 23.808 0 43.776-15.787 50.624-37.355l16.085 4.011-12.395 44.416a21.298 21.298 0 0 0 2.112 16.469c2.859 4.971 7.659 8.555 13.248 9.963l126.933 31.829c1.707.448 3.456.64 5.184.64 3.883 0 7.723-1.067 11.093-3.115 4.885-2.965 8.363-7.765 9.685-13.355l10.603-45.227 34.112 8.533c3.093 26.496 25.408 47.189 52.715 47.189 29.419 0 53.333-23.936 53.333-53.333v-320c.002-29.395-23.913-53.331-53.332-53.331zM64 167.683v181.334c0 5.888-4.8 10.667-10.667 10.667s-10.667-4.779-10.667-10.667v-192c0-5.888 4.8-10.667 10.667-10.667S64 151.129 64 157.017v10.666zm175.296 257.344L154.624 403.8l6.805-24.427 83.669 20.907-5.802 24.747zM384 413.016c0 5.888-4.8 10.667-10.667 10.667s-10.667-4.779-10.667-10.667v-320c0-5.888 4.8-10.667 10.667-10.667S384 87.128 384 93.016v320zm85.333-224a21.277 21.277 0 0 0 15.083-6.251l21.333-21.333c8.341-8.341 8.341-21.824 0-30.165-8.341-8.341-21.824-8.341-30.165 0L454.251 152.6c-8.341 8.341-8.341 21.824 0 30.165a21.274 21.274 0 0 0 15.082 6.251zm15.083 134.251c-8.341-8.341-21.824-8.341-30.165 0-8.341 8.341-8.341 21.824 0 30.165l21.333 21.333c4.16 4.16 9.621 6.251 15.083 6.251s10.923-2.091 15.083-6.251c8.341-8.341 8.341-21.824 0-30.165l-21.334-21.333zm-15.083-91.584c-11.797 0-21.333 9.557-21.333 21.333 0 11.776 9.536 21.333 21.333 21.333h21.333c11.797 0 21.333-9.557 21.333-21.333 0-11.776-9.536-21.333-21.333-21.333h-21.333z" fill="currentColor"/></svg>
                            </a>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>

</aside>
<!-- main -->
<main class="w-full min-h-screen h-full relative bg-[#f2edf3]">

