package com.web.service;

import com.web.model.Book_24133044;
import com.web.model.Review_24133044;
import java.util.List;

public interface IBookService_24133044 {
    List<Book_24133044> getBooksByPage(int page, int pageSize, String author, String publisher, String priceRange);
    int getTotalBooks(String author, String publisher, String priceRange);
    
    Book_24133044 getBookById(int bookid);
    List<Review_24133044> getReviewsForBook(int bookid);
    boolean addReview(int userid, int bookid, String text);

    boolean insertBook(Book_24133044 book);
    boolean updateBook(Book_24133044 book);
    boolean deleteBook(int bookid);
}