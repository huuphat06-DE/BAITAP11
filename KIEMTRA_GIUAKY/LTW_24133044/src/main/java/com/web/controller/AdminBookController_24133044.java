package com.web.controller;

import com.web.model.Book_24133044;
import com.web.service.BookServiceImpl_24133044;
import com.web.service.IBookService_24133044;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet(urlPatterns = {"/admin/books", "/admin/books/add", "/admin/books/edit", "/admin/books/delete"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class AdminBookController_24133044 extends HttpServlet {
    private IBookService_24133044 bookService = new BookServiceImpl_24133044();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        
        if (path.equals("/admin/books/add")) {
            req.getRequestDispatcher("/views/admin/book_form.jsp").forward(req, resp);
        } else if (path.equals("/admin/books/edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Book_24133044 book = bookService.getBookById(id);
            req.setAttribute("book", book);
            req.getRequestDispatcher("/views/admin/book_form.jsp").forward(req, resp);
        } else if (path.equals("/admin/books/delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            bookService.deleteBook(id);
            resp.sendRedirect(req.getContextPath() + "/admin/books");
        } else {
            int page = 1; int pageSize = 5;
            if(req.getParameter("page") != null) page = Integer.parseInt(req.getParameter("page"));
            
            req.setAttribute("listBooks", bookService.getBooksByPage(page, pageSize, null, null, null));
            req.setAttribute("currentPage", page);
            req.setAttribute("totalPages", (int) Math.ceil((double) bookService.getTotalBooks(null, null, null) / pageSize));
            req.getRequestDispatcher("/views/admin/book_list.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String path = req.getServletPath();
        
        String title = req.getParameter("title");
        String publisher = req.getParameter("publisher");
        String authorName = req.getParameter("authorName");
        
        int quantity = 0;
        if(req.getParameter("quantity") != null && !req.getParameter("quantity").isEmpty()){
            quantity = Integer.parseInt(req.getParameter("quantity"));
        }
        
        double price = 0;
        if(req.getParameter("price") != null && !req.getParameter("price").isEmpty()){
            price = Double.parseDouble(req.getParameter("price"));
        }
        
        int isbn = 0;
        if(req.getParameter("isbn") != null && !req.getParameter("isbn").isEmpty()){
            isbn = Integer.parseInt(req.getParameter("isbn"));
        }
        
        Book_24133044 book = new Book_24133044();
        book.setTitle(title);
        book.setPublisher(publisher);
        book.setAuthorName(authorName);
        book.setQuantity(quantity);
        book.setPrice(price);
        book.setIsbn(isbn);
        
        // --- XỬ LÝ UPLOAD ẢNH ---
        String coverImage = req.getParameter("coverImage");
        Part filePart = req.getPart("coverFile");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            filePart.write(uploadPath + File.separator + fileName);
            coverImage = req.getContextPath() + "/uploads/" + fileName;
        }
        book.setCoverImage(coverImage);
        // ------------------------

        if (path.equals("/admin/books/add")) {
            bookService.insertBook(book);
        } else if (path.equals("/admin/books/edit")) {
            int bookid = Integer.parseInt(req.getParameter("bookid"));
            book.setBookid(bookid);
            
            // Giữ lại reviewCount cũ nếu cần, nhưng dummy data thì reviewCount sẽ về 0. Không sao.
            Book_24133044 oldBook = bookService.getBookById(bookid);
            if(oldBook != null) {
                book.setReviewCount(oldBook.getReviewCount());
                if(coverImage == null || coverImage.isEmpty()) {
                    book.setCoverImage(oldBook.getCoverImage());
                }
            }
            bookService.updateBook(book);
        }
        resp.sendRedirect(req.getContextPath() + "/admin/books");
    }
}