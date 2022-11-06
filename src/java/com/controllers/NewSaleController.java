/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

import com.modelo.Cliente;
import com.modelo.ClienteDAO;
import com.modelo.Models;
import com.modelo.ModelsDAO;
import com.modelo.SaleDetail;
import com.modelo.SaleDetailDAO;
import com.modelo.SaleTicket;
import com.modelo.SaleTicketDAO;
import com.modelo.UsersC;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Luis
 */
@WebServlet(name = "NewSaleController", urlPatterns = {"/NewSaleController"})
public class NewSaleController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String car = request.getParameter("carCode");
        String client = request.getParameter("clientCode");
        boolean save = Boolean.parseBoolean(request.getParameter("save"));

        //Si traen valor el código del cliente o el codigo del carro
        if (car != null || client != null || save) {
            //Se busca el carro
            if (car != null) {
                ModelsDAO modelsDao = new ModelsDAO();

                Models model = modelsDao.getByCode(car);
                response.setStatus(200);
                PrintWriter writer = response.getWriter();
                writer.append(model.toString());
                writer.close();

            } else if (client != null) {
                ClienteDAO clientDAO = new ClienteDAO();
                Cliente clientSale = clientDAO.getClientByDUI(client);

                response.setStatus(200);
                PrintWriter writer = response.getWriter();
                writer.append(clientSale.getCli_dui());
                writer.close();

            } else if (save) {
                HttpSession session = request.getSession();

                String username = (String) session.getAttribute("user");
                String customer = request.getParameter("customer");
                double total = Double.parseDouble(request.getParameter("total"));

                UsersC user = new UsersC();
                Cliente cliente = new Cliente();
                SaleTicket saleTicket = new SaleTicket();
                user.setUserName(username);
                cliente.setCli_dui(customer);
                saleTicket.setSalTotal(total);
                saleTicket.setUser(user);
                saleTicket.setClient(cliente);

                SaleTicketDAO dao = new SaleTicketDAO();

                int res = dao.saveTicket(saleTicket);

                if (res != 0) {
                    SaleDetailDAO detailDao = new SaleDetailDAO();
                    int idSale = dao.getLastIdSale();
                    
                    List<SaleDetail> details = new ArrayList<>();
                    String[] cars = request.getParameterValues("cars[]");

                    for (String s : cars) {
                        String[] carDetail = s.split(",");

                        String codeCar = carDetail[0];
                        int qty = Integer.parseInt(carDetail[3]);
                        double unitPrice = Double.parseDouble(carDetail[2]);
                        double totalCar = Double.parseDouble(carDetail[4]);

                        Models model = new Models();
                        model.setModCode(codeCar);
                        SaleTicket sale = new SaleTicket();
                        sale.setId(idSale);
                        SaleDetail detail = new SaleDetail(model, qty, unitPrice,
                                totalCar, sale);

                        details.add(detail);
                    }

                    res = detailDao.saveSaleDetails(details);

                    response.setStatus(200);
                    PrintWriter writer = response.getWriter();
                    writer.append(String.valueOf(res));
                    writer.close();  
                }
            }

        } else {
            this.newOrder(request, response);
        }
    }

    protected void newOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/sales/new_sale.jsp")
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
