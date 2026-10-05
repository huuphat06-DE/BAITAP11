package com.web.service;

import com.web.dao.BookDAOImpl_24133044;
import com.web.dao.IBookDAO_24133044;
import com.web.model.Book_24133044;
import com.web.model.Review_24133044;

import java.util.List;

public class BookServiceImpl_24133044 implements IBookService_24133044 {
    private IBookDAO_24133044 bookDao = new BookDAOImpl_24133044();

    @Override
    public List<Book_24133044> getBooksByPage(int page, int pageSize, String author, String publisher, String priceRange) {
        return bookDao.getBooksByPage(page, pageSize, author, publisher, priceRange);
    }

    @Override
    public int getTotalBooks(String author, String publisher, String priceRange) {
        return bookDao.getTotalBooks(author, publisher, priceRange);
    }

    @Override
    public Book_24133044 getBookById(int bookid) {
        return bookDao.getBookById(bookid);
    }

    @Override
    public List<Review_24133044> getReviewsForBook(int bookid) {
        return bookDao.getReviewsForBook(bookid);
    }

    @Override
    public boolean addReview(int userid, int bookid, String text) {
        return bookDao.addReview(userid, bookid, text);
    }

    @Override
    public boolean insertBook(Book_24133044 book) {
        return bookDao.insertBook(book);
    }

    @Override
    public boolean updateBook(Book_24133044 book) {
        return bookDao.updateBook(book);
    }

    @Override
    public boolean deleteBook(int bookid) {
        return bookDao.deleteBook(bookid);
    }
}