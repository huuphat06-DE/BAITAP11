package com.web.dao;

import com.web.model.Book_24133044;
import com.web.model.Review_24133044;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class BookDAOImpl_24133044 implements IBookDAO_24133044 {

    private static List<Book_24133044> allBooks = new ArrayList<>();
    private static List<Review_24133044> allReviews = new ArrayList<>();
    
    static {
        allBooks.add(createDummyBook(1, 123456, "Mắt Biếc", "Nguyễn Nhật Ánh", "NXB Trẻ", 50, 2, "https://dummyimage.com/150x200/5c98d6/fff&text=Mat+Biec", 150000.0));
        allBooks.add(createDummyBook(2, 123457, "Tôi Thấy Hoa Vàng Trên Cỏ Xanh", "Nguyễn Nhật Ánh", "NXB Trẻ", 40, 1, "https://dummyimage.com/150x200/5c98d6/fff&text=Hoa+Vang", 120000.0));
        allBooks.add(createDummyBook(3, 123459, "Dế Mèn Phiêu Lưu Ký", "Tô Hoài", "NXB Kim Đồng", 100, 5, "https://dummyimage.com/150x200/5c98d6/fff&text=De+Men", 85000.0));
        allBooks.add(createDummyBook(4, 123460, "Chí Phèo", "Nam Cao", "NXB Văn Học", 30, 8, "https://dummyimage.com/150x200/5c98d6/fff&text=Chi+Pheo", 90000.0));
    }

    private boolean matchFilters(Book_24133044 b, String author, String publisher, String priceRange) {
        if (author != null && !author.trim().isEmpty()) {
            if (b.getAuthorName() == null || !(b.getAuthorName().equalsIgnoreCase(author) || b.getAuthorName().contains(author))) return false;
        }
        if (publisher != null && !publisher.trim().isEmpty()) {
            if (b.getPublisher() == null || !(b.getPublisher().equalsIgnoreCase(publisher) || b.getPublisher().contains(publisher))) return false;
        }
        if (priceRange != null && !priceRange.trim().isEmpty()) {
            if (priceRange.equals("0-100000") && b.getPrice() > 100000) return false;
            if (priceRange.equals("100000-200000") && (b.getPrice() <= 100000 || b.getPrice() > 200000)) return false;
            if (priceRange.equals(">200000") && b.getPrice() <= 200000) return false;
        }
        return true;
    }

    @Override
    public List<Book_24133044> getBooksByPage(int page, int pageSize, String author, String publisher, String priceRange) {
        List<Book_24133044> list = new ArrayList<>();
        for (Book_24133044 b : allBooks) {
            if (matchFilters(b, author, publisher, priceRange)) {
                list.add(b);
            }
        }
        
        int start = (page - 1) * pageSize;
        int end = Math.min(start + pageSize, list.size());
        if (start < list.size()) {
            return list.subList(start, end);
        }
        return new ArrayList<>();
    }

    @Override
    public int getTotalBooks(String author, String publisher, String priceRange) {
        int count = 0;
        for (Book_24133044 b : allBooks) {
            if (matchFilters(b, author, publisher, priceRange)) {
                count++;
            }
        }
        return count;
    }

    @Override
    public Book_24133044 getBookById(int id) {
        for (Book_24133044 book : allBooks) {
            if (book.getBookid() == id) {
                return book;
            }
        }
        return null;
    }

    @Override
    public List<Review_24133044> getReviewsForBook(int bookid) {
        List<Review_24133044> result = new ArrayList<>();
        for(Review_24133044 r : allReviews) {
            if(r.getBookid() == bookid) {
                result.add(r);
            }
        }
        return result;
    }

    @Override
    public boolean addReview(int userid, int bookid, String text) {
        Review_24133044 r = new Review_24133044();
        r.setUserid(userid);
        r.setBookid(bookid);
        r.setReviewText(text);
        allReviews.add(r);
        return true;
    }

    @Override
    public boolean insertBook(Book_24133044 book) {
        int maxId = 0;
        for (Book_24133044 b : allBooks) {
            if (b.getBookid() > maxId) maxId = b.getBookid();
        }
        book.setBookid(maxId + 1);
        if(book.getPublishDate() == null) {
            book.setPublishDate(new Date(System.currentTimeMillis()));
        }
        allBooks.add(book);
        return true;
    }

    @Override
    public boolean updateBook(Book_24133044 book) {
        for (int i = 0; i < allBooks.size(); i++) {
            if (allBooks.get(i).getBookid() == book.getBookid()) {
                if(book.getPublishDate() == null) {
                    book.setPublishDate(allBooks.get(i).getPublishDate());
                }
                allBooks.set(i, book);
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean deleteBook(int bookid) {
        for (int i = 0; i < allBooks.size(); i++) {
            if (allBooks.get(i).getBookid() == bookid) {
                allBooks.remove(i);
                return true;
            }
        }
        return false;
    }

    private static Book_24133044 createDummyBook(int id, int isbn, String title, String author, String pub, int qty, int rv, String img, double price) {
        Book_24133044 b = new Book_24133044();
        b.setBookid(id); b.setIsbn(isbn); b.setTitle(title); b.setAuthorName(author);
        b.setPublisher(pub); b.setQuantity(qty); b.setReviewCount(rv); b.setCoverImage(img);
        b.setPublishDate(new Date(System.currentTimeMillis()));
        b.setPrice(price);
        return b;
    }
}