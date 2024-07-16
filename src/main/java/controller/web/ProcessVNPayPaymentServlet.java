package controller.web;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

import controller.config.Config;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
// import model.Product;
import model.User;

@WebServlet(urlPatterns = {"/processVNPAYPayment","/vnpay-return"})
public class ProcessVNPayPaymentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String> fields = new HashMap<>();
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        for (Enumeration<String> params = req.getParameterNames(); params.hasMoreElements();) {
            String fieldName = params.nextElement();
            String fieldValue = req.getParameter(fieldName);
            if (fieldValue != null && !fieldValue.isEmpty()) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnp_SecureHash = req.getParameter("vnp_SecureHash");

        // Remove hash params
        fields.remove("vnp_SecureHashType");
        fields.remove("vnp_SecureHash");

        // Sorting fields
        TreeMap<String, String> sortedFields = new TreeMap<>(fields);

        // Calculate signature
        String signValue = Config.hashAllFields(sortedFields);
        // CartDAO cd = new CartDAO();

//    if (signValue.equals(vnp_SecureHash)) {
        if ("00".equals(req.getParameter("vnp_ResponseCode"))) {
            // Giao dịch thành công
            // Retrieve order details from session
            //LẤY DỮ LIỆU LƯU VÀO DATABASE.
            // String username = (String) req.getSession().getAttribute("username");
            // String phoneNumber = (String) req.getSession().getAttribute("phone");
            // String note = (String) req.getSession().getAttribute("note");
            // String address = (String) req.getSession().getAttribute("address");
            // Date date = (Date) req.getSession().getAttribute("date");
            // java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(date.getTime());
            // long amount = (long) req.getSession().getAttribute("amount");
            // List<Product> products = (List<Product>) req.getSession().getAttribute("products");
            // CartDAO cartd = new CartDAO();
            // PhoneProductDAO pdd = new PhoneProductDAO();
            // // Save order details to database
            // OrderDAO orderDAO = new OrderDAO();
            // for (Product product : products) {
            //     orderDAO.saveOrder(username, String.valueOf(product.getIdProduct()), String.valueOf(product.getQuantity()), "1", product.getName(), address, phoneNumber, note, (long) product.getPrice(), "Đã thanh toán", sqlTimestamp);
            //     cartd.removecart(username, product.getIdProduct());
            //     pdd.updateStockProductByBuy(product.getIdProduct());
            // }

            resp.sendRedirect("payment-success.jsp");
        } else {
            // Giao dịch thất bại
            resp.sendRedirect("payment-failed.jsp");
        }
//    } else {
//        // Chữ ký không hợp lệ
//        resp.sendRedirect("payment-error.jsp");
//    }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";
        long amount = (long) (Double.parseDouble(req.getParameter("amount")) * 100); // tiền ở đây của t
        String bankCode = req.getParameter("bankCode");
        String vnp_TxnRef = Config.getRandomNumber(8);
        String vnp_IpAddr = Config.getIpAddress(req);
        String vnp_TmnCode = Config.vnp_TmnCode;

        // Các trường nhận dữ liệu ở đây
        HttpSession session = req.getSession();
        // User user = (User) session.getAttribute("user");
        // String username = user.getUsername();
        // String phoneNumber = req.getParameter("phone");
        // String note = req.getParameter("note");
        // String address = req.getParameter("fullAddress");

        // Các trường muốn thêm vào session ở đây
        // req.getSession().setAttribute("username", username);
        // req.getSession().setAttribute("address", address);
        // req.getSession().setAttribute("phone", phoneNumber);
        // req.getSession().setAttribute("note", note);
        // req.getSession().setAttribute("amount", amount);

        // Collecting multiple products
        // List<Product> products = new ArrayList<>();

        // int index = 0;
        // while (true) {
        //     String idProduct = req.getParameter("idproduct" + index);
        //     if (idProduct == null) {
        //         break;
        //     }
        //     String quantity = req.getParameter("quantity" + index);
        //     String nameProduct = req.getParameter("nameProduct" + index);
        //     String price = req.getParameter("price" + index);

        //     products.add(new Product(Integer.parseInt(idProduct), Integer.parseInt(quantity), nameProduct,Double.parseDouble(price)));
        //     index++;
        // }

        // req.getSession().setAttribute("products", products);

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = req.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+8"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        req.getSession().setAttribute("date", cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator<String> itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if (fieldValue != null && !fieldValue.isEmpty()) {
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        resp.sendRedirect(paymentUrl);
    }
}
