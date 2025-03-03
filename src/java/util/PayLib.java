/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import java.util.Map;
import java.util.TreeMap;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class PayLib {
    private final TreeMap<String, String> requestData = new TreeMap<>(new VnPayCompare());

    // Thêm dữ liệu vào danh sách request
    public void addRequestData(String key, String value) {
        if (value != null && !value.isEmpty()) {
            requestData.put(key, value);
        }
    }

    // Tạo URL yêu cầu VNPAY với chữ ký bảo mật
    public String createRequestUrl(String baseUrl, String vnp_HashSecret) throws Exception {
        StringBuilder data = new StringBuilder();
        for (Map.Entry<String, String> entry : requestData.entrySet()) {
            if (entry.getValue() != null && !entry.getValue().isEmpty()) {
                data.append(URLEncoder.encode(entry.getKey(), StandardCharsets.UTF_8))
                    .append("=")
                    .append(URLEncoder.encode(entry.getValue(), StandardCharsets.UTF_8))
                    .append("&");
            }
        }

        // Xóa ký tự `&` cuối cùng
        if (data.length() > 0) {
            data.setLength(data.length() - 1);
        }

        String queryString = data.toString();
        String signData = queryString;

        // Tạo chữ ký bảo mật
        String vnp_SecureHash = hmacSHA512(vnp_HashSecret, signData);

        // Kết hợp baseUrl + queryString + SecureHash
        return baseUrl + "?" + queryString + "&vnp_SecureHash=" + vnp_SecureHash;
    }

    // HmacSHA512 để tạo mã bảo mật
    public static String hmacSHA512(String key, String data) {
        try {
            Mac hmacSHA512 = Mac.getInstance("HmacSHA512");
            SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
            hmacSHA512.init(secretKey);
            byte[] hash = hmacSHA512.doFinal(data.getBytes(StandardCharsets.UTF_8));

            // Chuyển đổi sang dạng Hex String
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                hexString.append(String.format("%02x", b));
            }
            return hexString.toString();
        } catch (Exception e) {
            throw new RuntimeException("Error while generating HMAC SHA512", e);
        }
    }
}
