<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Vehicle Management | DriveSwift Admin</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/admin/assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-900 text-gray-900 dark:text-gray-100 font-sans">

  <div class="hidden md:flex h-screen">

    <%-- <%@ include file="../partials/sidebar.jsp"%> --%>

    <!-- Main Content -->
    <main class="flex-1 p-8 overflow-y-auto">
      <!-- Header with Search and Button -->
      <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4 mb-6">
        <h1 class="text-2xl font-semibold">
          Hello, Sample User<%-- <span class="text-teal-600 dark:text-teal-400 font-bold">${loggedAdmin.full_name} (${loggedAdmin.role})</span> --%>
        </h1>

        <div class="flex flex-col sm:flex-row items-stretch sm:items-center gap-4 w-full md:w-auto">
          <!-- Search Bar -->
          <input
            type="text"
            id="search"
            placeholder="Search vehicles..."
            class="w-full sm:w-64 px-4 py-2 border border-gray-300 dark:border-gray-600 rounded focus:outline-none focus:ring-2 focus:ring-indigo-500 dark:bg-gray-700 dark:text-white"
          />

          <!-- Create Button -->
          <a href="vehicle?action=create" class="bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-2 rounded w-full sm:w-auto text-center">
            <i class="fas fa-plus mr-2"></i> Add New Vehicle
          </a>
        </div>
      </div>

      <!-- Data Table -->
      <div class="bg-white dark:bg-gray-800 shadow rounded-lg overflow-x-auto">
        <table class="min-w-full text-sm text-left" id="vehicleTable">
          <thead class="bg-indigo-600 text-white dark:bg-indigo-700">
            <tr>
              <th class="px-6 py-3">#</th>
              <th class="px-6 py-3">Image</th>
              <th class="px-6 py-3">Vehicle Name</th>
              <th class="px-6 py-3">Brand</th>
              <th class="px-6 py-3">Model</th>
              <th class="px-6 py-3">Type</th>
              <th class="px-6 py-3">Cost/Km</th>
              <th class="px-6 py-3">Status</th>
              <th class="px-6 py-3">Actions</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
            <c:forEach var="vehicle" items="${vehicles}" varStatus="loop">
              <tr>
                <td class="px-6 py-4">${loop.index + 1}</td>

                <!-- Vehicle Image -->
                <td class="px-6 py-4">
                  <img src="${pageContext.request.contextPath}/assets/vehicles/${vehicle.vehicleId}.jpg"
                       alt="Vehicle Image"
                       class="w-32 h-24 object-cover rounded-md border border-gray-300 dark:border-gray-600">
                </td>

                <td class="px-6 py-4">${vehicle.vehicleName}</td>
                <td class="px-6 py-4">${vehicle.brand}</td>
                <td class="px-6 py-4">${vehicle.model}</td>
                <td class="px-6 py-4">${vehicle.vehicleType}</td>
                <td class="px-6 py-4">Rs. ${vehicle.costPerKm}</td>
                <td class="px-6 py-4">
                  <span class="inline-block px-3 py-1 rounded-full text-xs font-medium
                    ${vehicle.availabilityStatus == 'Available' ? 'bg-teal-100 text-teal-800 dark:bg-teal-900/30 dark:text-teal-300' : 'bg-red-100 text-red-800 dark:bg-red-900/30 dark:text-red-300'}">
                    ${vehicle.availabilityStatus}
                  </span>
                </td>

                <td class="px-6 py-4 space-x-2">
                  <a href="vehicle?action=edit&id=${vehicle.vehicleId}" class="text-yellow-500 hover:underline">
                    <i class="fas fa-edit"></i> Edit
                  </a>
                  <button class="text-red-500 hover:underline" onclick="confirmDelete('vehicle?action=delete&id=${vehicle.vehicleId}')">
                    <i class="fas fa-trash-alt"></i> Delete
                  </button>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </main>
  </div>

  <!-- JavaScript -->
  <script>
    function confirmDelete(url) {
      if (confirm('Are you sure you want to delete this vehicle?')) {
        window.location.href = url;
      }
    }

    // Search Bar - Exclude Actions Column
    const searchInput = document.getElementById("search");
    const rows = document.querySelectorAll("#vehicleTable tbody tr");

    searchInput.addEventListener("input", function () {
      const keyword = this.value.toLowerCase();

      rows.forEach(row => {
        const cells = row.querySelectorAll("td");
        let match = false;

        // Exclude the last cell (Actions column)
        for (let i = 0; i < cells.length - 1; i++) {
          if (cells[i].innerText.toLowerCase().includes(keyword)) {
            match = true;
            break;
          }
        }

        row.style.display = match ? "" : "none";
      });
    });
  </script>

</body>
</html>