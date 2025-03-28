package servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

import model.BookingRoom;

@WebServlet(name = "DownloadContract", urlPatterns = {"/DownloadContract"})
public class DownloadContract extends HttpServlet {

    // Use a font that supports Vietnamese, e.g., Arial Unicode MS or Times New Roman
    private static final String FONT_PATH = "/resources/fonts/arialuni.ttf"; // Update this to the correct font file

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set response headers for PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"HopDongChoThuePhongTro.pdf\"");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        Document document = null;
        ByteArrayOutputStream baos = null;
        try {
            System.out.println("Starting PDF generation...");

            baos = new ByteArrayOutputStream();
            document = new Document(PageSize.A4, 50, 50, 50, 50);
            PdfWriter writer = PdfWriter.getInstance(document, baos);
            document.open();

            // Load Vietnamese-supporting font
            BaseFont baseFont = loadFont();
            System.out.println("Font loaded successfully: " + baseFont.getPostscriptFontName());

            // Define fonts
            Font titleFont = new Font(baseFont, 16, Font.BOLD);
            Font normalFont = new Font(baseFont, 12);
            Font boldFont = new Font(baseFont, 12, Font.BOLD);

            // Add content
            addDocumentContent(document, titleFont, normalFont, boldFont, request);

            document.close();
            System.out.println("PDF document closed. Size: " + baos.size() + " bytes");

            response.setContentLength(baos.size());
            try (OutputStream out = response.getOutputStream()) {
                baos.writeTo(out);
                out.flush();
                System.out.println("PDF written to response stream successfully.");
            }

        } catch (DocumentException e) {
            System.err.println("DocumentException: " + e.getMessage());
            e.printStackTrace();
            handleError(response, "Error creating PDF document: " + e.getMessage(), e);
        } catch (IOException e) {
            System.err.println("IOException: " + e.getMessage());
            e.printStackTrace();
            handleError(response, "IO Error: " + e.getMessage(), e);
        } catch (Exception e) {
            System.err.println("Unexpected error: " + e.getMessage());
            e.printStackTrace();
            handleError(response, "Unexpected error: " + e.getMessage(), e);
        } finally {
            if (document != null && document.isOpen()) {
                document.close();
            }
            if (baos != null) {
                try {
                    baos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private BaseFont loadFont() throws DocumentException, IOException {
        System.out.println("Attempting to load font from: " + FONT_PATH);
        try (InputStream fontStream = getServletContext().getResourceAsStream(FONT_PATH)) {
            if (fontStream == null) {
                System.err.println("Font file not found at: " + FONT_PATH);
                throw new IOException("Cannot find font file at " + FONT_PATH);
            }
            byte[] fontBytes = fontStream.readAllBytes();
            if (fontBytes == null || fontBytes.length == 0) {
                System.err.println("Font file is empty at: " + FONT_PATH);
                throw new IOException("Font file is empty at " + FONT_PATH);
            }
            System.out.println("Font file loaded. Size: " + fontBytes.length + " bytes");

            // Use IDENTITY_H for TrueType fonts that support Vietnamese
            return BaseFont.createFont(
                    FONT_PATH,
                    BaseFont.IDENTITY_H,
                    BaseFont.EMBEDDED,
                    true,
                    fontBytes,
                    null
            );
        } catch (Exception e) {
            System.err.println("Error loading custom font: " + e.getMessage());
            e.printStackTrace();
            // Fallback to a system font (e.g., Times New Roman) with IDENTITY_H
            System.out.println("Falling back to system Times New Roman font with IDENTITY_H encoding.");
            try {
                // Try loading Times New Roman from the system (update path as needed)
                String systemFontPath = "C:/Windows/Fonts/times.ttf"; // Path to Times New Roman on Windows
                return BaseFont.createFont(
                        systemFontPath,
                        BaseFont.IDENTITY_H,
                        BaseFont.EMBEDDED
                );
            } catch (Exception fallbackEx) {
                System.err.println("Error loading system font: " + fallbackEx.getMessage());
                fallbackEx.printStackTrace();
                // Last resort: Use Helvetica with WINANSI (won't support Vietnamese)
                System.out.println("Falling back to Helvetica font with WINANSI encoding (Vietnamese characters may not display correctly).");
                return BaseFont.createFont(
                        BaseFont.HELVETICA,
                        BaseFont.WINANSI,
                        BaseFont.EMBEDDED
                );
            }
        }
    }

    private void addDocumentContent(Document document, Font titleFont, Font normalFont, Font boldFont, HttpServletRequest request)
            throws DocumentException {
        // Lấy dữ liệu từ session
        List<BookingRoom> contractList = (List<BookingRoom>) request.getSession().getAttribute("contractList");
        BookingRoom br = (BookingRoom) request.getSession().getAttribute("contractBr");

        if (contractList == null || contractList.size() < 2 || br == null) {
            document.add(new Paragraph("Không có dữ liệu hợp đồng.", normalFont));
            return;
        }

        BookingRoom brA = contractList.get(0); // Bên A
        BookingRoom brB = contractList.get(1); // Bên B

        // Title section
        Paragraph title1 = new Paragraph("CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM", titleFont);
        title1.setAlignment(Element.ALIGN_CENTER);
        document.add(title1);

        Paragraph title2 = new Paragraph("Độc Lập - Tự Do - Hạnh Phúc", titleFont);
        title2.setAlignment(Element.ALIGN_CENTER);
        document.add(title2);

        Paragraph separator = new Paragraph("-----o0o-----", normalFont);
        separator.setAlignment(Element.ALIGN_CENTER);
        document.add(separator);

        Paragraph contractTitle = new Paragraph("HỢP ĐỒNG CHO THUÊ PHÒNG TRỌ", titleFont);
        contractTitle.setAlignment(Element.ALIGN_CENTER);
        contractTitle.setSpacingBefore(20);
        document.add(contractTitle);

        // Bên A (Landlord)
        document.add(new Paragraph("\nBÊN A: BÊN CHO THUÊ PHÒNG TRỌ", boldFont));
        document.add(new Paragraph("Họ và Tên: " + brA.getCustomer().getFullName(), normalFont));
        document.add(new Paragraph("CCCD số: " + (brA.getInf() != null && brA.getInf().getCCCD() != null ? brA.getInf().getCCCD() : "............................") +
                " Ngày cấp: " + (brA.getInf() != null && brA.getInf().getIssueDate() != null ? brA.getInf().getIssueDate() : "............................") +
                " Nơi cấp: " + (brA.getInf() != null && brA.getInf().getPlaceOfIssue() != null ? brA.getInf().getPlaceOfIssue() : "............................"), normalFont));
        document.add(new Paragraph("Thường Trú: " + (brA.getInf() != null && brA.getInf().getPermanentAddress() != null ? brA.getInf().getPermanentAddress() : "............................"), normalFont));
        document.add(new Paragraph("Số điện thoại: " + (brA.getCustomer().getPhone() != null ? brA.getCustomer().getPhone() : "............................"), normalFont));

        // Bên B (Tenant)
        document.add(new Paragraph("\nBÊN B: BÊN THUÊ PHÒNG TRỌ", boldFont));
        document.add(new Paragraph("Họ và Tên: " + brB.getCustomer().getFullName(), normalFont));
        document.add(new Paragraph("CCCD số: " + (brB.getInf() != null && brB.getInf().getCCCD() != null ? brB.getInf().getCCCD() : "............................") +
                " Ngày cấp: " + (brB.getInf() != null && brB.getInf().getIssueDate() != null ? brB.getInf().getIssueDate() : "............................") +
                " Nơi cấp: " + (brB.getInf() != null && brB.getInf().getPlaceOfIssue() != null ? brB.getInf().getPlaceOfIssue() : "............................"), normalFont));
        document.add(new Paragraph("Thường Trú: " + (brB.getInf() != null && brB.getInf().getPermanentAddress() != null ? brB.getInf().getPermanentAddress() : "............................"), normalFont));
        document.add(new Paragraph("Số điện thoại: " + (brB.getCustomer().getPhone() != null ? brB.getCustomer().getPhone() : "............................"), normalFont));

        // Điều khoản (Terms)
        document.add(new Paragraph("\nHai bên cùng thỏa thuận và đồng ý với nội dung sau:", normalFont));
        document.add(new Paragraph("Điều 1:", boldFont));
        document.add(new Paragraph("Bên A đồng ý cho bên B thuê một phòng trọ thuộc địa chỉ: số: " + 
            br.getP().getNumber_house() + ", " + br.getP().getStreet() + ", " + 
            br.getP().getWard() + ", " + br.getP().getDistrict() + ", " + br.getP().getCity(), normalFont));
        document.add(new Paragraph("Thời hạn thuê phòng trọ là " + br.getMonth() + " tháng kể từ ngày " + br.getDate(), normalFont));

        document.add(new Paragraph("\nĐiều 2:", boldFont));
        document.add(new Paragraph("Giá thuê phòng trọ là " + br.getC().getRoom_price() + " đồng/tháng (Bằng chữ: ........................................)", normalFont));
        document.add(new Paragraph("Tiền thuê phòng bên B thanh toán cho bên A từ ngày ...... tới ngày ...... hàng tháng.", normalFont));
        document.add(new Paragraph("Tiền đặt cọc là ........................................... đồng (Bằng chữ: ........................................)", normalFont));
        document.add(new Paragraph("Bên A sẽ thanh toán lại cho bên B số tiền đặt cọc khi bên B kết thúc hợp đồng thuê phòng trọ và đã thanh toán đầy đủ tiền điện, nước, phí vệ sinh và các khoản phí khác.", normalFont));
        document.add(new Paragraph("Bên A không hoàn trả lại tiền đặt cọc nếu bên B chấm dứt hợp đồng trước thời hạn.", normalFont));
        document.add(new Paragraph("Bên B ngừng hợp đồng, phải báo trước 1 tháng cho bên A biết.", normalFont));
        document.add(new Paragraph("Bên A ngừng hợp đồng, phải báo trước 1 tháng cho bên B biết.", normalFont));

        document.add(new Paragraph("\nĐiều 3: Trách nhiệm của bên A", boldFont));
        document.add(new Paragraph("Giao phòng trọ, trang thiết bị trong phòng cho bên B đúng ngày ký hợp đồng.", normalFont));
        document.add(new Paragraph("Đảm bảo quyền sử dụng hợp pháp của bên B trong thời gian thuê phòng, nếu bên B thực hiện đúng các cam kết của hợp đồng.", normalFont));

        document.add(new Paragraph("\nĐiều 4: Trách nhiệm của bên B", boldFont));
        document.add(new Paragraph("Trả tiền thuê phòng đúng hạn theo hợp đồng.", normalFont));
        document.add(new Paragraph("Sử dụng phòng trọ đúng mục đích, giữ gìn vệ sinh, bảo quản tài sản, các thiết bị của chủ nhà.", normalFont));
        document.add(new Paragraph("Chấp hành đầy đủ các quy định của địa phương, đảm bảo an ninh trật tự.", normalFont));
        document.add(new Paragraph("Không được tự ý sửa chữa, cải tạo phòng trọ nếu chưa có sự đồng ý của bên A.", normalFont));

        document.add(new Paragraph("\nĐiều 5: Điều khoản chung", boldFont));
        document.add(new Paragraph("Hai bên A và B tự thỏa thuận các điều khoản ghi trên hợp đồng.", normalFont));
        document.add(new Paragraph("Trong quá trình thực hiện hợp đồng, nếu phát sinh vấn đề mới, hai bên cùng nhau bàn bạc và thống nhất giải quyết trên tinh thần hợp tác.", normalFont));
        document.add(new Paragraph("Hợp đồng được lập thành 02 bản có giá trị ngang nhau, mỗi bên giữ 01 bản.", normalFont));
        document.add(new Paragraph(" Người Thuê                                                                  Người cho thuê.", normalFont));
    }

    private void handleError(HttpServletResponse response, String message, Exception e)
            throws IOException {
        response.reset();
        response.setContentType("text/html;charset=UTF-8");
        try (java.io.PrintWriter writer = response.getWriter()) {
            writer.write("<h3>" + message + "</h3>");
            writer.write("<pre>" + getStackTraceAsString(e) + "</pre>");
        }
    }

    private String getStackTraceAsString(Exception e) {
        StringBuilder sb = new StringBuilder();
        sb.append(e.toString()).append("\n");
        for (StackTraceElement element : e.getStackTrace()) {
            sb.append("\tat ").append(element.toString()).append("\n");
        }
        return sb.toString();
    }
}