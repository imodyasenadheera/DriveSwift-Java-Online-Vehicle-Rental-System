package com.driveswift.servlet;

import com.driveswift.model.Vehicle;
import com.driveswift.service.VehicleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/vehicles")
public class VehicleListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final VehicleService vehicleService = new VehicleService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch all vehicles
        List<Vehicle> vehicles = vehicleService.getAllVehicles();
        request.setAttribute("vehicles", vehicles);

        HttpSession session = request.getSession(false);
        boolean isLoggedIn = false;

        if (session != null && session.getAttribute("user") != null) {
            isLoggedIn = true;

            // Optional: set full name from session
            request.setAttribute("userFullName", session.getAttribute("name"));
        }

        request.setAttribute("isLoggedIn", isLoggedIn);
        request.getRequestDispatcher("/client/vehicle.jsp").forward(request, response);
    }
}