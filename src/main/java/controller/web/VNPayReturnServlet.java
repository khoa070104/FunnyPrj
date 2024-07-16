//package controller.web;
//
//import controller.config.*;
//// import dal.CartDAO;
//// import dal.OrderDAO;
//// import dal.PhoneProductDAO;
//import java.io.IOException;
//import java.util.*;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//// import model.Product;
//
//@WebServlet("/vnpay-return")
//public class VNPayReturnServlet extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        Map<String, String> fields = new HashMap<>();
//        req.setCharacterEncoding("UTF-8");
//        resp.setCharacterEncoding("UTF-8");
//        for (Enumeration<String> params = req.getParameterNames(); params.hasMoreElements();) {
//            String fieldName = params.nextElement();
//            String fieldValue = req.getParameter(fieldName);
//            if (fieldValue != null && !fieldValue.isEmpty()) {
//                fields.put(fieldName, fieldValue);
//            }
//        }
//
//        String vnp_SecureHash = req.getParameter("vnp_SecureHash");
//
//        // Remove hash params
//        fields.remove("vnp_SecureHashType");
//        fields.remove("vnp_SecureHash");
//
//        // Sorting fields
//        TreeMap<String, String> sortedFields = new TreeMap<>(fields);
//
//        // Calculate signature
//        String signValue = Config.hashAllFields(sortedFields);
//        // CartDAO cd = new CartDAO();
//
////    if (signValue.equals(vnp_SecureHash)) {
//        if ("00".equals(req.getParameter("vnp_ResponseCode"))) {
//            // Giao dịch thành công
//            // Retrieve order details from session
//            //LẤY DỮ LIỆU LƯU VÀO DATABASE.
//            // String username = (String) req.getSession().getAttribute("username");
//            // String phoneNumber = (String) req.getSession().getAttribute("phone");
//            // String note = (String) req.getSession().getAttribute("note");
//            // String address = (String) req.getSession().getAttribute("address");
//            // Date date = (Date) req.getSession().getAttribute("date");
//            // java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(date.getTime());
//            // long amount = (long) req.getSession().getAttribute("amount");
//            // List<Product> products = (List<Product>) req.getSession().getAttribute("products");
//            // CartDAO cartd = new CartDAO();
//            // PhoneProductDAO pdd = new PhoneProductDAO();
//            // // Save order details to database
//            // OrderDAO orderDAO = new OrderDAO();
//            // for (Product product : products) {
//            //     orderDAO.saveOrder(username, String.valueOf(product.getIdProduct()), String.valueOf(product.getQuantity()), "1", product.getName(), address, phoneNumber, note, (long) product.getPrice(), "Đã thanh toán", sqlTimestamp);
//            //     cartd.removecart(username, product.getIdProduct());
//            //     pdd.updateStockProductByBuy(product.getIdProduct());
//            // }
//
//            resp.sendRedirect("payment-success.jsp");
//        } else {
//            // Giao dịch thất bại
//            resp.sendRedirect("payment-failed.jsp");
//        }
////    } else {
////        // Chữ ký không hợp lệ
////        resp.sendRedirect("payment-error.jsp");
////    }
//    }
//
//}
