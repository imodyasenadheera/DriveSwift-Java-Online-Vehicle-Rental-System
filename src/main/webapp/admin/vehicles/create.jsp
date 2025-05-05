<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Create Vehicle | DriveSwift Admin</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/admin/assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-900 text-gray-900 dark:text-gray-100 font-sans">

  <div class="hidden md:flex h-screen">

    <%-- <%@ include file="../partials/sidebar.jsp" %> --%>

    <!-- Main Content -->
    <main class="flex-1 p-8 overflow-y-auto">
      <!-- Header -->
      <div class="flex items-center justify-between mb-6">
        <h2 class="text-2xl font-semibold text-indigo-700 dark:text-indigo-400">Add New Vehicle</h2>
        <a href="${pageContext.request.contextPath}/admin/vehicle"
           class="bg-teal-600 hover:bg-teal-700 text-white px-4 py-2 rounded shadow text-sm">
          <i class="fas fa-arrow-left mr-2"></i> Back
        </a>
      </div>

      <!-- Form -->
      <form method="post" action="${pageContext.request.contextPath}/admin/vehicle" enctype="multipart/form-data"
            class="bg-white dark:bg-gray-800 shadow-md rounded-lg p-6 space-y-6">
        <input type="hidden" name="action" value="create"/>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
          <!-- Vehicle Name -->
          <div>
            <label class="block mb-1 text-sm font-medium">Vehicle Name</label>
            <input name="vehicle_name" type="text" required
                   placeholder="Enter vehicle name"
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-indigo-500">
          </div>

          <!-- Brand -->
          <div>
            <label class="block mb-1 text-sm font-medium">Brand</label>
            <input name="brand" type="text" required
                   placeholder="Enter brand"
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-indigo-500">
          </div>

          <!-- Model -->
          <div>
            <label class="block mb-1 text-sm font-medium">Model</label>
            <input name="model" type="text" required
                   placeholder="Enter model"
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-indigo-500">
          </div>

          <!-- Vehicle Type -->
          <div>
            <label class="block mb-1 text-sm font-medium">Vehicle Type</label>
            <input name="vehicle_type" type="text" required
                   placeholder="e.g., Sedan, SUV"
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-indigo-500">
          </div>

          <!-- Cost per Km -->
          <div>
            <label class="block mb-1 text-sm font-medium">Cost Per Km (Rs)</label>
            <input name="cost_per_km" type="number" step="0.01" min="0" required
                   placeholder="e.g., 25.00"
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-indigo-500">
          </div>

          <!-- Availability Status -->
          <div>
            <label class="block mb-1 text-sm font-medium">Availability Status</label>
            <select name="availability_status" required
                    class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-indigo-500">
              <option value="">Select status</option>
              <option value="Available">Available</option>
              <option value="Booked">Booked</option>
              <option value="Maintenance">Maintenance</option>
            </select>
          </div>

          <!-- Description -->
          <div class="lg:col-span-2">
            <label class="block mb-1 text-sm font-medium">Description</label>
            <textarea name="description" rows="4" required
                      placeholder="Enter vehicle description..."
                      class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-indigo-500"></textarea>
          </div>

          <!-- Image Upload -->
          <div class="lg:col-span-2">
            <label class="block mb-1 text-sm font-medium">Upload Vehicle Image</label>
            <input type="file" name="vehicle_image" accept="image/*"
                   class="w-full px-4 py-2 rounded border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-700 text-gray-900 dark:text-white file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-medium file:bg-teal-600 file:text-white hover:file:bg-teal-700">
          </div>
        </div>

        <!-- Buttons -->
        <div class="flex justify-end gap-4 pt-4">
          <button type="reset"
                  onclick="window.location.href='${pageContext.request.contextPath}/admin/vehicle'"
                  class="bg-gray-300 hover:bg-gray-400 dark:bg-gray-600 dark:hover:bg-gray-500 text-gray-900 dark:text-white px-4 py-2 rounded">
            Cancel
          </button>
          <button type="submit"
                  class="bg-indigo-600 hover:bg-indigo-700 text-white px-6 py-2 rounded shadow">
            <i class="fas fa-save mr-2"></i> Save Vehicle
          </button>
        </div>
      </form>
    </main>
  </div>

</body>
</html>