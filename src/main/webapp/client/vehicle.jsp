<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>DriveSwift | Browse Vehicles</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/x-icon">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-950 text-gray-900 dark:text-gray-100 font-sans">

<%--   <!-- Dynamic Header -->
  <c:choose>
    <c:when test="${isLoggedIn}">
      <jsp:include page="./partials/sessionheader.jsp" />
    </c:when>
    <c:otherwise>
      <jsp:include page="./partials/header.jsp" />
    </c:otherwise>
  </c:choose> --%>

  <!-- Hero Section -->
  <section class="relative w-full h-[480px] overflow-hidden">
    <img src="${pageContext.request.contextPath}/client/assets/vehicle.jpg" alt="All Vehicles Hero"
         class="w-full h-full object-cover" />
    <div class="absolute inset-0 bg-gray-950 bg-opacity-40 dark:bg-opacity-60"></div>
    <div class="absolute inset-0 flex flex-col items-center justify-center text-center px-4">
      <h1 class="text-4xl md:text-5xl font-bold text-white mb-3">Explore Our Fleet</h1>
      <p class="text-lg text-gray-300">Smooth rides. Trusted service. Affordable rates.</p>
    </div>
  </section>

  <!-- Vehicle Grid -->
  <section class="bg-gray-50 dark:bg-gray-900 py-16">
    <div class="max-w-7xl mx-auto px-6 text-center">
      
      <!-- Section Heading -->
      <div class="mb-12">
        <h2 class="text-3xl font-bold text-indigo-700 dark:text-indigo-300">Available Vehicles</h2>
        <p class="text-gray-500 dark:text-gray-400 text-sm">Choose from a variety of car types that suit your journey</p>
      </div>

      <!-- Grid List -->
      <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
        <c:forEach var="v" items="${vehicles}">
          <div class="bg-white dark:bg-gray-800 rounded-xl shadow hover:shadow-lg transition group overflow-hidden">
            <div class="relative overflow-hidden">
              <img src="${pageContext.request.contextPath}/assets/vehicles/${v.vehicleId}.jpg"
                   alt="${v.vehicleName}"
                   class="w-full h-48 object-cover group-hover:scale-105 transition duration-500">
              <span class="absolute top-3 right-3 bg-teal-600 text-white text-xs font-medium px-3 py-1 rounded-full">
                ${v.availabilityStatus}
              </span>
            </div>
            <div class="p-5 text-left space-y-2">
              <h3 class="text-xl font-semibold text-gray-800 dark:text-white truncate">${v.vehicleName}</h3>
              <p class="text-sm text-gray-500 dark:text-gray-400">${v.brand} • ${v.vehicleType}</p>
              <div class="flex items-center justify-between pt-3">
                <span class="text-lg font-semibold text-indigo-600 dark:text-indigo-400">Rs ${v.costPerKm}/km</span>
                <a href="view-vehicle?id=${v.vehicleId}"
                   class="text-sm bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-2 rounded-full transition">
                  View Details
                </a>
              </div>
            </div>
          </div>
        </c:forEach>

        <!-- No Vehicles Message -->
        <c:if test="${empty vehicles}">
          <div class="col-span-full text-gray-400 dark:text-gray-300 text-center text-lg py-10">
            No vehicles available at the moment.
          </div>
        </c:if>
      </div>
    </div>
  </section>

<%--   <!-- Footer -->
  <jsp:include page="./partials/footer.jsp" /> --%>

</body>
</html>